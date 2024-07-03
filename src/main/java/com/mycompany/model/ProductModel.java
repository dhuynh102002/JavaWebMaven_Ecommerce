/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.model;

/**
 *
 * @author ASUS
 */
public class ProductModel extends AbstractModel<ProductModel>{
    private double price;
    private int quantity; //số lượng bán
    private Integer id_spncc;
    private ProductSupplierModel productSupplier;
    private double rating;
    private int discount;

    public ProductModel() {
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Integer getId_spncc() {
        return id_spncc;
    }

    public void setId_spncc(Integer id_spncc) {
        this.id_spncc = id_spncc;
    }

    public ProductSupplierModel getProductSupplier() {
        return productSupplier;
    }

    public void setProductSupplier(ProductSupplierModel productSupplier) {
        this.productSupplier = productSupplier;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    @Override
    public String toString() {
        return "ProductModel{" + "price=" + price + ", quantity=" + quantity + ", id_spncc=" + id_spncc + ", productSupplier=" + productSupplier + ", rating=" + rating + ", discount=" + discount + '}';
    }

    
}
