/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service.impl;

import com.mycompany.dao.impl.ProductDAO;
import com.mycompany.model.ProductModel;
import com.mycompany.paging.PageRequest;
import com.mycompany.service.IProductService;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class ProductService implements IProductService {

    private ProductDAO productDAO;

    public ProductService() {
        this.productDAO = new ProductDAO();
    }

    @Override
    public List<ProductModel> findAll(PageRequest page) {
        return productDAO.findAll(page);
    }

    @Override
    public ProductModel findOne(int id) {
        return productDAO.findOne(id);
    }

    @Override
    public List<ProductModel> findRelatedProducts(int id, int id_ctbrand) {
        return productDAO.findRelatedProducts(id, id_ctbrand);
    }

    @Override
    public ProductModel insert(ProductModel product) {
        int id = productDAO.insert(product);
        return productDAO.findOne(id);
    }

    @Override
    public ProductModel update(ProductModel product) {
        productDAO.update(product);
        return productDAO.findOne(product.getId());
    }
    
    @Override
    public void delete(int[] ids) {
        for (int id : ids) {
            productDAO.delete(id);
        }
    }
    
    @Override
    public int getTotalItem() {
        return productDAO.getTotalItem();
    }

    @Override
    public int getTotalItemBySearch(PageRequest page) {
        return productDAO.getTotalItemBySearch(page);
    }

}
