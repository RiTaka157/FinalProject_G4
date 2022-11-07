<%-- 
    Document   : AddProduct.jsp
    Created on : Nov 7, 2022, 12:13:30 PM
    Author     : Heterl0
--%>

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
                                    <th scope="col">Product Name</th>
                                    <th scope="col">Product Price</th>
                                    <th scope="col">Product Image</th>
                                    <th scope="col">Function</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    ProductDAO productDAO = new ProductDAO();
                                    ArrayList<Product> al = productDAO.productGetAll_Arr();
                                    for (Product product : al) {
                                %>
                                <tr>
                                    <th scope="row"><%= product.getPdt_id() %></th>
                                    <td><%= product.getPdt_name()%></td>
                                    <td>$ <%= product.getPdt_price() %></td>
                                    <td><img class="img-thumbnail" src="<%= product.getPdt_image() %>"/></td>
                                    <td><a class="link-border" href="updateProduct.jsp?pdt_id=<%= product.getPdt_id() %>">Update</td>
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
