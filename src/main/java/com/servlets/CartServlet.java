/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlets;

import com.dao.AccountDAO;
import com.dao.CartDAO;
import com.model.Account;
import com.model.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen Huyen Tran <CE161052>
 */
public class CartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            if (request.getParameter("productPrice") != null) {
                response.getWriter().append((Integer.parseInt(request.getParameter("productPrice")) * Integer.parseInt(request.getParameter("quantity"))) + "");
            } else {
                String userName = "";
                if (request.getCookies().length > 0) {
                    for (Cookie c : request.getCookies()) {
                        if (c.getName().equals("username")) {
                            userName = c.getValue();
                        }
                    }
                }
                AccountDAO accDAO = new AccountDAO();
                CartDAO cartDAO = new CartDAO();
                ResultSet rs = accDAO.accountGetAll();
                Account acc = accDAO.getAccountByAccName(userName);
                if (acc == null) {
                    response.sendRedirect("login.jsp");
                } else {
                    String Acc_ID = acc.getAcc_ID() + "";
                    int pdt_id = Integer.parseInt(request.getParameter("id"));
                    String quantity = request.getParameter("quantity");
                    Cart ca = new Cart(Acc_ID, pdt_id, quantity);
                    cartDAO.CartAddNewNull(ca);
                    response.sendRedirect("cart.jsp");

                }
            } 

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        try {
            String userName = "";
            if (request.getCookies().length > 0) {
                for (Cookie c : request.getCookies()) {
                    if (c.getName().equals("username")) {
                        userName = c.getValue();
                    }
                }
            }
            AccountDAO accDAO = new AccountDAO();
            CartDAO cartDAO = new CartDAO();
            ResultSet rs = accDAO.accountGetAll();
            Account acc = accDAO.getAccountByAccName(userName);
            if (acc == null) {
                response.sendRedirect("login.jsp");
            } else {
                int Acc_ID = acc.getAcc_ID();
                ArrayList<Cart> carts = cartDAO.getCartByAcc_IDNull(Acc_ID);
                for (Cart cart : carts) {
                    response.getWriter().append(Acc_ID+"/"+cart.getPdt_id());
                    cart.setQuantity(request.getParameter(Acc_ID+"/"+cart.getPdt_id()));
                    if (cart.getQuantity().equals("0")) {
                        cartDAO.cartDeleteByProductID(cart.getPdt_id()+"");
                    } else {
                        cartDAO.cartUpdateByAccIDAndProduct_id(cart);
                    }
                }
                response.sendRedirect("cart.jsp");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
