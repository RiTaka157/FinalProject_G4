/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

/**
 *
 * @author Nguyen Huyen Tran <CE161052>
 */
public class Cart {
    private String Acc_ID;
    private int pdt_id;
    private String quantity;
    private int order_id;

    public Cart() {
    }

    public Cart(String Acc_ID, int pdt_id, String quantity, int order_id) {
        this.Acc_ID = Acc_ID;
        this.pdt_id = pdt_id;
        this.quantity = quantity;
        this.order_id = order_id;
    }

    public String getAcc_ID() {
        return Acc_ID;
    }

    public void setAcc_ID(String Acc_ID) {
        this.Acc_ID = Acc_ID;
    }

    public int getPdt_id() {
        return pdt_id;
    }

    public void setPdt_id(int pdt_id) {
        this.pdt_id = pdt_id;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }
    
}
