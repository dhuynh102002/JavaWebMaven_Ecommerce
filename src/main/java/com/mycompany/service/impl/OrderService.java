/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service.impl;

import com.mycompany.dao.impl.OrderDAO;
import com.mycompany.model.OrderModel;
import com.mycompany.paging.PageRequest;
import com.mycompany.service.IOrderService;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class OrderService implements IOrderService{
    
    private OrderDAO orderDao;

    public OrderService() {
        orderDao = new OrderDAO();
    }

    @Override
    public List<OrderModel> findAll(PageRequest page) {
        return orderDao.findAll(page);
    }
    
    @Override
    public List<OrderModel> findByUser(int id, PageRequest page) {
        return orderDao.findByUser(id, page);
    }

    @Override
    public OrderModel findOne(int id) {
        return orderDao.findOne(id);
    }

    @Override
    public OrderModel insert(OrderModel order) {
        int id = orderDao.insert(order);
        return orderDao.findOne(id);
    }

    @Override
    public OrderModel update(OrderModel order) {
        orderDao.update(order);
        return orderDao.findOne(order.getId());
    }

    @Override
    public void delete(int id) {
        orderDao.delete(id);
    }

    @Override
    public int getTotalItem() {
        return orderDao.getTotalItem();
    }
    
}
