/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service;

import com.mycompany.model.UserModel;
import com.mycompany.paging.PageRequest;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface IUserService {

    UserModel findByUserNameAndPasswordAndStatus(String email, String password, Integer status);

    List<UserModel> findAll(PageRequest page);

    UserModel findOne(int id);

    UserModel findOne(String email);

    UserModel insertUser(UserModel user);

    UserModel updateUser(UserModel user);

    void deleteUser(int[] ids);

    int getTotalItem();
}
