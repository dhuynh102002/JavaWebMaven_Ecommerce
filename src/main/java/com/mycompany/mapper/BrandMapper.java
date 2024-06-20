/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.mapper;

import com.mycompany.model.BrandModel;
import java.sql.ResultSet;

/**
 *
 * @author ASUS
 */
public class BrandMapper implements IRowMapper<BrandModel>{

    @Override
    public BrandModel mapRow(ResultSet rs) {
        try {
            BrandModel brand = new BrandModel();
            brand.setId(rs.getInt("id"));
            brand.setCode(rs.getString("code"));
            brand.setName(rs.getString("name"));
            
            return brand;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    
}
