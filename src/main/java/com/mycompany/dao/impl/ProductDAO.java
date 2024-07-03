/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dao.impl;

import com.mycompany.dao.IProductDAO;
import com.mycompany.mapper.ProductMapper;
import com.mycompany.model.ProductModel;
import com.mycompany.paging.PageRequest;
import java.util.List;
import org.apache.commons.lang.StringUtils;

/**
 *
 * @author ASUS
 */
public class ProductDAO extends AbstractDAO<ProductModel> implements IProductDAO {

    @Override
    public List<ProductModel> findAll(PageRequest page) {
        StringBuilder sql = new StringBuilder("SELECT sanphamchinh.*, sanphamchinh.id AS sanphamchinh_id, spncc.*, spncc.price AS priceNCC, spncc.quantity AS quantityNCC, ctbrand.*, "
                + "category.id AS category_id, category.code AS category_code, category.name AS category_name, "
                + "brand.id AS brand_id, brand.code AS brand_code, brand.name AS brand_name "
                + "FROM sanphamchinh "
                + "INNER JOIN spncc ON sanphamchinh.id_spncc = spncc.id "
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
        System.out.println("sql...." + sql.toString());
        return getList(sql.toString(), new ProductMapper());

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
        if (page.getRatings() != null && page.getRatings().length > 0) {
            sql.append(" AND (");
            boolean firstRating = true;

            for (String rating : page.getRatings()) {
                if (!firstRating) {
                    sql.append("OR ");
                }
                if (null != rating) {
                    switch (rating) {
                        case "5":
                            // If 5 Stars is selected,  filter for ratings greater than or equal to 9.0
                            sql.append("sanphamchinh.rating >= 9.0 ");
                            break;
                        case "4":
                            // For 4 Stars, filter for ratings between 7.5 and 8.9
                            sql.append("sanphamchinh.rating >= 7.5 AND sanphamchinh.rating < 9.0 ");
                            break;
                        case "3":
                            // For 3 Stars, filter for ratings between 5.9 and 7.4
                            sql.append("sanphamchinh.rating >= 5.9 AND sanphamchinh.rating < 7.5 ");
                            break;
                        case "2":
                            // For 2 Stars, filter for ratings between 3.5 and 5.8
                            sql.append("sanphamchinh.rating >= 3.5 AND sanphamchinh.rating < 5.9 ");
                            break;
                        default:
                            break;
                    }
                }
                firstRating = false;
            }

            sql.append(")");
        }
        return sql;
    }

    @Override
    public int getTotalItemBySearch(PageRequest page) {
        StringBuilder sql = new StringBuilder("SELECT count(*) "
                + "FROM sanphamchinh "
                + "INNER JOIN spncc ON sanphamchinh.id_spncc = spncc.id "
                + "INNER JOIN ctbrand ON spncc.id_ctbrand = ctbrand.id "
                + "INNER JOIN category ON ctbrand.id_category = category.id "
                + "INNER JOIN brand ON ctbrand.id_brand = brand.id");
        sql = querySQL(sql, page);
        return count(sql.toString());
    }

    @Override
    public ProductModel findOne(int id) {
        String sql = "SELECT sanphamchinh.*, sanphamchinh.id AS sanphamchinh_id, spncc.*, spncc.quantity AS quantityNCC, spncc.price AS priceNCC, ctbrand.*, "
                + "category.id AS category_id, category.code AS category_code, category.name AS category_name, "
                + "brand.id AS brand_id, brand.code AS brand_code, brand.name AS brand_name "
                + "FROM sanphamchinh "
                + "INNER JOIN spncc ON sanphamchinh.id_spncc = spncc.id "
                + "INNER JOIN ctbrand ON spncc.id_ctbrand = ctbrand.id "
                + "INNER JOIN category ON ctbrand.id_category = category.id "
                + "INNER JOIN brand ON ctbrand.id_brand = brand.id "
                + "WHERE sanphamchinh.id = ?";

        List<ProductModel> products = getList(sql, new ProductMapper(), id);
        return products.isEmpty() ? null : products.get(0);
    }

    @Override
    public List<ProductModel> findRelatedProducts(int id, int id_ctbrand) {
        String sql = "SELECT sanphamchinh.*, sanphamchinh.id AS sanphamchinh_id, spncc.*, spncc.quantity AS quantityNCC, spncc.price AS priceNCC, ctbrand.*, "
                + "category.id AS category_id, category.code AS category_code, category.name AS category_name, "
                + "brand.id AS brand_id, brand.code AS brand_code, brand.name AS brand_name "
                + "FROM sanphamchinh "
                + "INNER JOIN spncc ON sanphamchinh.id_spncc = spncc.id "
                + "INNER JOIN ctbrand ON spncc.id_ctbrand = ctbrand.id "
                + "INNER JOIN category ON ctbrand.id_category = category.id "
                + "INNER JOIN brand ON ctbrand.id_brand = brand.id "
                + "WHERE ctbrand.id = ?  AND sanphamchinh.id != ?"; //nếu truyền vào id thì chỗ ? thứ 1 = (SELECT id_ctbrand FROM sanphamchinh INNER JOIN spncc ON sanphamchinh.id_spncc = spncc.id WHERE sanphamchinh.id = ?)

        return getList(sql, new ProductMapper(), id_ctbrand, id);
    }

    @Override
    public int insert(ProductModel product) {
        String sql = "INSERT INTO sanphamchinh (id_spncc, quantity, price, discount, rating) VALUES (?, ?, ?, ?, ?)";
        return insert(sql, product.getId_spncc(), product.getQuantity(), product.getPrice(),
                product.getDiscount(), product.getRating());
    }

    @Override
    public void update(ProductModel product) {
        String sql = "UPDATE sanphamchinh SET quantity = ?, price = ?, rating = ?, discount = ? "
                + "WHERE id = ?";
        update(sql, product.getQuantity(), product.getPrice(),
                product.getRating(), product.getDiscount(), product.getId());
    }
    
    @Override
    public void delete(int id) {
        String sql = "DELETE FROM sanphamchinh WHERE id = ?";
        update(sql, id);
    }

    @Override
    public int getTotalItem() {
        String sql = "SELECT count(*) FROM sanphamchinh";
        return count(sql);
    }

    @Override
    public ProductModel findOneByNCC(int id_spncc) {
        String sql = "SELECT sanphamchinh.*, sanphamchinh.id AS sanphamchinh_id, spncc.*, spncc.quantity AS quantityNCC, spncc.price AS priceNCC, ctbrand.*, "
                + "category.id AS category_id, category.code AS category_code, category.name AS category_name, "
                + "brand.id AS brand_id, brand.code AS brand_code, brand.name AS brand_name "
                + "FROM sanphamchinh "
                + "INNER JOIN spncc ON sanphamchinh.id_spncc = spncc.id "
                + "INNER JOIN ctbrand ON spncc.id_ctbrand = ctbrand.id "
                + "INNER JOIN category ON ctbrand.id_category = category.id "
                + "INNER JOIN brand ON ctbrand.id_brand = brand.id "
                + "WHERE sanphamchinh.id_spncc = ?";

        List<ProductModel> products = getList(sql, new ProductMapper(), id_spncc);
        return products.isEmpty() ? null : products.get(0);
    }

}
