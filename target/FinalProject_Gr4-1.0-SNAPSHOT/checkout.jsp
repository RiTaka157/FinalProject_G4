<%-- 
    Document   : checkout
    Created on : Oct 25, 2022, 8:32:47 AM
    Author     : Nguyen Huyen Tran <CE161052>
--%>

<%@page import="com.model.Product"%>
<%@page import="com.dao.ProductDAO"%>
<%@page import="com.dao.AccountDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.model.Order"%>
<%@page import="com.dao.OrderDAO"%>
<%@page import="com.model.Cart"%>
<%@page import="com.model.Account"%>
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

            AccountDAO accountDAO = new AccountDAO();
            CartDAO cartDAO = new CartDAO();
            OrderDAO orderDAO = new OrderDAO();
            int Order_ID = Integer.valueOf(request.getParameter("Order_ID"));
            Account acc = accountDAO.getAccountById(Integer.valueOf(request.getParameter("Acc_ID")));
        %>
        <!-- breadcrumb part start-->
        <section class="breadcrumb_part">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb_iner">
                            <h2>checkout</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- breadcrumb part end-->

        <!--================Checkout Area =================-->
        <br>
        <section class="checkout_area ">
            <div class="container">
                <form action="OrderServlet" method="get"> 

                    <!--                <div class="cupon_area">
                                        <div class="check_title">
                                            <h2>
                                                Have a coupon?
                                                <a href="#">Click here to enter your code</a>
                                            </h2>
                                        </div>
                                        <input type="text" placeholder="Enter coupon code" />
                                        <a class="tp_btn" href="#">Apply Coupon</a>
                                    </div>-->
                    <div class="billing_details">
                        <div class="row">
                            <div class="col-lg-8">
                                <h3>Confirm Billing Details</h3>
                                <form class="row contact_form" action="#" method="post" novalidate="novalidate">
                                    <div class="col-md-6 form-group p_star">
                                        <input type="text" class="form-control" id="name" name="name" placeholder="Full name" value="<%=acc.getUs_FullName()%>" required/>

                                    </div>
                                    <div class="col-md-6 form-group p_star">
                                        <input type="text" class="form-control" id="number" name="number" placeholder="Phone number"  value="<%=acc.getUs_Phone()%>" required/>
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="mail" name="mail" placeholder="mail"  value="<%=acc.getUs_Mail()%>" required/>
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="address" name="address" placeholder="address" value="<%=acc.getUs_Address()%>" required/>
                                    </div>



                                    <div class="col-md-12 form-group">
                                        <div class="creat_account">
                                            <h3>Shipping Details</h3>
                                            <input type="checkbox" id="f-option3" name="selector" />
                                            <label for="f-option3">Ship to a different address?</label>
                                        </div>
                                        <textarea class="form-control" name="message" id="message" rows="1"
                                                  placeholder="Order Notes"></textarea>
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-4">
                                <div class="order_box">
                                    <h2>Your Order</h2>
                                    <ul class="list">
                                        <li>
                                            <a>Product
                                                <span>Total</span>
                                            </a>
                                        </li>
                                        <%
                                            ProductDAO productDAO = new ProductDAO();
                                            Product p;
                                            for (Cart ca : cartDAO.getCartByAcc_IDNull(acc.getAcc_ID())) {
                                                p = productDAO.getProductById(ca.getPdt_id());
                                        %>
                                        <li>
                                            <a ><%=p.getPdt_name()%>
                                                <span class="middle">x<%= ca.getQuantity()%></span>
                                                <span class="last">$<%= Double.parseDouble(p.getPdt_price()) * Double.parseDouble(ca.getQuantity())%></span>
                                            </a>
                                        </li>
                                        <% }%>
                                    </ul>
                                    <ul class="list list_2">
                                        <li>
                                            <a >Subtotal
                                                <span>$<%=request.getParameter("Sum")%></span>
                                            </a>
                                        </li>
                                        <li>
                                            <a>Shipping
                                                <span><%= request.getParameter("ship")%></span>
                                            </a>
                                        </li>
                                        <li>
                                            <a>Total
                                                <span>$<%= Double.parseDouble(request.getParameter("Sum"))%></span>
                                            </a>
                                        </li>
                                    </ul>
                                    <!--                                <div class="payment_item">
                                                                        <div class="radion_btn">
                                                                            <input type="radio" id="f-option5" name="selector" />
                                                                            <label for="f-option5">Check payments</label>
                                                                            <div class="check"></div>
                                                                        </div>
                                                                        <p>
                                                                            Please send a check to Store Name, Store Street, Store Town,
                                                                            Store State / County, Store Postcode.
                                                                        </p>
                                                                    </div>
                                                                    <div class="payment_item active">
                                                                        <div class="radion_btn">
                                                                            <input type="radio" id="f-option6" name="selector" />
                                                                            <label for="f-option6">Paypal </label>
                                                                            <img src="img/product/single-product/card.jpg" alt="" />
                                                                            <div class="check"></div>
                                                                        </div>
                                                                        <p>
                                                                            Please send a check to Store Name, Store Street, Store Town,
                                                                            Store State / County, Store Postcode.
                                                                        </p>
                                                                    </div>-->
                                    <div class="creat_account">
                                        <input type="checkbox" id="f-option4" name="selector" required/>
                                        <label for="f-option4">I’ve read and accept the </label>
                                        <a href="#">terms & conditions*</a>
                                    </div>
                                    <input name="Acc_ID" value="<%=acc.getAcc_ID()%>" hidden readonly>
                                    <input name="Order_ID" value="<%=request.getParameter("Order_ID") %>" hidden readonly>
                                    <input name="btnCheckOut" type="submit" class="btn_3 col-lg-12" value="Buy!" />
                                </div>
                                         
                            </div>
                        </div>
                    </div>
                </form>  
            </div>
        </section>
        <!--================End Checkout Area =================-->

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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
    </body>

</html>
