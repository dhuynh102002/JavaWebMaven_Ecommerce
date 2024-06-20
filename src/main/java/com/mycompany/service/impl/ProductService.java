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
    public List<ProductModel> findByCategoryId(int id) {
        return productDAO.findByCategoryId(id);
    }

    @Override
    public List<ProductModel> findRelatedProducts(int id, int id_ctbrand) {
        return productDAO.findRelatedProducts(id, id_ctbrand);
    }

    @Override
    public ProductModel insertSPC(ProductModel product) {
        int id = productDAO.insertSPC(product);
        return productDAO.findOne(id);
    }

    @Override
    public ProductModel insertSPNCC(ProductModel product) {
        int id = productDAO.insertSPNCC(product);
        return productDAO.findOne(id);
    }

    @Override
    public ProductModel updateSPC(ProductModel product) {
        productDAO.updateSPC(product);
        return productDAO.findOne(product.getId());
    }

    @Override
    public ProductModel updateSPNCC(ProductModel product) {
        productDAO.updateSPNCC(product);
        return productDAO.findOne(product.getId());
    }

    @Override
    public void deleteSPC(int[] ids) {
        for (int id : ids) {
            productDAO.deleteSPC(id);
        }
    }

    @Override
    public void deleteSPNCC(int[] ids) {
        for (int id : ids) {
            productDAO.deleteSPNCC(id);
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
