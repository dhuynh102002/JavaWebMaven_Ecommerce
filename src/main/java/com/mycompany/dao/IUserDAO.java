/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dao;

import com.mycompany.model.UserModel;
import com.mycompany.paging.PageRequest;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface IUserDAO extends IGenericDAO<UserModel>{
    UserModel findByUserNameAndPasswordAndStatus(String email, String password, Integer status);
    List<UserModel> findAll(PageRequest page);
    UserModel findOne(int id);
    UserModel findOne(String email);
    int insertUser(UserModel user);
    void updateUser(UserModel user);
    void deleteUser(int id);
    int getTotalItem();
}
