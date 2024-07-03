/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service;

import com.mycompany.model.ProductSupplierModel;
import com.mycompany.paging.PageRequest;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface IProductSupplierService {

    List<ProductSupplierModel> findAll(PageRequest page);

    ProductSupplierModel findOne(int id);

    ProductSupplierModel insert(ProductSupplierModel product);

    ProductSupplierModel update(ProductSupplierModel product);

    void delete(int[] ids);

    int getTotalItem();

    int getTotalItemBySearch(PageRequest page);
    
    List<ProductSupplierModel> findItems_NotIn_ProductSales();
}
