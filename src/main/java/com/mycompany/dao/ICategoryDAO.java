/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dao;

import com.mycompany.model.CategoryModel;
import com.mycompany.paging.PageRequest;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface ICategoryDAO extends IGenericDAO<CategoryModel>{
    List<CategoryModel> findAll(PageRequest page);
    CategoryModel findOne(int id);
    int insertCategory(CategoryModel cate);
    void updateCategory(CategoryModel cate);
    void deleteCategory(int id);
    int getTotalItem();
}
