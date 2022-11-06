/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

import java.sql.Date;

/**
 *
 * @author Nguyen Huyen Tran <CE161052>
 */
public class Order {
    private int Order_id;
    private Date Order_date;
    private String order_phone;
    private String order_address;

    public Order() {
    }

    public Order(int Order_id, Date Order_date, String order_phone, String order_address) {
        this.Order_id = Order_id;
        this.Order_date = Order_date;
        this.order_phone = order_phone;
        this.order_address = order_address;
    }

   

    public int getOrder_id() {
        return Order_id;
    }

    public void setOrder_id(int Order_id) {
        this.Order_id = Order_id;
    }

    public Date getOrder_date() {
        return Order_date;
    }

    public void setOrder_date(Date Order_date) {
        this.Order_date = Order_date;
    }

    public String getOrder_phone() {
        return order_phone;
    }

    public void setOrder_phone(String order_phone) {
        this.order_phone = order_phone;
    }

    public String getOrder_address() {
        return order_address;
    }

    public void setOrder_address(String order_address) {
        this.order_address = order_address;
    }
    
    
}
