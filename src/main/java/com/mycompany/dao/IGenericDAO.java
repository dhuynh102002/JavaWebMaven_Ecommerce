/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dao;

import com.mycompany.mapper.IRowMapper;
import java.util.List;


/**
 *
 * @author ASUS
 */
public interface IGenericDAO<T> {
    List<T> getList(String sql, IRowMapper<T> rowMapper, Object... parameters);
    void update(String sql, Object... parameters);
    int insert(String sql, Object... parameters);
    int count(String sql, Object... parameters);
}
