/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dao.impl;

import com.mycompany.dao.IOrderStatusDAO;
import com.mycompany.mapper.OrderStatusMapper;
import com.mycompany.model.OrderStatusModel;
import com.mycompany.paging.PageRequest;
import java.util.List;
import org.apache.commons.lang.StringUtils;

/**
 *
 * @author ASUS
 */
public class OrderStatusDAO extends AbstractDAO<OrderStatusModel> implements IOrderStatusDAO{

    @Override
    public List<OrderStatusModel> findAll(PageRequest page) {
        StringBuilder sql = new StringBuilder("SELECT * FROM trangthaidonhang");
        
        if (page.getSorter() != null && StringUtils.isNotBlank(page.getSorter().getSortName())
                && StringUtils.isNotBlank(page.getSorter().getSortBy())) {
            sql.append(" ORDER BY " + page.getSorter().getSortName() + " " + page.getSorter().getSortBy() + "");
        }
        if (page.getOffset() != null && page.getLimit() != null) {
            sql.append(" LIMIT " + page.getOffset() + ", " + page.getLimit() + "");
        }
        
        return getList(sql.toString(), new OrderStatusMapper());
    }

    @Override
    public OrderStatusModel findOne(int id) {
        String sql = "SELECT * FROM trangthaidonhang WHERE id = ?";
        List<OrderStatusModel> orderStatus = getList(sql, new OrderStatusMapper(), id);
        return orderStatus.isEmpty() ? null : orderStatus.get(0);
    }

    @Override
    public int insert(OrderStatusModel orderStatus) {
        String sql = "INSERT INTO trangthaidonhang (name) "
                + "VALUES (?)";
        return insert(sql, orderStatus.getName());
    }

    @Override
    public void update(OrderStatusModel orderStatus) {
        String sql = "UPDATE trangthaidonhang SET name = ? WHERE id = ?";
        update(sql, orderStatus.getName(),orderStatus.getId());
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM trangthaidonhang WHERE id = ?";
        update(sql, id);
    }

    @Override
    public int getTotalItem() {
        String sql = "SELECT count(*) FROM trangthaidonhang";
        return count(sql);
    }
    
}
