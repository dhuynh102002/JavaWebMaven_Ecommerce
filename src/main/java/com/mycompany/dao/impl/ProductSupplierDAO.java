/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dao.impl;

import com.mycompany.dao.IProductSupplierDAO;
import com.mycompany.mapper.ProductSupplierMapper;
import com.mycompany.model.ProductSupplierModel;
import com.mycompany.paging.PageRequest;
import java.util.List;
import org.apache.commons.lang.StringUtils;

/**
 *
 * @author ASUS
 */
public class ProductSupplierDAO extends AbstractDAO<ProductSupplierModel> implements IProductSupplierDAO {

    @Override
    public List<ProductSupplierModel> findAll(PageRequest page) {
        StringBuilder sql = new StringBuilder("SELECT spncc.*, "
                + "category.id AS category_id, category.code AS category_code, category.name AS category_name, "
                + "brand.id AS brand_id, brand.code AS brand_code, brand.name AS brand_name "
                + "FROM spncc "
                + "INNER JOIN ctbrand ON spncc.id_ctbrand = ctbrand.id "
                + "INNER JOIN category ON ctbrand.id_category = category.id "
                + "INNER JOIN brand ON ctbrand.id_brand = brand.id");

        sql = querySQL(sql, page);

        if (page.getSorter() != null && StringUtils.isNotBlank(page.getSorter().getSortName())
                && StringUtils.isNotBlank(page.getSorter().getSortBy())) {
            sql.append(" ORDER BY " + page.getSorter().getSortName() + " " + page.getSorter().getSortBy() + "");
        }
        if (page.getOffset() != null && page.getLimit() != null) {
            sql.append(" LIMIT " + page.getOffset() + ", " + page.getLimit() + "");
        }
        return getList(sql.toString(), new ProductSupplierMapper());
    }

    private StringBuilder querySQL(StringBuilder sql, PageRequest page) {
        if (page.getNameSP() != null && StringUtils.isNotBlank(page.getNameSP())) {
            sql.append(" AND spncc.name LIKE '" + "%" + page.getNameSP() + "%'");
        }
        if (page.getCategory() != null && StringUtils.isNotBlank(page.getCategory())) {
            sql.append(" AND category.id = " + page.getCategory());
        }
        if (page.getBrands() != null && page.getBrands().length > 0) {
            sql.append(" AND (");
            boolean firstBrand = true;

            // Iterate through the selected brands
            for (String selectedBrand : page.getBrands()) {
                if (!firstBrand) {
                    sql.append(" OR ");
                }

                sql.append("brand.id = " + selectedBrand);
                firstBrand = false;
            }

            sql.append(")");
        }
        return sql;
    }

    @Override
    public int getTotalItemBySearch(PageRequest page) {
        StringBuilder sql = new StringBuilder("SELECT count(*) "
                + "FROM spncc "
                + "INNER JOIN ctbrand ON spncc.id_ctbrand = ctbrand.id "
                + "INNER JOIN category ON ctbrand.id_category = category.id "
                + "INNER JOIN brand ON ctbrand.id_brand = brand.id");
        sql = querySQL(sql, page);
        return count(sql.toString());
    }

    @Override
    public ProductSupplierModel findOne(int id) {
        String sql = "SELECT spncc.*, "
                + "category.id AS category_id, category.code AS category_code, category.name AS category_name, "
                + "brand.id AS brand_id, brand.code AS brand_code, brand.name AS brand_name "
                + "FROM spncc "
                + "INNER JOIN ctbrand ON spncc.id_ctbrand = ctbrand.id "
                + "INNER JOIN category ON ctbrand.id_category = category.id "
                + "INNER JOIN brand ON ctbrand.id_brand = brand.id "
                + "WHERE spncc.id = ?";

        List<ProductSupplierModel> products = getList(sql, new ProductSupplierMapper(), id);
        return products.isEmpty() ? null : products.get(0);
    }

    @Override
    public int insert(ProductSupplierModel product) {
        String sql = "INSERT INTO spncc (name, id_ctbrand, description, updatedAt, origin, quantity, price, image, "
                + "id_producer, image1, image2, image3) VALUES (?, ?, ?, Now(), ?, ?, ?, ?, ?, ?, ?, ?)";
        return insert(sql, product.getName(), product.getId_ctBrand(), product.getDescription(),
                product.getOrigin(), product.getQuantity(), product.getPrice(), product.getImage(),
                product.getId_producer(), product.getImage1(), product.getImage2(), product.getImage3());
    }

    @Override
    public void update(ProductSupplierModel product) {
        String sql = "UPDATE spncc SET name = ?, id_ctbrand = ?, description = ?, updatedAt = Now(), origin = ?, "
                + "quantity = ?, price = ?, image = ?, id_producer = ?, image1 = ?, image2 = ?, image3 = ? WHERE id = ?";
        update(sql, product.getName(), product.getId_ctBrand(),
                product.getDescription(), product.getOrigin(),
                product.getQuantity(), product.getPrice(), product.getImage(),
                product.getId_producer(), product.getImage1(), product.getImage2(),
                product.getImage3(), product.getId());
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM spncc WHERE id = ?";
        update(sql, id);
    }

    @Override
    public int getTotalItem() {
        String sql = "SELECT count(*) FROM spncc";
        return count(sql);
    }

    @Override
    public List<ProductSupplierModel> findItems_NotIn_ProductSales() {
        StringBuilder sql = new StringBuilder("SELECT spncc.*, "
                + "category.id AS category_id, category.code AS category_code, category.name AS category_name, "
                + "brand.id AS brand_id, brand.code AS brand_code, brand.name AS brand_name "
                + "FROM spncc "
                + "INNER JOIN ctbrand ON spncc.id_ctbrand = ctbrand.id "
                + "INNER JOIN category ON ctbrand.id_category = category.id "
                + "INNER JOIN brand ON ctbrand.id_brand = brand.id "
                + "LEFT JOIN sanphamchinh ON spncc.id = sanphamchinh.id_spncc " 
                + "WHERE sanphamchinh.id_spncc IS NULL");
        //LEFT JOIN để kết hợp bảng spncc với bảng sanphamchinh, ngay cả khi không có bản ghi phù hợp trong sanphamchinh 
        //(những cột đó có bản ghi không phù hợp= NULL).
        
        return getList(sql.toString(), new ProductSupplierMapper());
    }

}
