/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.controller.web;

import com.mycompany.constant.SystemConstant;
import com.mycompany.model.BrandModel;
import com.mycompany.model.CategoryModel;
import com.mycompany.model.ProductModel;
import com.mycompany.model.RoleModel;
import com.mycompany.model.UserModel;
import com.mycompany.paging.IPageble;
import com.mycompany.paging.PageRequest;
import com.mycompany.service.IProductService;
import com.mycompany.service.impl.BrandService;
import com.mycompany.service.impl.CategoryService;
import com.mycompany.service.impl.ProductService;
import com.mycompany.service.impl.UserService;
import com.mycompany.sort.Sorter;
import com.mycompany.utils.FormUtil;
import com.mycompany.utils.MailerUtil;
import com.mycompany.utils.MessageUtil;
import com.mycompany.utils.SessionUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
//url: /login: do có method "post" submit form login
@WebServlet(name = "HomeController", urlPatterns = {"/index", "/authen", "/logout"})
public class HomeController extends HttpServlet {

    private ProductService productService;
    private UserService userService;
    private CategoryService cateService;
    private BrandService brandService;

    public HomeController() {
        this.productService = new ProductService();
        this.userService = new UserService();
        this.cateService = new CategoryService();
        this.brandService = new BrandService();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductModel proModel = FormUtil.toModel(ProductModel.class, request);
        String action = request.getParameter("action");
        if (action != null && action.equals("login")) {
            MessageUtil.showMessage(request); //setAttribute: messageResponse và alert
            RequestDispatcher rd = request.getRequestDispatcher("/views/authen/login.jsp");
            rd.forward(request, response);

        } else if (action != null && action.equals("logout")) {
            SessionUtil.getInstance().removeValue(request, "USERMODEL");
            response.sendRedirect(request.getContextPath() + "/index");

        } else if (action != null && action.equals("register")) {
            MessageUtil.showMessage(request); //setAttribute: messageResponse và alert
            RequestDispatcher rd = request.getRequestDispatcher("/views/authen/register.jsp");
            rd.forward(request, response);

        } else if (action != null && action.equals("forgot-password")) {
            String status = request.getParameter("status");
            if (status == null || status.equals("")) {//RESET_CODE //USER_EMAIL
                if (SessionUtil.getInstance().getValue(request, "RESET_CODE") != null) {
                    SessionUtil.getInstance().removeValue(request, "RESET_CODE");
                }
                if (SessionUtil.getInstance().getValue(request, "USER_EMAIL") != null) {
                    SessionUtil.getInstance().removeValue(request, "USER_EMAIL");
                }
            }
            String codeStatus = request.getParameter("codeStatus");
            request.setAttribute("codeStatus", codeStatus);
            MessageUtil.showMessage(request); //setAttribute: messageResponse và alert
            RequestDispatcher rd = request.getRequestDispatcher("/views/authen/forgot-password.jsp");
            rd.forward(request, response);

        } else { //url: /index (no parameter "action")
            Sorter sorter = new Sorter(proModel.getSortName(), proModel.getSortBy());
            proModel.setPage(proModel.getPage() != null ? proModel.getPage() : 1);
            proModel.setMaxPageItem(proModel.getMaxPageItem() != null ? proModel.getMaxPageItem() : 8);
            PageRequest page = new PageRequest(proModel.getPage(), proModel.getMaxPageItem(), sorter);
            proModel.setListResult(productService.findAll(page));

            //tính tổng trang dựa trên tổng sản phẩm
            proModel.setTotalItem(productService.getTotalItemBySearch(page));
            proModel.setTotalPage((int) Math.ceil((double) proModel.getTotalItem() / proModel.getMaxPageItem()));

            //hiển thị Category
            CategoryModel cateModel = new CategoryModel();
            cateModel.setListResult(cateService.findAll(new PageRequest()));

            //hiển thị Brand
            BrandModel brandModel = new BrandModel();
            brandModel.setListResult(brandService.findAll(new PageRequest()));

            request.setAttribute(SystemConstant.PRODUCT_MODEL, proModel);
            request.setAttribute(SystemConstant.CATEGORY_MODEL, cateModel);
            request.setAttribute(SystemConstant.BRAND_MODEL, brandModel);
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/home.jsp");
            rd.forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("action..." + action);
        if (action != null && action.equals("login")) {
            UserModel userModel = FormUtil.toModel(UserModel.class, request);
            userModel = userService.findByUserNameAndPasswordAndStatus(userModel.getEmail(),
                    userModel.getPassword(), 1);
            if (userModel != null) {
                SessionUtil.getInstance().putValue(request, "USERMODEL", userModel);
                if (userModel.getRole().getCode().equals("USER")) {
                    response.sendRedirect(request.getContextPath() + "/index");
                } else if (userModel.getRole().getCode().equals("ADMIN")) {
                    response.sendRedirect(request.getContextPath() + "/admin-home");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/authen?action=login&message=email_password_invalid&alert=danger");
            }
        } else if (action != null && action.equals("register")) {
            UserModel userModel = FormUtil.toModel(UserModel.class, request);
            System.out.println("userModel: " + userModel.toString());
            String re_password = request.getParameter("repeat_password");
            if (re_password.equals(userModel.getPassword())) {
                if (userService.findOne(userModel.getEmail()) == null) {
                    userModel.setStatus(1);
                    RoleModel role = new RoleModel();
                    role.setId(3);
                    userModel.setRole(role);

                    System.out.println("userModel_addRole: " + userModel.toString());

                    userModel = userService.insertUser(userModel);
                    if (userModel != null) {
                        SessionUtil.getInstance().putValue(request, "USERMODEL", userModel);
                        response.sendRedirect(request.getContextPath() + "/index");
                    } else {
                        userModel.setType(request.getParameter("repeat_password"));
                        request.setAttribute("userInfo", userModel);
                        request.setAttribute("message", "Error System");
                        request.setAttribute("alert", "danger");
                        RequestDispatcher rd = request.getRequestDispatcher("/views/authen/register.jsp");
                        rd.forward(request, response);
//                        response.sendRedirect(request.getContextPath() + "/authen?action=register&message=error_system&alert=danger");
                    }
                } else {
                    userModel.setType(request.getParameter("repeat_password"));
                    request.setAttribute("userInfo", userModel);
                    request.setAttribute("message", "Email has been used");
                    request.setAttribute("alert", "danger");
                    RequestDispatcher rd = request.getRequestDispatcher("/views/authen/register.jsp");
                    rd.forward(request, response);
//                    response.sendRedirect(request.getContextPath() + "/authen?action=register&message=email_used&alert=danger");
                }
            } else {
                userModel.setType(request.getParameter("repeat_password"));
                request.setAttribute("userInfo", userModel);
                request.setAttribute("message", "Password and repeat password do not match");
                request.setAttribute("alert", "danger");
                RequestDispatcher rd = request.getRequestDispatcher("/views/authen/register.jsp");
                rd.forward(request, response);
//                response.sendRedirect(request.getContextPath() + "/authen?action=register&message=pass_repass_no_match&alert=danger");
            }
        } else if (action != null && action.equals("send-email")) {
            String email = request.getParameter("email");
            if (userService.findOne(email) != null) {
                Random random = new Random();
                int code = 1000 + random.nextInt(9000);
                String codeString = String.valueOf(code);

                SessionUtil.getInstance().putValue(request, "RESET_CODE", codeString);
                SessionUtil.getInstance().putValue(request, "USER_EMAIL", email);

                //sendMail
                String subject = "Password Reset Code";
                StringBuilder htmlContent = new StringBuilder();
                htmlContent.append("<!DOCTYPE html>\n")
                        .append("<html lang=\"vi\">\n") // Đảm bảo sử dụng ngôn ngữ tiếng Việt
                        .append("<head>\n")
                        .append("<meta charset=\"UTF-8\">\n") // Đảm bảo sử dụng charset UTF-8
                        .append("<title>Password Reset Code</title>\n")
                        .append("</head>\n")
                        .append("<body>")
                        .append("Your password reset code is: <span style=\"font-weight:bold;color: black\">").append(code).append("</span><br>")
                        .append("</body>")
                        .append("</html>");
                MailerUtil.sendMail(email, subject, htmlContent.toString());

                response.sendRedirect(request.getContextPath() + "/authen?action=forgot-password&status=1&message=code_sent&alert=success");
            } else {
                response.sendRedirect(request.getContextPath() + "/authen?action=forgot-password&status=1&message=email_not_found&alert=danger");
            }
        } else if (action != null && action.equals("verify-code")) {
            String enteredCode = request.getParameter("code");
            String sessionCode = (String) SessionUtil.getInstance().getValue(request, "RESET_CODE");

            if (enteredCode.equals(sessionCode)) {
                response.sendRedirect(request.getContextPath() + "/authen?action=forgot-password&status=1&codeStatus=valid");
            } else {
                response.sendRedirect(request.getContextPath() + "/authen?action=forgot-password&status=1&codeStatus=invalid");
            }
        } else if (action != null && action.equals("reset-password")) {
            String newPassword = request.getParameter("password");
            String repeatPassword = request.getParameter("repeat_password");
            String email = (String) SessionUtil.getInstance().getValue(request, "USER_EMAIL");

            if (newPassword.equals(repeatPassword)) {
                UserModel userModel = userService.findOne(email);
                userModel.setPassword(newPassword);
                userModel = userService.updateUser(userModel);
                SessionUtil.getInstance().removeValue(request, "RESET_CODE");
                SessionUtil.getInstance().removeValue(request, "USER_EMAIL");
                response.sendRedirect(request.getContextPath() + "/authen?action=login&message=password_reset_success&alert=success");

            } else {
                response.sendRedirect(request.getContextPath() + "/authen?action=forgot-password&status=1&codeStatus=valid&message=pass_repass_no_match&alert=danger");
            }
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
