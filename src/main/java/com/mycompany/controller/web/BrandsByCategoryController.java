/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.controller.web;

import com.google.gson.Gson;
import com.mycompany.model.BrandModel;
import com.mycompany.paging.PageRequest;
import com.mycompany.service.impl.BrandService;
import com.mycompany.service.impl.CategoryService;
import com.mycompany.service.impl.ProductService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(urlPatterns = {"/BrandsByCategoryController"})
public class BrandsByCategoryController extends HttpServlet {

    private ProductService productService;
    private CategoryService cateService;
    private BrandService brandService;

    public BrandsByCategoryController() {
        this.productService = new ProductService();
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
            out.println("<title>Servlet BrandsByCategoryController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BrandsByCategoryController at " + request.getContextPath() + "</h1>");
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
        int categoryId = Integer.parseInt(request.getParameter("category"));
        List<BrandModel> brands = new ArrayList<>();
        if (categoryId==0) {
            brands = brandService.findAll(new PageRequest());
        }
        else{
            brands = brandService.findBrandsByCategory(categoryId);
        }

        System.out.println("Brands......" + brands.toString());

        // Convert the list of brands to JSON
        Gson gson = new Gson();
        String json = gson.toJson(brands);

        // Set response type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Write the JSON response
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
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
