/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.mapper;

import com.mycompany.model.CategoryModel;
import java.sql.ResultSet;

/**
 *
 * @author ASUS
 */
public class CategoryMapper implements IRowMapper<CategoryModel> {

    @Override
    public CategoryModel mapRow(ResultSet rs) {
        try {
            CategoryModel cate = new CategoryModel();
            cate.setId(rs.getInt("id"));
            cate.setCode(rs.getString("code"));
            cate.setName(rs.getString("name"));
            
            return cate;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

}
