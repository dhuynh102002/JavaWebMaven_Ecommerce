/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.mapper;

import com.mycompany.model.RoleModel;
import com.mycompany.model.UserModel;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */
public class UserMapper implements IRowMapper<UserModel>{

    @Override
    public UserModel mapRow(ResultSet rs) {
        try {
            UserModel user = new UserModel();
            user.setId(rs.getInt("id"));
            user.setPhone(rs.getString("phone"));
            user.setEmail(rs.getString("email"));
            user.setName(rs.getString("name"));
            user.setStatus(rs.getInt("status"));
            user.setPassword(rs.getString("password"));
            
            RoleModel role = new RoleModel();
            role.setId(rs.getInt("permission_id"));
            role.setCode(rs.getString("code"));
            role.setName(rs.getString("permission_name"));
            
            user.setRole(role);
            return user;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }  
}
