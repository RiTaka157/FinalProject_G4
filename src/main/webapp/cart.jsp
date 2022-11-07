<%-- 
    Document   : cart
    Created on : Oct 25, 2022, 8:30:41 AM
    Author     : Nguyen Huyen Tran <CE161052>
--%>

<%@page import="com.dao.OrderDAO"%>
<%@page import="java.lang.String"%>
<%@page import="com.model.Product"%>
<%@page import="com.dao.ProductDAO"%>
<%@page import="com.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Account"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.CartDAO"%>
<%@page import="com.dao.AccountDAO"%>
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
            String userName = "";
            if (request.getCookies().length > 0) {
                for (Cookie c : request.getCookies()) {
                    if (c.getName().equals("username")) {
                        userName = c.getValue();
                    }
                }
            }

            if (userName.equals("")) {
                response.sendRedirect("/login.jsp");

            }
            AccountDAO accDAO = new AccountDAO();
            CartDAO cartDAO = new CartDAO();
            ProductDAO productDAO = new ProductDAO();
            ResultSet rs = accDAO.accountGetAll();
            Account acc = accDAO.getAccountByAccName(userName);
            int Sum = 0;
            ArrayList<Cart> cartArr = cartDAO.getCartByAcc_IDNull(acc.getAcc_ID());
            Product pr;
            OrderDAO orderDAO = new OrderDAO();
            String Order_id = acc.getUs_Phone().substring(acc.getUs_Phone().length() - 4, acc.getUs_Phone().length()) + "" + cartDAO.getNumOrderbyAcc_id(acc.getAcc_ID());
        %>
        <!-- breadcrumb part start-->
        <section class="breadcrumb_part">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb_iner">
                            <h2>Cart</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- breadcrumb part end-->

        <!--================Cart Area =================-->
        <br>
        <section class="cart_area ">
            <div class="container">
                <div class="cart_inner">
                    <div class="table-responsive">
                        <form action="checkout.jsp">
                            <input name="Acc_ID" value="<%=acc.getAcc_ID()%>" hidden readonly>
                            <input name="Order_ID" value="<%=Order_id%>" hidden readonly>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Product</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%
                                        for (Cart ca : cartArr) {
                                            pr = productDAO.getProductById(ca.getPdt_id());
                                    %>
                                    <tr>
                                        <td>
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img src="<%= pr.getPdt_image()%>" alt="" />
                                                </div>
                                                <div class="media-body">
                                                    <p><%= pr.getPdt_name()%></p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <h5>$<%= pr.getPdt_price()%></h5>
                                        </td>
                                        <td>
                                            <input name="<%= ca.getAcc_ID()%>/<%= pr.getPdt_id()%>" id="<%= ca.getAcc_ID()%>/<%= pr.getPdt_id()%>" type="number" value="<%= ca.getQuantity()%>" min="0" max="100">

                                        </td>

                                        <td>
                                            <h5 id="total_price<%= ca.getAcc_ID()%>/<%= pr.getPdt_id()%>">$<%= Integer.parseInt(pr.getPdt_price()) * Integer.parseInt(ca.getQuantity())%></h5>
                                            <% Sum = Sum + Integer.parseInt(pr.getPdt_price()) * Integer.parseInt(ca.getQuantity()); %>
                                        </td>

                                    </tr>
                                    <% }%>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2" scope="col" class="text-center">
                                            <h4>Total Price: $<%=Sum%></h4>
                                            <input name="Sum" value="<%=Sum%>" hidden readonly>
                                        </td>
                                    </tr>

                                    <tr class="bottom_button">
                                        <td>
                                            <input value="Update Cart" name="btnUpdateCart" class="btn_1" type="submit" />
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <div class="cupon_text float-right">
                                                <a class="btn_1" href="#">Close Coupon</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="shipping_area">
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <h5>Shipping</h5>
                                        </td>
                                        <td>
                                            <div class="shipping_box">
                                                <ul class="list">
                                                    <li>
                                                        Flat Rate: $5.00
                                                        <input name="ship" id="ship" type="radio" value="Flat Rate: $5">
                                                    </li>
                                                    <li>
                                                        Free Shipping
                                                        <input name="ship" id="ship" type="radio" value="Free Shipping: $0" checked>
                                                    </li>
                                                    <li class="active">
                                                        Local Delivery: $2.00
                                                        <input name="ship" id="ship" type="radio" value=" Local Delivery: $2" >
                                                    </li>
                                                </ul>

                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="checkout_btn_inner float-right">
                                <a class="btn_1" href="product_list.jsp">Continue Shopping </a>

                                <input type="submit" id="checkout" name="checkout" class="btn_1 checkout_btn_1" value="Proceed to checkout" />
                            </div>
                        </form>

                    </div>
                </div>
        </section>
        <!--================End Cart Area =================-->
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
