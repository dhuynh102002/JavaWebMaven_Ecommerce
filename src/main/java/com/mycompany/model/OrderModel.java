/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.model;

import java.util.concurrent.TimeUnit;

/**
 *
 * @author ASUS
 */
public class OrderModel extends AbstractModel<OrderModel>{
    private int id_user;
    private String phone;
    private String address;
    private OrderStatusModel status;

    public OrderModel() {
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public OrderStatusModel getStatus() {
        return status;
    }

    public void setStatus(OrderStatusModel status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "OrderModel{" + "id_user=" + id_user + ", phone=" + phone + ", address=" + address + ", status=" + status + '}';
    }
    
    
}
