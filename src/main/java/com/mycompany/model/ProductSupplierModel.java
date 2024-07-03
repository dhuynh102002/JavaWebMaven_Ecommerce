/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.model;

/**
 *
 * @author ASUS
 */
public class ProductSupplierModel extends AbstractModel<ProductSupplierModel>{
    private double price;
    private int quantity; //số lượng nhà cung cấp
    private int id_ctBrand;
    private String name;
    private CategoryModel category;
    private BrandModel brand;
    private int categoryId;
    private int brandId;
    private String description;
    private String origin;
    private String image;
    private String image1;
    private String image2;
    private String image3;
    private int id_producer;

    public ProductSupplierModel() {
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

    public int getId_ctBrand() {
        return id_ctBrand;
    }

    public void setId_ctBrand(int id_ctBrand) {
        this.id_ctBrand = id_ctBrand;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public CategoryModel getCategory() {
        return category;
    }

    public void setCategory(CategoryModel category) {
        this.category = category;
    }

    public BrandModel getBrand() {
        return brand;
    }

    public void setBrand(BrandModel brand) {
        this.brand = brand;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public int getId_producer() {
        return id_producer;
    }

    public void setId_producer(int id_producer) {
        this.id_producer = id_producer;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    @Override
    public String toString() {
        return "ProductSupplierModel{" + "price=" + price + ", quantity=" + quantity + ", id_ctBrand=" + id_ctBrand + ", name=" + name + ", category=" + category + ", brand=" + brand + ", description=" + description + ", origin=" + origin + ", image=" + image + ", image1=" + image1 + ", image2=" + image2 + ", image3=" + image3 + ", id_producer=" + id_producer + '}';
    }
    
    
}
