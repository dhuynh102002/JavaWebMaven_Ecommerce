/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dao;

import com.mycompany.model.OrderDetailsModel;
import com.mycompany.paging.PageRequest;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface IOrderDetailsDAO {
    List<OrderDetailsModel> findAll(PageRequest page);
    List<OrderDetailsModel> findOrderDetails(int orderId);
    OrderDetailsModel findOne(int id);
    int insert(OrderDetailsModel detail);
    void update(OrderDetailsModel detail);
    void delete(int id);
    int getTotalItem();
}
