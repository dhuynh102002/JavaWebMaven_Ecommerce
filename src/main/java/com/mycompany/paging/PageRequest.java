/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.paging;

import com.mycompany.sort.Sorter;

/**
 *
 * @author ASUS
 */
public class PageRequest implements IPageble {

    private Integer page;
    private Integer maxPageItem;
    private Sorter sorter;
    private String nameSP;
    private String category;
    private String[] brands;
    private String[] ratings;

    public PageRequest() {
    }

    public PageRequest(Integer page, Integer maxPageItem, Sorter sorter) {
        this.page = page;
        this.maxPageItem = maxPageItem;
        this.sorter = sorter;
    }

    public PageRequest(Integer page, Integer maxPageItem, String nameSP, String category, String[] brands, String[] ratings) {
        this.page = page;
        this.maxPageItem = maxPageItem;
        this.nameSP = nameSP;
        this.category = category;
        this.brands = brands;
        this.ratings = ratings;
    }

    @Override
    public Integer getPage() {
        return this.page;
    }

    @Override
    public Integer getOffset() {
        if(this.page != null && this.maxPageItem != null){
            return (this.page - 1 ) * this.maxPageItem; 
        }
        return null;
    }

    @Override
    public Integer getLimit() {
        return this.maxPageItem;
    }

    @Override
    public Sorter getSorter() {
        if(this.sorter != null){
            return this.sorter;
        }
        return null;
    }

    public Integer getMaxPageItem() {
        return maxPageItem;
    }

    public String getNameSP() {
        return nameSP;
    }

    public String getCategory() {
        return category;
    }

    public String[] getBrands() {
        return brands;
    }

    public String[] getRatings() {
        return ratings;
    }

}
