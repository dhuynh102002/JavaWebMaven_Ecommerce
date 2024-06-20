/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service;

import com.mycompany.model.OrderStatusModel;
import com.mycompany.paging.PageRequest;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface IOrderStatusService {
    List<OrderStatusModel> findAll(PageRequest page);
    OrderStatusModel findOne(int id);
    OrderStatusModel insert(OrderStatusModel orderStatus);
    OrderStatusModel update(OrderStatusModel orderStatus);
    void delete(int id);
    int getTotalItem();
}
