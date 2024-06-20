/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.utils;

import java.lang.reflect.InvocationTargetException;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.beanutils.BeanUtils;

/**
 *
 * @author ASUS
 */
public class FormUtil {
    //lấy parameter từ url gán cho các biến của class model 
    //(lưu ý: tên biến trong class model giống với tên của parameter)
    @SuppressWarnings("unchecked")
	public static <T> T toModel(Class<T> clazz, HttpServletRequest request) {
		T object = null;
		try {
			object = clazz.newInstance();
			BeanUtils.populate(object, request.getParameterMap());
		} catch (InstantiationException | IllegalAccessException | InvocationTargetException e) {
			System.out.print(e.getMessage());
		}
		return object;
	}
}
