/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dao;

import com.mycompany.model.OrderStatusModel;
import com.mycompany.paging.PageRequest;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface IOrderStatusDAO {
    List<OrderStatusModel> findAll(PageRequest page);
    OrderStatusModel findOne(int id);
    int insert(OrderStatusModel orderStatus);
    void update(OrderStatusModel orderStatus);
    void delete(int id);
    int getTotalItem();
}
