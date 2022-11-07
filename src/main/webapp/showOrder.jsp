<%-- 
    Document   : AddProduct.jsp
    Created on : Nov 7, 2022, 12:13:30 PM
    Author     : Heterl0
--%>

<%@page import="com.dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Product"%>
<%@page import="com.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>pillloMart</title>
        <link rel="icon" href="img/favicon.png">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- animate CSS -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- owl carousel CSS -->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <!-- font awesome CSS -->
        <link rel="stylesheet" href="css/all.css">
        <!-- flaticon CSS -->
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <!-- font awesome CSS -->
        <link rel="stylesheet" href="css/magnific-popup.css">
        <!-- swiper CSS -->
        <link rel="stylesheet" href="css/slick.css">
        <!-- style CSS -->
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <style>
            #search_input_box {
                display: none;
            }
        </style>
        <div class="container">
            <div  class="row mt-5 justify-content-center align-items-center">
                <div clas="col-sm-10">
                    <div class="">
                        <table class="table">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">#ID</th>
                                    <th scope="col">Order Date</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">Address</th>
                                    <th scope="col">Detail</th>
                                    <th scope="col">Function</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    OrderDAO orderDAO  = new OrderDAO();
                                    ResultSet s = orderDAO.OrderGetAll();
                                    while (s.next()) {
                                %>
                                <tr>
                                    <th scope="row"><%= s.getInt(1) %></th>
                                    <td><%= s.getDate(2).toString() %></td>
                                    <td><%= s.getString(3) %></td>
                                    <td><%= s.getString(4) %></td>
                                    <td><a class="link-border" href="orderdetail.jsp?order_id=<%= s.getInt(1) %>">Detail</td>
                                    <td><a class="link-border" href="AdminServlet?order_id=<%= s.getInt(1) %>">Delete</td>
                                </tr>
                                <% 
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
