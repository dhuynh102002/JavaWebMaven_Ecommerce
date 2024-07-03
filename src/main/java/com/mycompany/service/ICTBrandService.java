/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service;

import com.mycompany.model.CTBrandModel;
import com.mycompany.paging.PageRequest;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface ICTBrandService {
    List<CTBrandModel> findAll(PageRequest page);
    CTBrandModel findId(int categoryId, int brandId);
    CTBrandModel findOne(int id);
    CTBrandModel insert(CTBrandModel ctbrand);
    CTBrandModel update(CTBrandModel ctbrand);
    void delete(int[] ids);
    int getTotalItem();
}
