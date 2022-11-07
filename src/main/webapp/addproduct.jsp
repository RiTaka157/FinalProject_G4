<%-- 
    Document   : AddProduct.jsp
    Created on : Nov 7, 2022, 12:13:30 PM
    Author     : Heterl0
--%>

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
        <div class="container">
            <div  class="row mt-5 justify-content-center align-items-center">
                <div clas="col-sm-10">
                    <div class="mt-5">
                        <h1>Add new product</h1>
                        <form action="AdminServlet" method="post">
                            <div class="form-group">
                                <label for="txtID">Auto-fill ID</label>
                                <% 
                                    ProductDAO productDAO = new ProductDAO();
                                    int index = productDAO.productGetLenght();
                                        while (productDAO.getProductById(index) != null) {
                                        index++;
                                    }
                                %>
                                <input type="text" value="<%= index%>" class="form-control" id="txtID" name="txtID" readonly>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-8">
                                    <label for="txtName">Product Name</label>
                                    <input type="text" class="form-control" id="txtName" name="txtName" placeholder="Product Name">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="txtPrice">Price</label>
                                    <input type="text" class="form-control" id="txtPrice" name="txtPrice" placeholder="Product Price">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtImage">File Image (*) URL only</label>
                                <input type="text" class="form-control" id="txtImage" name="txtImage" >
                            </div>  
                            <button type="submit" class="btn btn-info text-center">Add Product</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
