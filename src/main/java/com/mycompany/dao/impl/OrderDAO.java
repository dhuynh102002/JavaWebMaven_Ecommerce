/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dao.impl;

import com.mycompany.dao.IOrderDAO;
import com.mycompany.mapper.OrderMapper;
import com.mycompany.model.OrderModel;
import com.mycompany.paging.PageRequest;
import java.util.List;
import org.apache.commons.lang.StringUtils;


/**
 *
 * @author ASUS
 */
public class OrderDAO extends AbstractDAO<OrderModel> implements IOrderDAO{

    @Override
    public List<OrderModel> findAll(PageRequest page) {
        StringBuilder sql = new StringBuilder("SELECT hoadon.*, trangthaidonhang.*, trangthaidonhang.id AS idOrderStatus FROM hoadon"
                + " INNER JOIN trangthaidonhang ON trangthaidonhang.id = hoadon.status");
        
        querySQLByPaging(sql, page);
        
        return getList(sql.toString(), new OrderMapper());
    }
    
    private void querySQLByPaging(StringBuilder sql, PageRequest page){
        if (page.getSorter() != null && StringUtils.isNotBlank(page.getSorter().getSortName())
                && StringUtils.isNotBlank(page.getSorter().getSortBy())) {
            sql.append(" ORDER BY " + page.getSorter().getSortName() + " " + page.getSorter().getSortBy() + "");
        }
        if (page.getOffset() != null && page.getLimit() != null) {
            sql.append(" LIMIT " + page.getOffset() + ", " + page.getLimit() + "");
        }
    }
    
    @Override
    public List<OrderModel> findByUser(int id, PageRequest page) {
        StringBuilder sql = new StringBuilder("SELECT hoadon.*, trangthaidonhang.*, trangthaidonhang.id AS idOrderStatus FROM hoadon"
                + " INNER JOIN trangthaidonhang ON trangthaidonhang.id = hoadon.status"
                + " WHERE hoadon.id_user = ?");
        
        querySQLByPaging(sql, page);
        
        System.out.println("sql findByUser: " + sql.toString());
        
        return getList(sql.toString(), new OrderMapper(), id);
    }

    @Override
    public OrderModel findOne(int id) {
        String sql = "SELECT hoadon.*, trangthaidonhang.*, trangthaidonhang.id AS idOrderStatus FROM hoadon"
                + " INNER JOIN trangthaidonhang ON trangthaidonhang.id = hoadon.status"
                + " WHERE hoadon.id = ?";
        List<OrderModel> order = getList(sql, new OrderMapper(), id);
        return order.isEmpty() ? null : order.get(0);
    }

    @Override
    public int insert(OrderModel order) {
        String sql = "INSERT INTO hoadon (id_user, phone, address, createdAt, updatedAt, status) "
                + "VALUES (?, ?, ?, Now(), Now(), ?)";
        return insert(sql, order.getId_user(), order.getPhone(), 
                order.getAddress(), order.getStatus().getId());
    }

    @Override
    public void update(OrderModel order) {
        String sql = "UPDATE hoadon SET id_user = ?, phone = ?, address = ?, updatedAt = Now(), status = ? WHERE id = ?";
        update(sql, order.getId_user(), order.getPhone(), 
                order.getAddress(), order.getStatus().getId(), order.getId());
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM hoadon WHERE id = ?";
        update(sql, id);
    }

    @Override
    public int getTotalItem() {
        String sql = "SELECT count(*) FROM hoadon";
        return count(sql);
    }

    
    
}
