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
public interface IPageble {
    Integer getPage();
    Integer getOffset();
    Integer getLimit();
    Sorter getSorter();
}
