/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.mapper;

import com.mycompany.model.OrderStatusModel;
import java.sql.ResultSet;

/**
 *
 * @author ASUS
 */
public class OrderStatusMapper implements IRowMapper<OrderStatusModel>{

    @Override
    public OrderStatusModel mapRow(ResultSet rs) {
        try {
            OrderStatusModel status = new OrderStatusModel();
            status.setId(rs.getInt("id"));
            status.setName(rs.getString("name"));

            return status;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    
}
