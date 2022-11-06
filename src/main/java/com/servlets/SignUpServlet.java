/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlets;

import com.dao.AccountDAO;
import com.model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen Huyen Tran <CE161052>
 */
public class SignUpServlet extends HttpServlet {

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
            out.println("<title>Servlet SignUpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpServlet at " + request.getContextPath() + "</h1>");
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
            String name = request.getParameter("name").trim();
            AccountDAO dao = new AccountDAO();
            if (dao.getAccountByAccName(name) != null) {
                response.getWriter().append("Exited!");
            } else {
                response.getWriter().append("");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SignUpServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SignUpServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        if (request.getParameter("btnAdd") != null || request.getParameter("btnLogin") != null) {
            try {
                AccountDAO DAO = new AccountDAO();
                if (request.getParameter("btnAdd") != null) {
                    int Acc_ID = DAO.getLenght();
                    String Acc_Name = request.getParameter("txtUserName");
                    String Acc_Password = request.getParameter("txtPassword");
                    MessageDigest md = MessageDigest.getInstance("MD5");
                    md.update(Acc_Password.getBytes());
                    byte[] digest = md.digest();
                    StringBuffer sb = new StringBuffer();
                    for (byte b : digest) {
                        sb.append(String.format("%02x", b & 0xff));
                    }
                    Acc_Password = sb.toString();
                    String Acc_Role = "user";
                    String Us_FullName = request.getParameter("txtUserFullName");
                    String Us_Mail = request.getParameter("txtEmail");
                    String Us_Phone = request.getParameter("txtPhone");
                    String Us_Address = request.getParameter("txtAddress");

                    Account acc = new Account(Acc_ID, Acc_Name, Acc_Password, Acc_Role, Us_FullName, Us_Mail, Us_Phone, Us_Address);
                    DAO.addNew(acc);
                    response.getWriter().append("PassswordCorrect");
                    Cookie cookie = new Cookie("username", Acc_Name);
                    cookie.setMaxAge(3 * 24 * 60 * 60);
                    response.addCookie(cookie);
                }

                response.sendRedirect("index.jsp");
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(SignUpServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(SignUpServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(SignUpServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
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
