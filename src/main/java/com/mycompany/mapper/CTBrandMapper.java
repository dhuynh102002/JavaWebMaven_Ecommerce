/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.mapper;

import com.mycompany.model.CTBrandModel;
import java.sql.ResultSet;

/**
 *
 * @author ASUS
 */
public class CTBrandMapper implements IRowMapper<CTBrandModel>{

    @Override
    public CTBrandModel mapRow(ResultSet rs) {
        try {
            CTBrandModel ctbrand = new CTBrandModel();
            ctbrand.setId(rs.getInt("id"));
            ctbrand.setId_brand(rs.getInt("id_brand"));
            ctbrand.setId_category(rs.getInt("id_category"));
            
            return ctbrand;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    
}
