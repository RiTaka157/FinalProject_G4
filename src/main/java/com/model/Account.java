/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

/**
 *
 * @author Nguyen Huyen Tran <CE161052>
 */
public class Account {
    private int Acc_ID;
    private String Acc_Name;
    private String Acc_Password;
    private String Acc_Role;
    private String Us_FullName;
    private String Us_Mail;
    private String Us_Phone;
    private String Us_Address;

    public Account() {
    }

    public Account(int Acc_ID, String Acc_Name, String Acc_Password, String Acc_Role, String Us_FullName, String Us_Mail, String Us_Phone, String Us_Address) {
        this.Acc_ID = Acc_ID;
        this.Acc_Name = Acc_Name;
        this.Acc_Password = Acc_Password;
        this.Acc_Role = Acc_Role;
        this.Us_FullName = Us_FullName;
        this.Us_Mail = Us_Mail;
        this.Us_Phone = Us_Phone;
        this.Us_Address = Us_Address;
    }

    public int getAcc_ID() {
        return Acc_ID;
    }

    public void setAcc_ID(int Acc_ID) {
        this.Acc_ID = Acc_ID;
    }

    public String getAcc_Name() {
        return Acc_Name;
    }

    public void setAcc_Name(String Acc_Name) {
        this.Acc_Name = Acc_Name;
    }

    public String getAcc_Password() {
        return Acc_Password;
    }

    public void setAcc_Password(String Acc_Password) {
        this.Acc_Password = Acc_Password;
    }

    public String getAcc_Role() {
        return Acc_Role;
    }

    public void setAcc_Role(String Acc_Role) {
        this.Acc_Role = Acc_Role;
    }

    public String getUs_FullName() {
        return Us_FullName;
    }

    public void setUs_FullName(String Us_FullName) {
        this.Us_FullName = Us_FullName;
    }

    public String getUs_Mail() {
        return Us_Mail;
    }

    public void setUs_Mail(String Us_Mail) {
        this.Us_Mail = Us_Mail;
    }

    public String getUs_Phone() {
        return Us_Phone;
    }

    public void setUs_Phone(String Us_Phone) {
        this.Us_Phone = Us_Phone;
    }

    public String getUs_Address() {
        return Us_Address;
    }

    public void setUs_Address(String Us_Address) {
        this.Us_Address = Us_Address;
    }
    
    
}
