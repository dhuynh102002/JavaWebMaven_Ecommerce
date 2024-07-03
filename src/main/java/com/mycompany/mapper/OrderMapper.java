/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.mapper;

import com.mycompany.model.OrderModel;
import com.mycompany.model.OrderStatusModel;
import java.sql.ResultSet;

/**
 *
 * @author ASUS
 */
public class OrderMapper implements IRowMapper<OrderModel> {

    @Override
    public OrderModel mapRow(ResultSet rs) {
        try {
            OrderModel order = new OrderModel();
            order.setId(rs.getInt("id"));
            order.setId_user(rs.getInt("id_user"));
            order.setPhone(rs.getString("phone"));
            order.setAddress(rs.getString("address"));
            order.setCreatedAt(rs.getTimestamp("createdAt"));
            order.setUpdatedAt(rs.getTimestamp("updatedAt"));

            OrderStatusModel status = new OrderStatusModel();
            status.setId(rs.getInt("idOrderStatus"));
            status.setName(rs.getString("name"));

            order.setStatus(status);

            return order;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

}
