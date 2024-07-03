/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service.impl;

import com.mycompany.dao.impl.OrderDetailsDAO;
import com.mycompany.model.OrderDetailsModel;
import com.mycompany.paging.PageRequest;
import com.mycompany.service.IOrderDetailsService;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class OrderDetailsService implements IOrderDetailsService{

    private OrderDetailsDAO orderDetaiDao;

    public OrderDetailsService() {
        orderDetaiDao = new OrderDetailsDAO();
    }
    
    @Override
    public List<OrderDetailsModel> findAll(PageRequest page) {
        return orderDetaiDao.findAll(page);
    }
    
    @Override
    public List<OrderDetailsModel> findOrderDetails(int orderId) {
        return orderDetaiDao.findOrderDetails(orderId);
    }

    @Override
    public OrderDetailsModel findOne(int id) {
        return orderDetaiDao.findOne(id);
    }

    @Override
    public OrderDetailsModel insert(OrderDetailsModel detail) {
        int id = orderDetaiDao.insert(detail);
        return orderDetaiDao.findOne(id);
    }

    @Override
    public OrderDetailsModel update(OrderDetailsModel detail) {
        orderDetaiDao.update(detail);
        return orderDetaiDao.findOne(detail.getId());
    }

    @Override
    public void delete(int id) {
        orderDetaiDao.delete(id);
    }

    @Override
    public int getTotalItem() {
        return orderDetaiDao.getTotalItem();
    }
    
}
