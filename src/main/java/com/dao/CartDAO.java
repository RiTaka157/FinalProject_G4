/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.connection.DBConnection;
import com.model.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Nguyen Huyen Tran <CE161052>
 */
public class CartDAO {
     private Connection conn = null;
    PreparedStatement pst;
    ResultSet rs = null;

    public CartDAO() throws ClassNotFoundException, SQLException {
         conn = DBConnection.getConnection();
    }


    public ResultSet cartGetAll() throws SQLException {
        Statement st = conn.createStatement();
        rs = st.executeQuery("Select* from Cart");
        return rs;
    }
    
      public int cartGetLenght() throws SQLException {
        Statement st = conn.createStatement();
        rs = st.executeQuery("Select COUNT(*) as CountCart from Cart");
        rs.next();
        return rs.getInt("CountCart");
    }

    public  ArrayList<Cart> getCartByAcc_ID(int Acc_ID) throws SQLException {
        PreparedStatement pst = conn.prepareStatement("Select * from Product where Acc_ID=?");
        pst.setInt(1, Acc_ID);
        ResultSet rs = pst.executeQuery();
        ArrayList<Cart> cart = new ArrayList<>();
        while (rs.next()) {            
            cart.add( new Cart(rs.getString(1), Integer.parseInt(rs.getString(2)), rs.getString(3), Integer.parseInt(rs.getString(4))));
        }
        return cart;
    }
    
     public ArrayList<Cart> getCartByOrder_id(int order_id) throws SQLException {
        PreparedStatement pst = conn.prepareStatement("Select * from Product where order_id=?");
        pst.setInt(1, order_id);
        ResultSet rs = pst.executeQuery();
        ArrayList<Cart> cart = new ArrayList<>();
        while (rs.next()) {            
            cart.add( new Cart(rs.getString(1), Integer.parseInt(rs.getString(2)), rs.getString(3), Integer.parseInt(rs.getString(4))));
        }
        return cart;
    }

    public int CartAddNew(Cart ct) throws SQLException {
        int count = 0;

//        PreparedStatement pst = conn.prepareStatement("Insert into Student values(?,?,?,?,?,?)");
        pst = conn.prepareStatement("insert into Cart values(?,?,?,?)");
        pst.setString(1, ct.getAcc_ID() );
        pst.setInt(2, ct.getPdt_id() );
        pst.setString(3, ct.getQuantity());
        pst.setInt(4, ct.getOrder_id());
        count = pst.executeUpdate();
        return count;

    }
    
    public int cartUpdateByAccID(Cart ct ) throws SQLException {
        int count = 0;
        pst = conn.prepareStatement("UPDATE Cart SET pdt_id=?,quantity=?,order_id=? WHERE Acc_ID=?,");

        pst.setString(1,ct.getPdt_id()+"");
        pst.setString(2, ct.getQuantity() );
        pst.setString(3, ct.getOrder_id()+"");
        pst.setString(4, ct.getAcc_ID());
        count = pst.executeUpdate();
        return count;
    }
    
    public void cartDeleteByOrderID(String order_id) throws SQLException {
        pst = conn.prepareStatement("DELETE FROM Cart WHERE order_id=?");
        pst.setString(1, order_id);
        pst.executeUpdate();
    }
    
       public void cartDeleteByAccID(String Acc_ID) throws SQLException {
        pst = conn.prepareStatement("DELETE FROM Cart WHERE Acc_ID=?");
        pst.setString(1, Acc_ID);
        pst.executeUpdate();
    }
}
