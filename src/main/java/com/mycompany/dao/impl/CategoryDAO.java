/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dao.impl;

import com.mycompany.dao.ICategoryDAO;
import com.mycompany.mapper.CategoryMapper;
import com.mycompany.model.CategoryModel;
import com.mycompany.paging.PageRequest;
import java.util.List;
import org.apache.commons.lang.StringUtils;

/**
 *
 * @author ASUS
 */
public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO {

    @Override
    public List<CategoryModel> findAll(PageRequest page) {
        StringBuilder sql = new StringBuilder("SELECT * FROM category");
        
        if (page.getSorter() != null && StringUtils.isNotBlank(page.getSorter().getSortName())
                && StringUtils.isNotBlank(page.getSorter().getSortBy())) {
            sql.append(" ORDER BY " + page.getSorter().getSortName() + " " + page.getSorter().getSortBy() + "");
        }
        if (page.getOffset() != null && page.getLimit() != null) {
            sql.append(" LIMIT " + page.getOffset() + ", " + page.getLimit() + "");
        }
        
        return getList(sql.toString(), new CategoryMapper());
    }

    @Override
    public CategoryModel findOne(int id) {
        String sql = "SELECT * FROM category WHERE id = ?";
        List<CategoryModel> cate = getList(sql, new CategoryMapper(), id);
        return cate.isEmpty() ? null : cate.get(0);
    }

    @Override
    public int insertCategory(CategoryModel cate) {
        String sql = "INSERT INTO category (code, name) "
                + "VALUES (?, ?)";
        return insert(sql, cate.getCode(), cate.getName());
    }

    @Override
    public void updateCategory(CategoryModel cate) {
        String sql = "UPDATE category SET code = ?, name = ? WHERE id = ?";
        update(sql, cate.getCode(), cate.getName(), cate.getId());
    }

    @Override
    public void deleteCategory(int id) {
        String sql = "DELETE FROM category WHERE id = ?";
        update(sql, id);
    }

    @Override
    public int getTotalItem() {
        String sql = "SELECT count(*) FROM category";
        return count(sql);
    }
}
