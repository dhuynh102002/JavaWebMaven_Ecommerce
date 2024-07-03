/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.mapper;

import com.mycompany.model.BrandModel;
import com.mycompany.model.CategoryModel;
import com.mycompany.model.ProductModel;
import com.mycompany.model.ProductSupplierModel;
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
            product.setPrice(rs.getDouble("price"));
            product.setQuantity(rs.getInt("quantity"));
            product.setId_spncc(rs.getInt("id_spncc"));
            product.setRating(rs.getDouble("rating"));
            product.setDiscount(rs.getInt("discount"));
            
            ProductSupplierModel productSupplier = new ProductSupplierModel();
            productSupplier.setPrice(rs.getDouble("priceNCC"));
            productSupplier.setQuantity(rs.getInt("quantityNCC"));
            productSupplier.setId(rs.getInt("id_spncc"));
            productSupplier.setId_ctBrand(rs.getInt("id_ctbrand"));
            productSupplier.setName(rs.getString("name"));
            productSupplier.setImage(rs.getString("image"));
            productSupplier.setImage1(rs.getString("image1"));
            productSupplier.setImage2(rs.getString("image2"));
            productSupplier.setImage3(rs.getString("image3"));
            
            CategoryModel cate = new CategoryModel();
            cate.setId(rs.getInt("category_id"));
            cate.setCode(rs.getString("category_code"));
            cate.setName(rs.getString("category_name"));
            productSupplier.setCategory(cate);
            
            BrandModel brand = new BrandModel();
            brand.setId(rs.getInt("brand_id"));
            brand.setCode(rs.getString("brand_code"));
            brand.setName(rs.getString("brand_name"));
            productSupplier.setBrand(brand);
            
            productSupplier.setDescription(rs.getString("description"));
            productSupplier.setOrigin(rs.getString("origin"));
            productSupplier.setId_producer(rs.getInt("id_producer"));
            
            product.setProductSupplier(productSupplier);
            return product;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

}
