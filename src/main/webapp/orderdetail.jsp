<%-- 
    Document   : confirmation
    Created on : Oct 25, 2022, 8:34:36 AM
    Author     : Nguyen Huyen Tran <CE161052>
--%>

<%@page import="com.model.Product"%>
<%@page import="com.dao.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Cart"%>
<%@page import="com.dao.CartDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">

    <head>
        <!-- Required meta tags -->
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
        <!--::header part start::-->
        <jsp:include page="header.jsp" flush="true"/>
        <!-- Header part end-->

        <% 
            int order_id = Integer.parseInt(request.getParameter("order_id"));
        %>

        <!--================ confirmation part start =================-->
        <section class="confirmation_part">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 justify-content-center align-items-center">
                        <div class="order_details_iner">
                            <h3>Order #<%= order_id %> Details</h3>
                            <table class="table table-borderless">
                                <thead>
                                    <tr>
                                        <th scope="col" colspan="2">Product</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        CartDAO cartDAO = new CartDAO();
                                        ArrayList<Cart> carts = cartDAO.getCartByOrder_id(order_id);
                                        ProductDAO productDAO = new ProductDAO();
                                        int totalMoney = 0;
                                        for (Cart cart : carts) {
                                        Product p = productDAO.getProductById(cart.getPdt_id());
                                        int money = Integer.parseInt(cart.getQuantity()) * Integer.parseInt(p.getPdt_price());  
                                        totalMoney += money;
                                    %>
                                    <tr>
                                        <th colspan="2"><span><%= p.getPdt_name() %></span></th>
                                        <th>x<%= cart.getQuantity()  %></th>
                                        <th> <span>$ <%= money %> </span></th>
                                    </tr>
                                    <% 
                                        }
                                    %>
                                    <tr>
                                        <th colspan="3">Subtotal</th>
                                        <th> <span>$ <%= totalMoney %></span></th>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
        </section>
        <!--================ confirmation part end =================-->

        <!--::footer_part start::-->
        <jsp:include page="footer.jsp" flush="true"/>
        <!--::footer_part end::-->

        <!-- jquery plugins here-->
        <script src="js/jquery-1.12.1.min.js"></script>
        <!-- popper js -->
        <script src="js/popper.min.js"></script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <!-- easing js -->
        <script src="js/jquery.magnific-popup.js"></script>
        <!-- swiper js -->
        <script src="js/swiper.min.js"></script>
        <!-- swiper js -->
        <script src="js/mixitup.min.js"></script>
        <!-- particles js -->
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <!-- slick js -->
        <script src="js/slick.min.js"></script>
        <script src="js/jquery.counterup.min.js"></script>
        <script src="js/waypoints.min.js"></script>
        <script src="js/contact.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="js/jquery.form.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/mail-script.js"></script>
        <!-- custom js -->
        <script src="js/custom.js"></script>
    </body>

</html>
