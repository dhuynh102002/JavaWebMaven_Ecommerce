/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dao;

import com.mycompany.model.OrderModel;
import com.mycompany.paging.PageRequest;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface IOrderDAO extends IGenericDAO<OrderModel>{
    List<OrderModel> findAll(PageRequest page);
    List<OrderModel> findByUser(int id, PageRequest page);
    OrderModel findOne(int id);
    int insert(OrderModel order);
    void update(OrderModel order);
    void delete(int id);
    int getTotalItem();
}
