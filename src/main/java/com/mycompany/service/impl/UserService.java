/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service.impl;

import com.mycompany.dao.impl.UserDAO;
import com.mycompany.model.UserModel;
import com.mycompany.paging.PageRequest;
import com.mycompany.service.IUserService;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class UserService implements IUserService {

    private UserDAO userDao;

    public UserService() {
        userDao = new UserDAO();
    }

    @Override
    public UserModel findByUserNameAndPasswordAndStatus(String email, String password, Integer status) {
        return userDao.findByUserNameAndPasswordAndStatus(email, password, status);
    }

    @Override
    public List<UserModel> findAll(PageRequest page) {
        return userDao.findAll(page);
    }

    @Override
    public UserModel findOne(int id) {
        return userDao.findOne(id);
    }
    
    @Override
    public UserModel findOne(String email) {
        return userDao.findOne(email);
    }

    @Override
    public UserModel insertUser(UserModel user) {
        int id = userDao.insertUser(user);
        System.out.println("id_insertUser(): " + id);
        return userDao.findOne(id);
    }

    @Override
    public UserModel updateUser(UserModel user) {
        userDao.updateUser(user);
        return userDao.findOne(user.getId());
    }

    @Override
    public void deleteUser(int[] ids) {
        for (int id : ids) {
            userDao.deleteUser(id);
        }
    }

    @Override
    public int getTotalItem() {
        return userDao.getTotalItem();
    }

}
