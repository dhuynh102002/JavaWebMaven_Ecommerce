/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.controller.web;

import com.google.gson.Gson;
import com.mycompany.constant.SystemConstant;
import com.mycompany.model.OrderDetailsModel;
import com.mycompany.model.OrderModel;
import com.mycompany.model.UserModel;
import com.mycompany.paging.PageRequest;
import com.mycompany.service.impl.OrderDetailsService;
import com.mycompany.service.impl.OrderService;
import com.mycompany.sort.Sorter;
import com.mycompany.utils.FormUtil;
import com.mycompany.utils.SessionUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(urlPatterns = {"/order-history"})
public class OrderHistoryController extends HttpServlet {

    private OrderService orderService;
    private OrderDetailsService orderDetailsService;

    public OrderHistoryController() {
        this.orderService = new OrderService();
        this.orderDetailsService = new OrderDetailsService();
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
            out.println("<title>Servlet OrderHistoryController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderHistoryController at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        System.out.println("action..." + action);
        if (action != null && action.equals("details")) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            List<OrderDetailsModel> orderDetails = orderDetailsService.findOrderDetails(orderId);
            
            System.out.println("orderDetails: " + orderDetails.toString());
            
            // Trả về kết quả dưới dạng JSON
            Gson gson = new Gson();
            String jsonResponse = gson.toJson(orderDetails);

            response.setContentType("application/json");
            response.getWriter().write(jsonResponse);
            
        } else { //no action
            UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
            OrderModel orderModel = FormUtil.toModel(OrderModel.class, request);
            //PageRequest
            Sorter sorter = new Sorter(orderModel.getSortName(), orderModel.getSortBy());
            orderModel.setPage(orderModel.getPage() != null ? orderModel.getPage() : null);
            orderModel.setMaxPageItem(orderModel.getMaxPageItem() != null ? orderModel.getMaxPageItem() : null);
            PageRequest page = new PageRequest(orderModel.getPage(), orderModel.getMaxPageItem(), sorter);

            orderModel.setListResult(orderService.findByUser(userModel.getId(), page));
            System.out.println(orderModel.getListResult().toString());

            request.setAttribute(SystemConstant.ORDER_MODEL, orderModel);
            request.setAttribute("userModel", userModel);
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/order_history.jsp");
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
        processRequest(request, response);
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
