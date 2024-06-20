/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.mapper;

import com.mycompany.model.OrderDetailsModel;
import com.mycompany.model.ProductModel;
import java.sql.ResultSet;

/**
 *
 * @author ASUS
 */
public class OrderDetailsMapper implements IRowMapper<OrderDetailsModel> {

    @Override
    public OrderDetailsModel mapRow(ResultSet rs) {
        try {
            OrderDetailsModel detail = new OrderDetailsModel();
            detail.setId(rs.getInt("id"));
            detail.setId_order(rs.getInt("id_hoadon"));
            
            ProductModel product = new ProductModel();
            product.setId(rs.getInt("id_spc"));
            product.setImageSP(rs.getString("image"));
            product.setNameSP(rs.getString("name"));
            product.setOriginSP(rs.getString("origin"));
                        
            detail.setProduct(product);
            detail.setQuantity(rs.getInt("quantity"));
            detail.setPrice(rs.getDouble("price"));

            return detail;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }

    }

}
