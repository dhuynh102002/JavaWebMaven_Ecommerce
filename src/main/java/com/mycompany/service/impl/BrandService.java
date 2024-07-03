/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service.impl;

import com.mycompany.dao.impl.BrandDAO;
import com.mycompany.model.BrandModel;
import com.mycompany.paging.PageRequest;
import com.mycompany.service.IBrandService;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class BrandService implements IBrandService{
    
    private BrandDAO brandDao;

    public BrandService() {
        this.brandDao = new BrandDAO();
    }

    @Override
    public List<BrandModel> findAll(PageRequest page) {
        return brandDao.findAll(page);
    }

    @Override
    public List<BrandModel> findBrandsByCategory(int idCategory) {
        return brandDao.findBrandsByCategory(idCategory);
    }

    @Override
    public BrandModel findOne(int id) {
        return brandDao.findOne(id);
    }

    @Override
    public BrandModel insertBrand(BrandModel brand) {
        int id = brandDao.insertBrand(brand);
        return brandDao.findOne(id);
    }

    @Override
    public BrandModel updateBrand(BrandModel brand) {
        brandDao.updateBrand(brand);
        return brandDao.findOne(brand.getId());
    }

    @Override
    public void deleteBrand(int[] ids) {
        for(int id : ids ){
            brandDao.deleteBrand(id);
        }
    }

    @Override
    public int getTotalItem() {
        return brandDao.getTotalItem();
    }
    
}
