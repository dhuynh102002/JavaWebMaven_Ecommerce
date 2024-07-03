/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dao;

import com.mycompany.model.CTBrandModel;
import com.mycompany.paging.PageRequest;
import java.util.List;


/**
 *
 * @author ASUS
 */
public interface ICTBrandDAO extends IGenericDAO<CTBrandModel>{
    List<CTBrandModel> findAll(PageRequest page);
    CTBrandModel findId(int categoryId, int brandId);
    CTBrandModel findOne(int id);
    int insert(CTBrandModel ctbrand);
    void update(CTBrandModel ctbrand);
    void delete(int id);
    int getTotalItem();
}
