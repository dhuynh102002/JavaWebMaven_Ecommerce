/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.utils;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author ASUS
 */
public class MessageUtil {

    public static void showMessage(HttpServletRequest request) {
        if (request.getParameter("message") != null) {
            String messageResponse = "";
            String alert = "";
            String message = request.getParameter("message");
            if (message.equals("insert_success")) {
                messageResponse = "Insert success";
                alert = "success";
            } else if (message.equals("update_success")) {
                messageResponse = "Update success";
                alert = "success";
            } else if (message.equals("delete_success")) {
                messageResponse = "Delete success";
                alert = "success";
            } else if (message.equals("error_system")) {
                messageResponse = "Error system";
                alert = "danger";
            } else if (message.equals("email_password_invalid")) {
                messageResponse = "Wrong email or password";
                alert = "danger";
            } else if (message.equals("pass_repass_no_match")) {
                messageResponse = "Password and repeat password do not match";
                alert = "danger";
            } else if (message.equals("email_used")) {
                messageResponse = "Email has been used";
                alert = "danger";
            } else if (message.equals("code_sent")) {
                messageResponse = "Email sent successfully. Please check your email";
                alert = "success";
            } else if (message.equals("email_not_found")) {
                messageResponse = "Email not found. Please enter your registered email account";
                alert = "danger";
            } else if (message.equals("password_reset_success")) {
                messageResponse = "Reset password successfully";
                alert = "success";
            }
            
            request.setAttribute("message", messageResponse);
            request.setAttribute("alert", alert);
        }
    }
}
