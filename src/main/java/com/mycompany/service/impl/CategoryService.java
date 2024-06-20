/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service.impl;

import com.mycompany.dao.impl.CategoryDAO;
import com.mycompany.model.CategoryModel;
import com.mycompany.paging.PageRequest;
import com.mycompany.service.ICategoryService;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class CategoryService implements ICategoryService {

    private CategoryDAO cateDao;

    public CategoryService() {
        cateDao = new CategoryDAO();
    }

    @Override
    public List<CategoryModel> findAll(PageRequest page) {
        return cateDao.findAll(page);
    }

    @Override
    public CategoryModel findOne(int id) {
        return cateDao.findOne(id);
    }

    @Override
    public CategoryModel insertCategory(CategoryModel cate) {
        int id = cateDao.insertCategory(cate);
        return cateDao.findOne(id);
    }

    @Override
    public CategoryModel updateCategory(CategoryModel cate) {
        cateDao.updateCategory(cate);
        return cateDao.findOne(cate.getId());
    }

    @Override
    public void deleteCategory(int[] ids) {
        for(int id : ids ){
            cateDao.deleteCategory(id);
        }
    }

    @Override
    public int getTotalItem() {
        return cateDao.getTotalItem();
    }

}
