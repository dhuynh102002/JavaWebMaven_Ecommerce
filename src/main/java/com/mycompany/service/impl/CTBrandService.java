/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service.impl;

import com.mycompany.dao.impl.CTBrandDAO;
import com.mycompany.model.CTBrandModel;
import com.mycompany.paging.PageRequest;
import com.mycompany.service.ICTBrandService;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class CTBrandService implements ICTBrandService {

    private CTBrandDAO ctbrandDao;

    public CTBrandService() {
        this.ctbrandDao = new CTBrandDAO();
    }

    @Override
    public List<CTBrandModel> findAll(PageRequest page) {
        return ctbrandDao.findAll(page);
    }

    @Override
    public CTBrandModel findId(int categoryId, int brandId) {
        return ctbrandDao.findId(categoryId, brandId);
    }

    @Override
    public CTBrandModel findOne(int id) {
        return ctbrandDao.findOne(id);
    }

    @Override
    public CTBrandModel insert(CTBrandModel ctbrand) {
        int id = ctbrandDao.insert(ctbrand);
        return ctbrandDao.findOne(id);
    }

    @Override
    public CTBrandModel update(CTBrandModel ctbrand) {
        ctbrandDao.update(ctbrand);
        return ctbrandDao.findOne(ctbrand.getId());
    }

    @Override
    public void delete(int[] ids) {
        for (int id : ids) {
            ctbrandDao.delete(id);
        }
    }

    @Override
    public int getTotalItem() {
        return ctbrandDao.getTotalItem();
    }

}
