/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service.impl;

import com.mycompany.dao.impl.OrderStatusDAO;
import com.mycompany.model.OrderStatusModel;
import com.mycompany.paging.PageRequest;
import com.mycompany.service.IOrderStatusService;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class OrderStatusService implements IOrderStatusService {

    private OrderStatusDAO orderStatusDao;

    public OrderStatusService() {
        orderStatusDao = new OrderStatusDAO();
    }

    @Override
    public List<OrderStatusModel> findAll(PageRequest page) {
        return orderStatusDao.findAll(page);
    }

    @Override
    public OrderStatusModel findOne(int id) {
        return orderStatusDao.findOne(id);
    }

    @Override
    public OrderStatusModel insert(OrderStatusModel orderStatus) {
        int id = orderStatusDao.insert(orderStatus);
        return orderStatusDao.findOne(id);
    }

    @Override
    public OrderStatusModel update(OrderStatusModel orderStatus) {
        orderStatusDao.update(orderStatus);
        return orderStatusDao.findOne(orderStatus.getId());
    }

    @Override
    public void delete(int id) {
        orderStatusDao.delete(id);
    }

    @Override
    public int getTotalItem() {
        return orderStatusDao.getTotalItem();
    }

}
