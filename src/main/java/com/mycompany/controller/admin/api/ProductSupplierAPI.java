/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.mycompany.constant.SystemConstant;
import com.mycompany.model.BrandModel;
import com.mycompany.model.CTBrandModel;
import com.mycompany.model.CategoryModel;
import com.mycompany.model.ProductModel;
import com.mycompany.model.ProductSupplierModel;
import com.mycompany.paging.PageRequest;
import com.mycompany.service.impl.BrandService;
import com.mycompany.service.impl.CTBrandService;
import com.mycompany.service.impl.CategoryService;
import com.mycompany.service.impl.ProductService;
import com.mycompany.service.impl.ProductSupplierService;
import com.mycompany.utils.FormUtil;
import com.mycompany.utils.HttpUtil;
import com.mycompany.utils.MessageUtil;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(urlPatterns = {"/admin-product-supplier", "/api-admin-product-supplier"})
public class ProductSupplierAPI extends HttpServlet {

    private ProductSupplierService productSupplierService;
    private CategoryService cateService;
    private BrandService brandService;
    private CTBrandService ctbrandService;

    public ProductSupplierAPI() {
        this.productSupplierService = new ProductSupplierService();
        this.cateService = new CategoryService();
        this.brandService = new BrandService();
        this.ctbrandService = new CTBrandService();
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
            out.println("<title>Servlet ProductSupplierAPI</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductSupplierAPI at " + request.getContextPath() + "</h1>");
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
        //hiển thị Brand
        BrandModel brandModel = new BrandModel();
        if (action == null) {
            ProductSupplierModel proModel = FormUtil.toModel(ProductSupplierModel.class, request);
            String view = "";
            if (proModel.getType().equals(SystemConstant.LIST)) {
                proModel.setListResult(productSupplierService.findAll(new PageRequest()));
                view = "/views/admin/product/supplier/list.jsp";
            } else if (proModel.getType().equals(SystemConstant.EDIT)) {
                if (proModel.getId() != null) {
                    proModel = productSupplierService.findOne(proModel.getId());
                    brandModel.setListResult(brandService.findBrandsByCategory(proModel.getCategory().getId()));
                } else {
                    brandModel.setListResult(brandService.findAll(new PageRequest()));
                }
                //hiển thị Category
                CategoryModel cateModel = new CategoryModel();
                cateModel.setListResult(cateService.findAll(new PageRequest()));

                request.setAttribute(SystemConstant.CATEGORY_MODEL, cateModel);
                request.setAttribute(SystemConstant.BRAND_MODEL, brandModel);
                view = "/views/admin/product/supplier/edit.jsp";
            }
            MessageUtil.showMessage(request);
            request.setAttribute(SystemConstant.PRODUCT_SUPPLIER_MODEL, proModel);
            RequestDispatcher rd = request.getRequestDispatcher(view);
            rd.forward(request, response);
        } else if (action.equals("getListBrandByCategoryId")) {
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            brandModel.setListResult(brandService.findBrandsByCategory(categoryId));
            // Convert the search results to JSON
            String jsonResults = new Gson().toJson(brandModel.getListResult());
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
        ProductSupplierModel proModel = HttpUtil.of(request.getReader()).toModel(ProductSupplierModel.class);
        //id_ctbrand
        CTBrandModel ctbrand = ctbrandService.findId(proModel.getCategoryId(), proModel.getBrandId());
        proModel.setId_ctBrand(ctbrand.getId());
        proModel = productSupplierService.insert(proModel);
        objectMapper.writeValue(response.getOutputStream(), proModel);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        ProductSupplierModel proModel = HttpUtil.of(request.getReader()).toModel(ProductSupplierModel.class);
        //id_ctbrand
        CTBrandModel ctbrand = ctbrandService.findId(proModel.getCategoryId(), proModel.getBrandId());
        proModel.setId_ctBrand(ctbrand.getId());
        
        proModel = productSupplierService.update(proModel);
        objectMapper.writeValue(response.getOutputStream(), proModel);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        ProductSupplierModel proModel = HttpUtil.of(request.getReader()).toModel(ProductSupplierModel.class);
        productSupplierService.delete(proModel.getIds());
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
