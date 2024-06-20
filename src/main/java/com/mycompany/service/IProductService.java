/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service;

import com.mycompany.model.ProductModel;
import com.mycompany.paging.PageRequest;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface IProductService {

    List<ProductModel> findAll(PageRequest page);

    ProductModel findOne(int id);

    List<ProductModel> findByCategoryId(int id);

    List<ProductModel> findRelatedProducts(int id, int id_ctbrand);

    ProductModel insertSPC(ProductModel product);

    ProductModel insertSPNCC(ProductModel product);

    ProductModel updateSPC(ProductModel product);

    ProductModel updateSPNCC(ProductModel product);

    void deleteSPC(int[] ids);

    void deleteSPNCC(int[] ids);

    int getTotalItem();
    
    int getTotalItemBySearch(PageRequest page);
}
