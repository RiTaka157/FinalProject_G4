/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.connection.DBConnection;
import com.model.Product;
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
public class ProductDAO {
    private Connection conn = null;
    PreparedStatement pst;
    ResultSet rs = null;
    Product[] allproduct = null;

    public Product[] getAllproduct() {
        return allproduct;
    }
    
    
    public ProductDAO() throws ClassNotFoundException, SQLException {
         conn = DBConnection.getConnection();
         allproduct = getProducts();
    }


    public ResultSet productGetAll() throws SQLException {
        Statement st = conn.createStatement();
        rs = st.executeQuery("Select* from Product");
        return rs;
    }
    
    public Product[] getProducts() throws SQLException {
        ResultSet rs = productGetAll();
        Product[] products = new Product[productGetLenght()];
        int count = 0;
        while (rs.next()) {
            products[count++] = new Product(Integer.parseInt(rs.getString(1)), rs.getString(2), rs.getString(3), rs.getString(4));
        }
        return products;
    }
    
      public ArrayList<Product> productGetAll_Arr() throws SQLException {
        Statement st = conn.createStatement();
        ArrayList<Product> arr = new ArrayList<>();
        rs = st.executeQuery("Select* from Product");
          while (rs.next()) {              
              arr.add( new Product(Integer.parseInt(rs.getString(1)), rs.getString(2), rs.getString(3), rs.getString(4)));
          }
        return arr;
    }
    
      public int productGetLenght() throws SQLException {
        Statement st = conn.createStatement();
        rs = st.executeQuery("Select COUNT(*) as CountProduct from Product");
        rs.next();
        return rs.getInt(1);
    }

    public Product getProductById(int pdt_id) throws SQLException {
        Product pr = null;
        PreparedStatement pst = conn.prepareStatement("Select * from Product where pdt_id=?");
        pst.setInt(1, pdt_id);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            pr = new Product(Integer.parseInt(rs.getString(1)), rs.getString(2), rs.getString(3), rs.getString(4));
        }
        return pr;
    }

    public Product getProductByName(String pdt_name) throws SQLException {
        Product pr = null;
        PreparedStatement pst = conn.prepareStatement("Select * from Product where pdt_name=?");
        pst.setString(1, pdt_name);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            pr = new Product(Integer.parseInt(rs.getString(1)), rs.getString(2), rs.getString(3), rs.getString(4));
        }
        return pr;
    }

    public int productAddNew(Product pr) throws SQLException {
        int count = 0;

//        PreparedStatement pst = conn.prepareStatement("Insert into Student values(?,?,?,?,?,?)");
        pst = conn.prepareStatement("insert into Product values(?,?,?,?)");
        pst.setInt(1, pr.getPdt_id() );
        pst.setString(2, pr.getPdt_name());
        pst.setString(3, pr.getPdt_price());
        pst.setString(4, pr.getPdt_image());
        count = pst.executeUpdate();
        return count;

    }
    
        public int productUpdate(Product pr ) throws SQLException {
        int count = 0;
        pst = conn.prepareStatement("UPDATE Product SET pdt_name=?, pdt_price=?, pdt_image=? WHERE pdt_id=?");

        pst.setString(1, pr.getPdt_name());
        pst.setString(2, pr.getPdt_price());
        pst.setString(3, pr.getPdt_image());
        pst.setString(4, pr.getPdt_id()+"");
        count = pst.executeUpdate();
        return count;
    }
    
    public void productDelete(String pdt_id) throws SQLException {
        pst = conn.prepareStatement("DELETE FROM Product WHERE pdt_id=?");
        pst.setString(1, pdt_id);
        pst.executeUpdate();
    }
}
