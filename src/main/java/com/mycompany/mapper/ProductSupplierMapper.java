/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.mapper;

import com.mycompany.model.BrandModel;
import com.mycompany.model.CategoryModel;
import com.mycompany.model.ProductSupplierModel;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */
public class ProductSupplierMapper implements IRowMapper<ProductSupplierModel> {

    @Override
    public ProductSupplierModel mapRow(ResultSet rs) {
        try {
            ProductSupplierModel product = new ProductSupplierModel();
            product.setId(rs.getInt("id"));
            product.setPrice(rs.getDouble("price"));
            product.setQuantity(rs.getInt("quantity"));
            product.setId_ctBrand(rs.getInt("id_ctbrand"));
            product.setName(rs.getString("name"));
            product.setImage(rs.getString("image"));
            product.setImage1(rs.getString("image1"));
            product.setImage2(rs.getString("image2"));
            product.setImage3(rs.getString("image3"));

            CategoryModel cate = new CategoryModel();
            cate.setId(rs.getInt("category_id"));
            cate.setCode(rs.getString("category_code"));
            cate.setName(rs.getString("category_name"));
            product.setCategory(cate);

            BrandModel brand = new BrandModel();
            brand.setId(rs.getInt("brand_id"));
            brand.setCode(rs.getString("brand_code"));
            brand.setName(rs.getString("brand_name"));
            product.setBrand(brand);

            product.setDescription(rs.getString("description"));
            product.setOrigin(rs.getString("origin"));
            product.setId_producer(rs.getInt("id_producer"));
            product.setUpdatedAt(rs.getTimestamp("updatedAt"));
            
            return product;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

}
