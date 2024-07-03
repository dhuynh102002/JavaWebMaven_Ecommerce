/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dao.impl;

import com.mycompany.dao.ICTBrandDAO;
import com.mycompany.mapper.CTBrandMapper;
import com.mycompany.model.CTBrandModel;
import com.mycompany.paging.PageRequest;
import java.util.List;
import org.apache.commons.lang.StringUtils;

/**
 *
 * @author ASUS
 */
public class CTBrandDAO extends AbstractDAO<CTBrandModel> implements ICTBrandDAO {

    @Override
    public List<CTBrandModel> findAll(PageRequest page) {
        StringBuilder sql = new StringBuilder("SELECT * FROM ctbrand");
        if (page.getSorter() != null && StringUtils.isNotBlank(page.getSorter().getSortName())
                && StringUtils.isNotBlank(page.getSorter().getSortBy())) {
            sql.append(" ORDER BY " + page.getSorter().getSortName() + " " + page.getSorter().getSortBy() + "");
        }
        if (page.getOffset() != null && page.getLimit() != null) {
            sql.append(" LIMIT " + page.getOffset() + ", " + page.getLimit() + "");
        }
        return getList(sql.toString(), new CTBrandMapper());
    }

    @Override
    public CTBrandModel findId(int categoryId, int brandId) {
        String sql = "SELECT * FROM ctbrand WHERE id_brand = ? AND id_category = ?";
        List<CTBrandModel> ctbrand = getList(sql, new CTBrandMapper(), brandId,categoryId);
        return ctbrand.isEmpty() ? null : ctbrand.get(0);
    }

    @Override
    public CTBrandModel findOne(int id) {
        String sql = "SELECT * FROM ctbrand WHERE id = ?";
        List<CTBrandModel> brand = getList(sql, new CTBrandMapper(), id);
        return brand.isEmpty() ? null : brand.get(0);
    }

    @Override
    public int insert(CTBrandModel ctbrand) {
        String sql = "INSERT INTO ctbrand (id_brand, id_category) "
                + "VALUES (?, ?)";
        return insert(sql, ctbrand.getId_brand(), ctbrand.getId_category());
    }

    @Override
    public void update(CTBrandModel ctbrand) {
        String sql = "UPDATE ctbrand SET id_brand = ?, id_category = ? WHERE id = ?";
        update(sql, ctbrand.getId_brand(), ctbrand.getId_category(), ctbrand.getId());
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM ctbrand WHERE id = ?";
        update(sql, id);
    }

    @Override
    public int getTotalItem() {
        String sql = "SELECT count(*) FROM ctbrand";
        return count(sql);
    }

}
