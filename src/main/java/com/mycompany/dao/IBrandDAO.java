/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dao;

import com.mycompany.model.BrandModel;
import com.mycompany.paging.PageRequest;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface IBrandDAO extends IGenericDAO<BrandModel>{
    List<BrandModel> findAll(PageRequest page);
    List<BrandModel> findBrandsByCategory(int idCategory);
    BrandModel findOne(int id);
    int insertBrand(BrandModel brand);
    void updateBrand(BrandModel brand);
    void deleteBrand(int id);
    int getTotalItem();
}
