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
    ProductModel findOneByNCC(int id_spncc);
    List<ProductModel> findRelatedProducts(int id, int id_ctbrand);
    int insert(ProductModel product);
    void update(ProductModel product);
    void delete(int id);
    int getTotalItem();
    int getTotalItemBySearch(PageRequest page);
    
}
