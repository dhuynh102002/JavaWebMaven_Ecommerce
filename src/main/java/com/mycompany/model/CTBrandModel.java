/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.model;

/**
 *
 * @author ASUS
 */
public class CTBrandModel extends AbstractModel<CTBrandModel>{
    private int id_brand;
    private int id_category;

    public CTBrandModel() {
    }

    public int getId_brand() {
        return id_brand;
    }

    public void setId_brand(int id_brand) {
        this.id_brand = id_brand;
    }

    public int getId_category() {
        return id_category;
    }

    public void setId_category(int id_category) {
        this.id_category = id_category;
    }

    @Override
    public String toString() {
        return "CTBrandModel{" + "id_brand=" + id_brand + ", id_category=" + id_category + '}';
    }
    
    
}
