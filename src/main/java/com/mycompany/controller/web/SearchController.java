/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.controller.web;

import com.google.gson.Gson;
import com.mycompany.model.BrandModel;
import com.mycompany.model.ProductModel;
import com.mycompany.paging.PageRequest;
import com.mycompany.service.impl.BrandService;
import com.mycompany.service.impl.CategoryService;
import com.mycompany.service.impl.ProductService;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(urlPatterns = {"/SearchController"})
public class SearchController extends HttpServlet {

    private ProductService productService;
    private CategoryService cateService;
    private BrandService brandService;

    public SearchController() {
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
            out.println("<title>Servlet SearchController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchController at " + request.getContextPath() + "</h1>");
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
         // Get the search parameters from the request
        String name = request.getParameter("nameSP");
        String categoryId = request.getParameter("category");
        String[] brands = request.getParameterValues("brand");
        String[] ratings = request.getParameterValues("ratingFilter");
        String pageStr = request.getParameter("page");

        int pageNumber = pageStr != null ? Integer.parseInt(pageStr) : 1;
        int maxPageItem = 8;

        // Log the parameters for debugging
        System.out.println("name: " + name);
        System.out.println("categoryId: " + categoryId);
        System.out.println("brands: " + String.join(", ", brands != null ? brands : new String[0]));
        System.out.println("ratings: " + String.join(", ", ratings != null ? ratings : new String[0]));
        System.out.println("pageNumber: " + pageNumber);

        PageRequest page = new PageRequest(pageNumber, maxPageItem, name, categoryId, brands, ratings);
        ProductModel proModel = new ProductModel();
        proModel.setListResult(productService.findAll(page));
        proModel.setTotalItem(productService.getTotalItemBySearch(page));
        proModel.setPage(pageNumber);
        proModel.setMaxPageItem(maxPageItem);
        proModel.setTotalPage((int) Math.ceil((double) proModel.getTotalItem() / proModel.getMaxPageItem()));

        
        System.out.println("getTotalItem..." + proModel.getTotalItem());
        System.out.println("getPage..." + proModel.getPage());
        System.out.println("getMaxPageItem..." + proModel.getMaxPageItem());
        System.out.println("getTotalPage..." + proModel.getTotalPage());
        
        
        
        
        // Convert the search results to JSON
        Gson gson = new Gson();
        String jsonResults = gson.toJson(proModel);

        // Set the response type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Write the JSON response
        PrintWriter out = response.getWriter();
        out.print(jsonResults);
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
