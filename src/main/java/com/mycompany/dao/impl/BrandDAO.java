/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dao.impl;

import com.mycompany.dao.IBrandDAO;
import com.mycompany.mapper.BrandMapper;
import com.mycompany.model.BrandModel;
import com.mycompany.paging.PageRequest;
import java.util.List;
import org.apache.commons.lang.StringUtils;

/**
 *
 * @author ASUS
 */
public class BrandDAO extends AbstractDAO<BrandModel> implements IBrandDAO {

    @Override
    public List<BrandModel> findAll(PageRequest page) {
        StringBuilder sql = new StringBuilder("SELECT * FROM brand");
        if (page.getSorter() != null && StringUtils.isNotBlank(page.getSorter().getSortName())
                && StringUtils.isNotBlank(page.getSorter().getSortBy())) {
            sql.append(" ORDER BY " + page.getSorter().getSortName() + " " + page.getSorter().getSortBy() + "");
        }
        if (page.getOffset() != null && page.getLimit() != null) {
            sql.append(" LIMIT " + page.getOffset() + ", " + page.getLimit() + "");
        }
        return getList(sql.toString(), new BrandMapper());
    }

    @Override
    public List<BrandModel> findBrandsByCategory(int idCategory) {
        String sql = "SELECT brand.* "
                + "FROM ctbrand "
                + "INNER JOIN category ON category.id = ctbrand.id_category "
                + "INNER JOIN brand ON brand.id = ctbrand.id_brand "
                + "WHERE ctbrand.id_category = ?";
        return getList(sql, new BrandMapper(), idCategory);
    }

    @Override
    public BrandModel findOne(int id) {
        String sql = "SELECT * FROM brand WHERE id = ?";
        List<BrandModel> brand = getList(sql, new BrandMapper(), id);
        return brand.isEmpty() ? null : brand.get(0);
    }

    @Override
    public int insertBrand(BrandModel brand) {
        String sql = "INSERT INTO brand (code, name) "
                + "VALUES (?, ?)";
        return insert(sql, brand.getCode(), brand.getName());
    }

    @Override
    public void updateBrand(BrandModel brand) {
        String sql = "UPDATE brand SET code = ?, name = ? WHERE id = ?";
        update(sql, brand.getCode(), brand.getName(), brand.getId());
    }

    @Override
    public void deleteBrand(int id) {
        String sql = "DELETE FROM brand WHERE id = ?";
        update(sql, id);
    }

    @Override
    public int getTotalItem() {
        String sql = "SELECT count(*) FROM brand";
        return count(sql);
    }

}
