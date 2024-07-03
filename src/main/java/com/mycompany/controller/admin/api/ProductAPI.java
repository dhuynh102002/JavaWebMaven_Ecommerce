/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.mycompany.constant.SystemConstant;
import com.mycompany.model.BrandModel;
import com.mycompany.model.CategoryModel;
import com.mycompany.model.ProductModel;
import com.mycompany.model.ProductSupplierModel;
import com.mycompany.paging.PageRequest;
import com.mycompany.service.impl.BrandService;
import com.mycompany.service.impl.CategoryService;
import com.mycompany.service.impl.ProductService;
import com.mycompany.service.impl.ProductSupplierService;
import com.mycompany.sort.Sorter;
import com.mycompany.utils.FormUtil;
import com.mycompany.utils.HttpUtil;
import com.mycompany.utils.MessageUtil;
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
@WebServlet(urlPatterns = {"/admin-product", "/api-admin-product"})
public class ProductAPI extends HttpServlet {

    private ProductService productService;
    private CategoryService cateService;
    private BrandService brandService;
    private ProductSupplierService productSupplierService;

    public ProductAPI() {
        this.productService = new ProductService();
        this.cateService = new CategoryService();
        this.brandService = new BrandService();
        this.productSupplierService = new ProductSupplierService();
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
            out.println("<title>Servlet ProductAPI</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductAPI at " + request.getContextPath() + "</h1>");
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

        if (action == null) {
            ProductModel proModel = FormUtil.toModel(ProductModel.class, request);
            String view = "";
            if (proModel.getType().equals(SystemConstant.LIST)) {
                proModel.setListResult(productService.findAll(new PageRequest()));
                view = "/views/admin/product/sales/list.jsp";
            } else if (proModel.getType().equals(SystemConstant.EDIT)) {
                if (proModel.getId() != null) {
                    proModel = productService.findOne(proModel.getId());
                }
                if (proModel.getId_spncc() != null) {
                    ProductSupplierModel proSupplierModel = productSupplierService.findOne(proModel.getId_spncc());
                    proModel.setId_spncc(proSupplierModel.getId());
                    proModel.getProductSupplier().setImage(proSupplierModel.getImage());
                    proModel.getProductSupplier().setName(proSupplierModel.getName());
                    proModel.getProductSupplier().setOrigin(proSupplierModel.getOrigin());
                    proModel.getProductSupplier().setCategory(proSupplierModel.getCategory());
                    proModel.getProductSupplier().setBrand(proSupplierModel.getBrand());
                }

                //hiển thị Category
                CategoryModel cateModel = new CategoryModel();
                cateModel.setListResult(cateService.findAll(new PageRequest()));

                //hiển thị Brand
                BrandModel brandModel = new BrandModel();
                brandModel.setListResult(brandService.findBrandsByCategory(proModel.getProductSupplier().getCategory().getId()));

                request.setAttribute(SystemConstant.CATEGORY_MODEL, cateModel);
                request.setAttribute(SystemConstant.BRAND_MODEL, brandModel);
                view = "/views/admin/product/sales/edit.jsp";
            }
            MessageUtil.showMessage(request);
            request.setAttribute(SystemConstant.PRODUCT_MODEL, proModel);
            RequestDispatcher rd = request.getRequestDispatcher(view);
            rd.forward(request, response);
        } else if (action.equals("addProduct")) {
            List<ProductSupplierModel> listProductSupplier = productSupplierService.findItems_NotIn_ProductSales();
            // Convert the search results to JSON
            String jsonResults = new Gson().toJson(listProductSupplier);
            // Set the response type to JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // Write the JSON response
            PrintWriter out = response.getWriter();
            out.print(jsonResults);
            out.flush();
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
        ObjectMapper objectMapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        ProductModel proModel = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
        proModel = productService.insert(proModel);
        objectMapper.writeValue(response.getOutputStream(), proModel);

    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        ProductModel proModel = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
        proModel = productService.update(proModel);
        objectMapper.writeValue(response.getOutputStream(), proModel);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        ProductModel proModel = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
        productService.delete(proModel.getIds());
        objectMapper.writeValue(response.getOutputStream(), "{}");
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
