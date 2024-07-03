/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.controller.web;

import com.google.gson.Gson;
import com.mycompany.model.OrderDetailsModel;
import com.mycompany.model.OrderModel;
import com.mycompany.model.OrderStatusModel;
import com.mycompany.model.ProductModel;
import com.mycompany.model.UserModel;
import com.mycompany.service.impl.OrderDetailsService;
import com.mycompany.service.impl.OrderService;
import com.mycompany.service.impl.OrderStatusService;
import com.mycompany.service.impl.ProductService;
import com.mycompany.utils.FormUtil;
import com.mycompany.utils.MailerUtil;
import com.mycompany.utils.SessionUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
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
@WebServlet(urlPatterns = {"/shoppingcart"})
public class ShoppingCartController extends HttpServlet {

    private ProductService productService;
    private OrderService orderService;
    private OrderDetailsService orderDetailsService;
    private OrderStatusService orderStatusService;

    public ShoppingCartController() {
        this.productService = new ProductService();
        this.orderService = new OrderService();
        this.orderDetailsService = new OrderDetailsService();
        this.orderStatusService = new OrderStatusService();
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
            out.println("<title>Servlet ShoppingCartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShoppingCartController at " + request.getContextPath() + "</h1>");
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
        RequestDispatcher rd = request.getRequestDispatcher("/views/web/shopping_cart.jsp");
        rd.forward(request, response);
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
        String jsonResults = "";
        if (action.equals("add")) {
            int productId = Integer.parseInt(request.getParameter("id"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            System.out.println("ShoppingCart: " + productId + " ,quantity: " + quantity);

            SessionUtil sessionUtil = SessionUtil.getInstance();
            Map<Integer, ProductModel> cart = (Map<Integer, ProductModel>) sessionUtil.getValue(request, "CART");

            if (cart == null) {
                cart = new HashMap<>();
            }

            //product details from the database
            ProductModel productDB = productService.findOne(productId);
            String messageWarning = "";

            if (cart.containsKey(productId)) {
                ProductModel existingProduct = cart.get(productId);
                int quantityNew = existingProduct.getQuantity() + quantity;
                if (quantityNew > productDB.getQuantity()) {
                    quantityNew = productDB.getQuantity();
                    messageWarning = "Bạn đã có " + existingProduct.getQuantity() + " sản phẩm trong giỏ hàng. "
                            + (existingProduct.getQuantity() == productDB.getQuantity()
                            ? "Không thể thêm số lượng đã chọn vào giỏ hàng vì sẽ vượt quá giới hạn trong kho"
                            : "Nên chỉ thêm được " + (productDB.getQuantity() - existingProduct.getQuantity()) + " sản phẩm này vào giỏ")
                            + " (Kho: " + productDB.getQuantity() + ")";
                }
                existingProduct.setQuantity(quantityNew);
                existingProduct.setPrice(productDB.getPrice()); //price current
            } else {
                productDB.setQuantity(quantity);
                productDB.setPrice(productDB.getPrice()); //price current
                cart.put(productId, productDB);
            }

            sessionUtil.putValue(request, "CART", cart);

            int cartSize = cart.size();
            Map<String, Object> responseData = new HashMap<>();
            responseData.put("message", messageWarning);
            responseData.put("cartSize", cartSize);

            // Convert the search results to JSON
            jsonResults = new Gson().toJson(responseData);

        } else if (action.equals("remove")) {
            int productId = Integer.parseInt(request.getParameter("id"));

            Map<Integer, ProductModel> cart = (Map<Integer, ProductModel>) SessionUtil.getInstance().getValue(request, "CART");
            if (cart != null) {
                cart.remove(productId);
                SessionUtil.getInstance().putValue(request, "CART", cart);
            }

            // Convert the search results to JSON
            jsonResults = new Gson().toJson("Item removed");

        } else if (action.equals("removeAll")) {
            Map<Integer, ProductModel> cart = (Map<Integer, ProductModel>) SessionUtil.getInstance().getValue(request, "CART");
            if (cart != null) {
                SessionUtil.getInstance().removeValue(request, "CART");
            }

            // Convert the search results to JSON
            jsonResults = new Gson().toJson("All Item removed");
        } else if (action.equals("sortPrice")) {
            String order = request.getParameter("order");
            Map<Integer, ProductModel> cart = (Map<Integer, ProductModel>) SessionUtil.getInstance().getValue(request, "CART");
            if (cart != null) {
                List<ProductModel> productList = new ArrayList<>(cart.values()); // lấy list value
                
                Comparator<ProductModel> comparator = Comparator.comparingDouble(p -> (p.getPrice() * ((100 - p.getDiscount()) / 100.0)) * p.getQuantity());

                if (order.equals("ASC")) {
                    productList.sort(comparator);
                } else if (order.equals("DESC")) {
                    productList.sort(comparator.reversed());
                }
                cart.clear();
                for (ProductModel product : productList) {
                    cart.put(product.getId(), product);
                }
                SessionUtil.getInstance().putValue(request, "CART", cart);
                // Convert the search results to JSON
                jsonResults = new Gson().toJson(productList);

            }

        } else if (action.equals("checkout")) {
            OrderModel orderModel = FormUtil.toModel(OrderModel.class, request); //setPhone, setAddress
            UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
            orderModel.setId_user(userModel.getId());
            System.out.println("0: " + orderModel.getAddress() + ", " + orderModel.getPhone());
            orderModel.setStatus(orderStatusService.findOne(1));

            orderModel = orderService.insert(orderModel);
            //add details to the order
            Map<Integer, ProductModel> cart = (Map<Integer, ProductModel>) SessionUtil.getInstance().getValue(request, "CART");
            if (cart != null) {
                for (Map.Entry<Integer, ProductModel> entry : cart.entrySet()) {
                    ProductModel product = entry.getValue();

                    OrderDetailsModel orderDetailsModel = new OrderDetailsModel();
                    orderDetailsModel.setId_order(orderModel.getId());
                    orderDetailsModel.setProduct(product);
                    orderDetailsModel.setQuantity(product.getQuantity());
                    orderDetailsModel.setPrice(product.getPrice());

                    // Insert order details into the database
                    orderDetailsService.insert(orderDetailsModel);
                }
                // Send email confirmation to the user
                String subject = "Tech Store has received your order No #" + orderModel.getId();
                String emailContent = generateOrderConfirmationEmail(orderModel, cart); // Assuming you have a method to generate HTML content
                MailerUtil.sendMail(userModel.getEmail(), subject, emailContent);

                SessionUtil.getInstance().removeValue(request, "CART");
            }

            // Convert the search results to JSON
            jsonResults = new Gson().toJson("Thanh toán thành công!");

        }

        // Set the response type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Write the JSON response
        PrintWriter out = response.getWriter();
        out.print(jsonResults);
        out.flush();
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

    private String generateOrderConfirmationEmail(OrderModel orderModel, Map<Integer, ProductModel> cart) {
        StringBuilder htmlContent = new StringBuilder();
        htmlContent.append("<!DOCTYPE html>\n")
                .append("<html lang=\"vi\">\n") // Đảm bảo sử dụng ngôn ngữ tiếng Việt
                .append("<head>\n")
                .append("<meta charset=\"UTF-8\">\n") // Đảm bảo sử dụng charset UTF-8
                .append("<title>Order Confirmation</title>\n")
                .append("</head>\n")
                .append("<body>")
                .append("<h1 style=\"color: black\">Order Confirmation</h1>")
                .append("<p style=\"color: black\">Thank you for your order. Here are the details:</p>")
                .append("<span style=\"font-weight:bold;color: black\">Date: </span>").append(orderModel.getCreatedAt()).append("<br>")
                .append("<span style=\"font-weight:bold;color: black\">Phone Number: </span>").append(orderModel.getPhone()).append("<br>")
                .append("<span style=\"font-weight:bold;color: black\">Address: </span>").append(orderModel.getAddress()).append("<br>")
                .append("<span style=\"font-weight:bold;color: black\">Order Status: </span>").append(orderModel.getStatus().getName()).append("<br><br>")
                .append("<table border='1' style=\"border-collapse: collapse; width: 100%; text-align: center;\">")
                .append("<tr><th>No</th><th>Image</th><th>Name</th><th>Quantity</th><th>Price</th><th>Total</th></tr>");

        int count = 0;
        for (Map.Entry<Integer, ProductModel> entry : cart.entrySet()) {
            ProductModel product = entry.getValue();
            htmlContent.append("<tr>")
                    .append("<td>").append(++count).append("</td>")
                    .append("<td><img src='").append(product.getProductSupplier().getImage()).append("' style=\"width:150px; height:auto;\"/> </td>")
                    .append("<td>").append(product.getProductSupplier().getName()).append("</td>")
                    .append("<td>").append(product.getQuantity()).append("</td>")
                    .append("<td>").append(formatCurrency(product.getPrice())).append("</td>")
                    .append("<td>").append(formatCurrency(product.getQuantity() * product.getPrice())).append("</td>")
                    .append("</tr>");
        }

        htmlContent.append("<tr>")
                .append("<th colspan=\"5\">").append("Order Total:").append("</th>")
                .append("<td>").append(formatCurrency(calculateOrderTotal(cart))).append("</td>")
                .append("</tr>");

        htmlContent.append("</table>")
                .append("<h3 style=\"color: black\">Thank you for shopping with us!</h3>")
                .append("</body>")
                .append("</html>");

        return htmlContent.toString();
    }

    private double calculateOrderTotal(Map<Integer, ProductModel> cart) {
        double total = 0.0;
        for (Map.Entry<Integer, ProductModel> entry : cart.entrySet()) {
            ProductModel product = entry.getValue();
            total += product.getQuantity() * product.getPrice();
        }
        return total;
    }

    private String formatCurrency(double amount) {
        // Tạo một đối tượng NumberFormat cho tiền tệ của Việt Nam (VND)
        DecimalFormat formatter = (DecimalFormat) DecimalFormat.getNumberInstance(new Locale("vi", "VN"));
        return formatter.format(amount) + " VND";
    }

}
