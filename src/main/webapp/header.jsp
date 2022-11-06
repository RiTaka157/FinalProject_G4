<%-- 
    Document   : header
    Created on : Oct 25, 2022, 7:55:17 AM
    Author     : Nguyen Huyen Tran <CE161052>
--%>

<%@page import="com.model.Account"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        

         <%  String userName = "";
            if (request.getCookies().length > 0) {
                for (Cookie c : request.getCookies()) {
                    if (c.getName().equals("username")) {
                        userName = c.getValue();
                    }
                }
            } 
            AccountDAO DAO = new AccountDAO();
            ResultSet rs = DAO.accountGetAll();
            Account acc = DAO.getAccountByAccName(userName);
            %>
        <header class="main_menu home_menu">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <a class="navbar-brand" href="index.jsp"> <img src="img/logo.png" alt="logo"> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="menu_icon"><i class="fas fa-bars"></i></span>
                            </button>
                            <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="index.jsp">Home</a>
                                    </li>
                                    <!-- <li class="nav-item">
                                        <a class="nav-link" href="about.html">about</a>
                                    </li> -->
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_1"
                                           role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            product
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                            <a class="dropdown-item" href="product_list.jsp"> product list</a>
                                            <a class="dropdown-item" href="single-product.jsp">product details</a>

                                        </div>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_3"
                                           role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            pages
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                            <a class="dropdown-item" href="checkout.jsp">product checkout</a>
                                            <a class="dropdown-item" href="cart.jsp">shopping cart</a>
                                            <a class="dropdown-item" href="confirmation.jsp">confirmation</a>

                                        </div>
                                    </li>
                                    <% if (acc==null) {%>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="login.jsp" id="navbarDropdown_2"
                                           role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            login
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                            <a class="dropdown-item" href="login.jsp"> login</a>
                                            <a class="dropdown-item" href="signup.jsp">signup</a>
                                        </div>
                                    </li> 
                                    <% } else { %>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown_2"
                                           role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <%= acc.getUs_FullName() %>
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                            <a class="dropdown-item" href="LoginServlet"> logout</a>
                                        </div>
                                    </li> 
                                        
                                    <% } %>
<!--                                    <li class="nav-item">
                                        <a class="nav-link" href="contact.jsp">Contact</a>
                                    </li>-->
                                </ul>
                            </div>
                            <div class="hearer_icon d-flex align-items-center">
                                <a id="search_1" href="javascript:void(0)"><i class="ti-search"></i></a>
                                <a href="cart.jsp">
                                    <i class="flaticon-shopping-cart-black-shape"></i>
                                </a>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="search_input" id="search_input_box">
                <div class="container ">
                    <form class="d-flex justify-content-between search-inner">
                        <input type="text" class="form-control" id="search_input" placeholder="Search Here">
                        <button type="submit" class="btn"></button>
                        <span class="ti-close" id="close_search" title="Close Search"></span>
                    </form>
                </div>
            </div>
        </header>
    </body>
</html>
