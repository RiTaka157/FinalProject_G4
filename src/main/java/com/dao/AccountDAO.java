/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.connection.DBConnection;
import com.model.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen Huyen Tran
 */
public class AccountDAO {

    private Connection conn = null;
    PreparedStatement pst;
    ResultSet rs = null;

    public AccountDAO() throws ClassNotFoundException, SQLException {
        conn = DBConnection.getConnection();
    }

    public ResultSet accountGetAll() throws SQLException {
        Statement st = conn.createStatement();
        rs = st.executeQuery("Select* from Account");
        return rs;
    }
    
      public int accountGetLenght() throws SQLException {
        Statement st = conn.createStatement();
        rs = st.executeQuery("Select COUNT(*) as CountAcc from Account");
        rs.next();
        return rs.getInt("CountAcc");
    }

    public Account getAccountById(int Acc_ID) throws SQLException {
        Account account = null;
        PreparedStatement pst = conn.prepareStatement("Select * from Account where Acc_ID=?");
        pst.setInt(1, Acc_ID);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            account = new Account(rs.getInt("Acc_ID"), rs.getString("Acc_Name"),
                    rs.getString("Acc_Password"), rs.getString("Acc_Role"),
                    rs.getNString("Us_FullName"), rs.getString("Us_Mail"),
                    rs.getString("Us_Phone"),
                    rs.getNString("Us_Address"));
        }
        return account;
    }

    public Account getAccountByAccName(String accName) throws SQLException {
        Account account = null;
        PreparedStatement pst = conn.prepareStatement("Select * from Account where Acc_Name=?");
        pst.setString(1, accName);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            account = new Account(rs.getInt("Acc_ID"), rs.getString("Acc_Name"),
                    rs.getString("Acc_Password"), rs.getString("Acc_Role"),
                    rs.getNString("Us_FullName"), rs.getString("Us_Mail"),
                    rs.getString("Us_Phone"),
                    rs.getNString("Us_Address"));
        }
        return account;
    }

    public int accountAddNew(Account account) throws SQLException {
        int count = 0;

//        PreparedStatement pst = conn.prepareStatement("Insert into Student values(?,?,?,?,?,?)");
        pst = conn.prepareStatement("insert into Account values(?,?,?,?,?,?,?,?)");
        pst.setInt(1, account.getAcc_ID());
        pst.setString(2, account.getAcc_Name());
        pst.setString(3, account.getAcc_Password());
        pst.setString(4, account.getAcc_Role());
        pst.setString(5, account.getUs_FullName());
        pst.setString(6, account.getUs_Mail());
        pst.setString(7, account.getUs_Phone());
        pst.setString(8, account.getUs_Address());
        count = pst.executeUpdate();
        return count;

    }

    public int accountUpdate(Account ac) throws SQLException {
        int count = 0;
        pst = conn.prepareStatement("UPDATE ACCOUNT SET Acc_Name=?,Acc_Password=?,Acc_Role=?,Us_FullName=?,Us_Mail=?,Us_Phone=?,Us_Address=? WHERE Acc_ID=?");

        pst.setString(1, ac.getAcc_Name());
        pst.setString(2, ac.getAcc_Password());
        pst.setString(3, ac.getAcc_Role());
        pst.setString(4, ac.getUs_FullName());
        pst.setString(5, ac.getUs_Mail());
        pst.setString(6, ac.getUs_Phone());
        pst.setString(7, ac.getUs_Address());
        pst.setString(8, ac.getAcc_ID()+"");
        count = pst.executeUpdate();
        return count;
    }
//    
//    public void deleteStudent(String id) throws SQLException {
//        pst = conn.prepareStatement("DELETE FROM Account WHERE s_id=?");
//        pst.setString(1, id);
//        pst.executeUpdate();
//    }
}
