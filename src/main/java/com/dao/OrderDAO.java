/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.connection.DBConnection;
import com.model.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Nguyen Huyen Tran <CE161052>
 */
public class OrderDAO {
        private Connection conn = null;
    PreparedStatement pst;
    ResultSet rs = null;

    public OrderDAO() throws ClassNotFoundException, SQLException {
         conn = DBConnection.getConnection();
    }


    public ResultSet OrderGetAll() throws SQLException {
        Statement st = conn.createStatement();
        rs = st.executeQuery("Select* from Order");
        return rs;
    }
    
      public int OrderGetLenght() throws SQLException {
        Statement st = conn.createStatement();
        rs = st.executeQuery("Select COUNT(*) as CountOrder from Order");
        rs.next();
        return rs.getInt("CountOrder");
    }

    public Order getOrderById(int order_id) throws SQLException {
        Order or = null;
        PreparedStatement pst = conn.prepareStatement("Select * from Order where order_id=?");
        pst.setInt(1, order_id);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            or = new Order(order_id, rs.getDate(2), rs.getString(3), rs.getString(4));
        }
        return or;
    }


    public int OrderAddNew(Order or) throws SQLException {
        int count = 0;

//        PreparedStatement pst = conn.prepareStatement("Insert into Student values(?,?,?,?,?,?)");
        pst = conn.prepareStatement("insert into Order values(?,?,?,?)");
        pst.setInt(1, or.getOrder_id());
        pst.setDate(2, or.getOrder_date());
        pst.setString(3, or.getOrder_phone());
        pst.setString(3, or.getOrder_address());
        count = pst.executeUpdate();
        return count;

    }
    
    public int orderUpdate(Order or ) throws SQLException {
        int count = 0;
        pst = conn.prepareStatement("UPDATE Order SET order_date=?, order_phone=?, order_address=? WHERE order_id=?");

        pst.setString(1, String.valueOf(or.getOrder_date()));
        pst.setString(2, or.getOrder_phone());
        pst.setString(3, or.getOrder_address());
        pst.setString(4, or.getOrder_id()+"");
        count = pst.executeUpdate();
        return count;
    }
    
    public void orderDelete(String order_id) throws SQLException {
        pst = conn.prepareStatement("DELETE FROM Order WHERE order_id=?");
        pst.setString(1, order_id);
        pst.executeUpdate();
    }
}
