/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.model;

/**
 *
 * @author ASUS
 */
public class OrderDetailsModel extends AbstractModel<OrderDetailsModel>{
    private int id_order;
    private ProductModel product;
    private int quantity;
    private double price;

    public OrderDetailsModel() {
    }

    public int getId_order() {
        return id_order;
    }

    public void setId_order(int id_order) {
        this.id_order = id_order;
    }

    public ProductModel getProduct() {
        return product;
    }

    public void setProduct(ProductModel product) {
        this.product = product;
    }    

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderDetailsModel{" + "id_order=" + id_order + ", product=" + product.getId() + ", quantity=" + quantity + ", price=" + price + '}';
    }

    
    
    
}
