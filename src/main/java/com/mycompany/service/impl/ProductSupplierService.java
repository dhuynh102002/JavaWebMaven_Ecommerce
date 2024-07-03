/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service.impl;

import com.mycompany.dao.impl.ProductDAO;
import com.mycompany.dao.impl.ProductSupplierDAO;
import com.mycompany.model.ProductModel;
import com.mycompany.model.ProductSupplierModel;
import com.mycompany.paging.PageRequest;
import com.mycompany.service.IProductSupplierService;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class ProductSupplierService implements IProductSupplierService {

    private ProductSupplierDAO productSupplierDAO;

    public ProductSupplierService() {
        this.productSupplierDAO = new ProductSupplierDAO();
    }

    @Override
    public List<ProductSupplierModel> findAll(PageRequest page) {
        return productSupplierDAO.findAll(page);
    }

    @Override
    public ProductSupplierModel findOne(int id) {
        return productSupplierDAO.findOne(id);
    }

    @Override
    public ProductSupplierModel insert(ProductSupplierModel product) {
        int id = productSupplierDAO.insert(product);
        return productSupplierDAO.findOne(id);
    }

    @Override
    public ProductSupplierModel update(ProductSupplierModel product) {
        productSupplierDAO.update(product);
        return productSupplierDAO.findOne(product.getId());
    }

    @Override
    public void delete(int[] ids) {
        ProductDAO proDAO = new ProductDAO();
        for (int id : ids) {
            //xóa khóa ngoại
            ProductModel proModel = proDAO.findOneByNCC(id);
            if (proModel != null) {
                proDAO.delete(proModel.getId());
            }
            productSupplierDAO.delete(id);
        }
    }

    @Override
    public int getTotalItem() {
        return productSupplierDAO.getTotalItem();
    }

    @Override
    public int getTotalItemBySearch(PageRequest page) {
        return productSupplierDAO.getTotalItemBySearch(page);
    }

    @Override
    public List<ProductSupplierModel> findItems_NotIn_ProductSales() {
        return productSupplierDAO.findItems_NotIn_ProductSales();
    }

}
