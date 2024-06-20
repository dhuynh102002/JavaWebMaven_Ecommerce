/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dao;

import com.mycompany.model.ProductModel;
import com.mycompany.paging.PageRequest;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface IProductDAO extends IGenericDAO<ProductModel>{
    List<ProductModel> findAll(PageRequest page);
    ProductModel findOne(int id);
    List<ProductModel> findByCategoryId(int id);
    List<ProductModel> findRelatedProducts(int id, int id_ctbrand);
    int insertSPC(ProductModel product);
    int insertSPNCC(ProductModel product);
    void updateSPC(ProductModel product);
    void updateSPNCC(ProductModel product);
    void deleteSPC(int id);
    void deleteSPNCC(int id);
    int getTotalItem();
    int getTotalItemBySearch(PageRequest page);
    
}
