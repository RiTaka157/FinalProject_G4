/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

/**
 *
 * @author Nguyen Huyen Tran <CE161052>
 */
public class Product {
   private int pdt_id;
   private String pdt_name;
   private String pdt_price;
   private String pdt_image;

    public Product() {
    }

    public Product(int pdt_id, String pdt_name, String pdt_price, String pdt_image) {
        this.pdt_id = pdt_id;
        this.pdt_name = pdt_name;
        this.pdt_price = pdt_price;
        this.pdt_image = pdt_image;
    }

    public int getPdt_id() {
        return pdt_id;
    }

    public void setPdt_id(int pdt_id) {
        this.pdt_id = pdt_id;
    }

    public String getPdt_name() {
        return pdt_name;
    }

    public void setPdt_name(String pdt_name) {
        this.pdt_name = pdt_name;
    }

    public String getPdt_price() {
        return pdt_price;
    }

    public void setPdt_price(String pdt_price) {
        this.pdt_price = pdt_price;
    }

    public String getPdt_image() {
        return pdt_image;
    }

    public void setPdt_image(String pdt_image) {
        this.pdt_image = pdt_image;
    }
   
}
