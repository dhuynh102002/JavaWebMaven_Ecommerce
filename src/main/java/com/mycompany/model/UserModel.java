/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.model;

/**
 *
 * @author ASUS
 */
public class UserModel extends AbstractModel<UserModel>{
    private String name;
    private String email;
    private String phone;
    private String password;
    private int status;
    private RoleModel role;

    public UserModel() {
        role = new RoleModel();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public RoleModel getRole() {
        return role;
    }

    public void setRole(RoleModel role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "UserModel{" + "name=" + name + ", email=" + email + ", phone=" + phone + ", password=" + password + ", status=" + status + ", role=" + role + '}';
    }

    
    
    
}
