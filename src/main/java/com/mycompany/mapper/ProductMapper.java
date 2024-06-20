/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.mapper;

import com.mycompany.model.BrandModel;
import com.mycompany.model.CategoryModel;
import com.mycompany.model.ProductModel;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */
public class ProductMapper implements IRowMapper<ProductModel> {

    @Override
    public ProductModel mapRow(ResultSet rs) {
        try {
            ProductModel product = new ProductModel();
            product.setId(rs.getInt("sanphamchinh_id"));
            product.setPriceSP(rs.getDouble("price"));
            product.setQuantitySP(rs.getInt("quantity"));
            product.setQuantityNCC(rs.getInt("quantityNCC"));
            product.setId_spnccSP(rs.getInt("id_spncc"));
            product.setId_ctBrand(rs.getInt("id_ctbrand"));
            product.setNameSP(rs.getString("name"));
            product.setImageSP(rs.getString("image"));
            product.setImageSP1(rs.getString("image1"));
            product.setImageSP2(rs.getString("image2"));
            product.setImageSP3(rs.getString("image3"));
            
            CategoryModel cate = new CategoryModel();
            cate.setId(rs.getInt("category_id"));
            cate.setCode(rs.getString("category_code"));
            cate.setName(rs.getString("category_name"));
            product.setCategorySP(cate);
            
            BrandModel brand = new BrandModel();
            brand.setId(rs.getInt("brand_id"));
            brand.setCode(rs.getString("brand_code"));
            brand.setName(rs.getString("brand_name"));
            product.setBrandSP(brand);
            
            product.setDescriptionSP(rs.getString("description"));
            product.setOriginSP(rs.getString("origin"));
            product.setRatingSP(rs.getDouble("rating"));
            product.setDiscountSP(rs.getInt("discount"));
            product.setId_producer(rs.getInt("id_producer"));
            
            return product;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

}
