/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service;

import com.mycompany.model.CategoryModel;
import com.mycompany.paging.PageRequest;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface ICategoryService {
    List<CategoryModel> findAll(PageRequest page);
    CategoryModel findOne(int id);
    CategoryModel insertCategory(CategoryModel cate);
    CategoryModel updateCategory(CategoryModel cate);
    void deleteCategory(int[] ids);
    int getTotalItem();
}
