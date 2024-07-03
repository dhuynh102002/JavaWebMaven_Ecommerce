/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dao.impl;

import com.mycompany.dao.IUserDAO;
import com.mycompany.mapper.UserMapper;
import com.mycompany.model.UserModel;
import com.mycompany.paging.PageRequest;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO {

    @Override
    public UserModel findByUserNameAndPasswordAndStatus(String email, String password, Integer status) {
        String sql = "SELECT user.*, permission.id AS permission_id, permission.name AS permission_name, permission.code FROM user "
                + "INNER JOIN permission ON permission.id = user.type "
                + "WHERE email = ? AND password = ? AND status = ?";
        List<UserModel> users = getList(sql, new UserMapper(), email, password, status);
        return users.isEmpty() ? null : users.get(0);
    }

    @Override
    public List<UserModel> findAll(PageRequest page) {
        String sql = "SELECT user.*, permission.id AS permission_id, permission.name AS permission_name, permission.code FROM user "
                + "INNER JOIN permission ON permission.id = user.type ";
        return getList(sql, new UserMapper());
    }

    @Override
    public UserModel findOne(int id) {
        String sql = "SELECT user.*, permission.id AS permission_id, permission.name AS permission_name, permission.code FROM user "
                + "INNER JOIN permission ON permission.id = user.type "
                + "WHERE user.id = ?";
        List<UserModel> users = getList(sql, new UserMapper(), id);
        return users.isEmpty() ? null : users.get(0);
    }
    
    @Override
    public UserModel findOne(String email) {
        String sql = "SELECT user.*, permission.id AS permission_id, permission.name AS permission_name, permission.code FROM user "
                + "INNER JOIN permission ON permission.id = user.type "
                + "WHERE email = ?";
        List<UserModel> users = getList(sql, new UserMapper(), email);
        return users.isEmpty() ? null : users.get(0);
    }

    @Override
    public int insertUser(UserModel user) {
        String sql = "INSERT INTO user (phone, email, password, name, createdAt, updatedAt, status, type) "
                + "VALUES (?, ?, ?, ?, Now(), Now(), ?, ?)";
        return insert(sql, user.getPhone(), user.getEmail(), user.getPassword(),
                user.getName(), user.getStatus(), user.getRole().getId());
    }

    @Override
    public void updateUser(UserModel user) { //bỏ cột createdAt không update
        String sql = "UPDATE user SET phone = ?, email = ? , password = ?, name = ? , updatedAt = Now(),"
                + "status = ?, type = ? WHERE id = ?";
        update(sql, user.getPhone(), user.getEmail(), user.getPassword(),
                user.getName(),user.getStatus(), user.getRole().getId(), user.getId());
    }

    @Override
    public void deleteUser(int id) {
        String sql = "DELETE FROM user WHERE id = ?";
        update(sql, id);
    }

    @Override
    public int getTotalItem() {
        String sql = "SELECT count(*) FROM user";
        return count(sql);
    }

}
