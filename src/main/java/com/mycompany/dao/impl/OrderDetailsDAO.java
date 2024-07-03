/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dao.impl;

import com.mycompany.dao.IOrderDetailsDAO;
import com.mycompany.mapper.OrderDetailsMapper;
import com.mycompany.model.OrderDetailsModel;
import com.mycompany.paging.PageRequest;
import java.util.List;
import org.apache.commons.lang.StringUtils;

/**
 *
 * @author ASUS
 */
public class OrderDetailsDAO extends AbstractDAO<OrderDetailsModel> implements IOrderDetailsDAO{

    @Override
    public List<OrderDetailsModel> findAll(PageRequest page) {
        StringBuilder sql = new StringBuilder("SELECT cthd.*, spncc.* FROM cthd"
                + " INNER JOIN sanphamchinh ON sanphamchinh.id = cthd.id_spc"
                + " INNER JOIN spncc ON sanphamchinh.id_spncc = spncc.id");
        
        if (page.getSorter() != null && StringUtils.isNotBlank(page.getSorter().getSortName())
                && StringUtils.isNotBlank(page.getSorter().getSortBy())) {
            sql.append(" ORDER BY " + page.getSorter().getSortName() + " " + page.getSorter().getSortBy() + "");
        }
        if (page.getOffset() != null && page.getLimit() != null) {
            sql.append(" LIMIT " + page.getOffset() + ", " + page.getLimit() + "");
        }
        
        return getList(sql.toString(), new OrderDetailsMapper());
    }
    
    @Override
    public List<OrderDetailsModel> findOrderDetails(int orderId) {
        String sql = "SELECT cthd.*, spncc.* FROM cthd"
                + " INNER JOIN sanphamchinh ON sanphamchinh.id = cthd.id_spc"
                + " INNER JOIN spncc ON sanphamchinh.id_spncc = spncc.id"
                + " WHERE cthd.id_hoadon = ?";
        return getList(sql, new OrderDetailsMapper(),orderId);
    }

    @Override
    public OrderDetailsModel findOne(int id) {
        String sql = "SELECT cthd.*, spncc.* FROM cthd"
                + " INNER JOIN sanphamchinh ON sanphamchinh.id = cthd.id_spc"
                + " INNER JOIN spncc ON sanphamchinh.id_spncc = spncc.id"
                + " WHERE cthd.id = ?";
        List<OrderDetailsModel> detail = getList(sql, new OrderDetailsMapper(), id);
        return detail.isEmpty() ? null : detail.get(0);
    }

    @Override
    public int insert(OrderDetailsModel detail) {
        String sql = "INSERT INTO cthd (id_hoadon, id_spc, quantity, price) "
                + "VALUES (?, ?, ?, ?)";
        return insert(sql, detail.getId_order(), detail.getProduct().getId(), 
                detail.getQuantity(), detail.getPrice());
    }

    @Override
    public void update(OrderDetailsModel detail) {
        String sql = "UPDATE cthd SET id_hoadon = ?, id_spc = ?, quantity = ?, price = ? WHERE id = ?";
        update(sql, detail.getId_order(), detail.getProduct().getId(), 
                detail.getQuantity(), detail.getPrice(), detail.getId());
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM cthd WHERE id = ?";
        update(sql, id);
    }

    @Override
    public int getTotalItem() {
         String sql = "SELECT count(*) FROM cthd";
        return count(sql);
    }
    
}
