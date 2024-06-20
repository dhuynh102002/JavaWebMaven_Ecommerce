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
    private double priceSP;
    private int quantitySP; //số lượng bán
    private int quantityNCC; //số lượng nhà cung cấp
    private int id_spnccSP;
    private int id_ctBrand;
    private String nameSP;
    private CategoryModel categorySP;
    private BrandModel brandSP;
    private String descriptionSP;
    private String originSP;
    private String imageSP;
    private String imageSP1;
    private String imageSP2;
    private String imageSP3;
    private double ratingSP;
    private int discountSP;
    private int id_producer;

    public ProductModel() {
    }

    public double getPriceSP() {
        return priceSP;
    }

    public void setPriceSP(double priceSP) {
        this.priceSP = priceSP;
    }

    public int getQuantitySP() {
        return quantitySP;
    }

    public void setQuantitySP(int quantitySP) {
        this.quantitySP = quantitySP;
    }

    public int getQuantityNCC() {
        return quantityNCC;
    }

    public void setQuantityNCC(int quantityNCC) {
        this.quantityNCC = quantityNCC;
    }

    public int getId_spnccSP() {
        return id_spnccSP;
    }

    public void setId_spnccSP(int id_spnccSP) {
        this.id_spnccSP = id_spnccSP;
    }

    public int getId_ctBrand() {
        return id_ctBrand;
    }

    public void setId_ctBrand(int id_ctBrand) {
        this.id_ctBrand = id_ctBrand;
    }
 
    public String getNameSP() {
        return nameSP;
    }

    public void setNameSP(String nameSP) {
        this.nameSP = nameSP;
    }

    public CategoryModel getCategorySP() {
        return categorySP;
    }

    public void setCategorySP(CategoryModel categorySP) {
        this.categorySP = categorySP;
    }

    public BrandModel getBrandSP() {
        return brandSP;
    }

    public void setBrandSP(BrandModel brandSP) {
        this.brandSP = brandSP;
    }

    public String getDescriptionSP() {
        return descriptionSP;
    }

    public void setDescriptionSP(String descriptionSP) {
        this.descriptionSP = descriptionSP;
    }

    public String getOriginSP() {
        return originSP;
    }

    public void setOriginSP(String originSP) {
        this.originSP = originSP;
    }

    public String getImageSP() {
        return imageSP;
    }

    public void setImageSP(String imageSP) {
        this.imageSP = imageSP;
    }

    public String getImageSP1() {
        return imageSP1;
    }

    public void setImageSP1(String imageSP1) {
        this.imageSP1 = imageSP1;
    }

    public String getImageSP2() {
        return imageSP2;
    }

    public void setImageSP2(String imageSP2) {
        this.imageSP2 = imageSP2;
    }

    public String getImageSP3() {
        return imageSP3;
    }

    public void setImageSP3(String imageSP3) {
        this.imageSP3 = imageSP3;
    }

    public double getRatingSP() {
        return ratingSP;
    }

    public void setRatingSP(double ratingSP) {
        this.ratingSP = ratingSP;
    }

    public int getDiscountSP() {
        return discountSP;
    }

    public void setDiscountSP(int discountSP) {
        this.discountSP = discountSP;
    }

    public int getId_producer() {
        return id_producer;
    }

    public void setId_producer(int id_producer) {
        this.id_producer = id_producer;
    }

    @Override
    public String toString() {
        return "ProductModel{" + "priceSP=" + priceSP + ", quantitySP=" + quantitySP + ", id_spnccSP=" + id_spnccSP + ", id_ctBrand=" + id_ctBrand + ", nameSP=" + nameSP + ", categorySP=" + categorySP + ", brandSP=" + brandSP + ", descriptionSP=" + descriptionSP + ", originSP=" + originSP + ", imageSP=" + imageSP + ", imageSP1=" + imageSP1 + ", imageSP2=" + imageSP2 + ", imageSP3=" + imageSP3 + ", ratingSP=" + ratingSP + ", discountSP=" + discountSP + ", id_producer=" + id_producer + '}';
    }
    
    
    
}
