<%-- 
    Document   : index
    Created on : Oct 24, 2022, 8:43:25 PM
    Author     : Nguyen Huyen Tran <CE161052>
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Product"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.ProductDAO"%>
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
        <%
            ProductDAO productDAO = new ProductDAO();
            ResultSet rs;
        %>
        <!--::header part start::-->
        <jsp:include page="header.jsp" flush="true"/>
        <!-- Header part end-->

        <!-- banner part start-->
        <section class="banner_part">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-5">
                        <div class="banner_text">
                            <div class="banner_text_iner">
                                <h1>Best quality
                                    pillow</h1>
                                <p>Seamlessly empower fully researched 
                                    growth strategies and interoperable internal</p>
                                <a href="product_list.jsp" class="btn_1">shop now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="banner_img">
                <img src="img/banner.png" alt="#" class="img-fluid">
                <img src="img/banner_pattern.png " alt="#" class="pattern_img img-fluid">
            </div>
        </section>
        <!-- banner part start-->

        <!-- product list start-->
        <section class="single_product_list">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="single_product_iner">
                            <div class="row align-items-center justify-content-between">
                                <div class="col-lg-6 col-sm-6">
                                    <div class="single_product_img">
                                        <img src="img/single_product_1.png" class="img-fluid" alt="#">
                                        <img src="img/product_overlay.png" alt="#" class="product_overlay img-fluid">
                                    </div>
                                </div>
                                <div class="col-lg-5 col-sm-6">
                                    <div class="single_product_content">
                                        <h5>Started from $10</h5>
                                        <h2> <a href="single-product.html">Printed memory foam 
                                                brief modern throw 
                                                pillow case</a> </h2>
                                        <a href="single-product.jsp?product_id=9" class="btn_3">Explore Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single_product_iner">
                            <div class="row align-items-center justify-content-between">
                                <div class="col-lg-6 col-sm-6">
                                    <div class="single_product_img">
                                        <img src="img/single_product_2.png" class="img-fluid" alt="#">
                                        <img src="img/product_overlay.png" alt="#" class="product_overlay img-fluid">
                                    </div>
                                </div>
                                <div class="col-lg-5 col-sm-6">
                                    <div class="single_product_content">
                                        <h5>Started from $10</h5>
                                        <h2> <a href="single-product.html">Printed memory foam 
                                                brief modern throw 
                                                pillow case</a> </h2>
                                        <a href="single-product.jsp?product_id=5" class="btn_3">Explore Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single_product_iner">
                            <div class="row align-items-center justify-content-between">
                                <div class="col-lg-6 col-sm-6">
                                    <div class="single_product_img">
                                        <img src="img/single_product_3.png" class="img-fluid" alt="#">
                                        <img src="img/product_overlay.png" alt="#" class="product_overlay img-fluid">
                                    </div>
                                </div>
                                <div class="col-lg-5 col-sm-6">
                                    <div class="single_product_content">
                                        <h5>Started from $10</h5>
                                        <h2> <a href="single-product.html">Printed memory foam 
                                                brief modern throw 
                                                pillow case</a> </h2>
                                        <a href="single-product.jsp" class="btn_3">Explore Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- product list end-->


        <!-- trending item start-->
        <section class="trending_items">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section_tittle text-center">
                            <h2>New Arrivals</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <%
                        ArrayList<Product> arr = productDAO.productGetAll_Arr();
                        for (Product pro : arr.subList(arr.size() - 6, arr.size())) {

                    %>
                    <div class="col-lg-4 col-sm-6">
                        <div class="single_product_item">
                            <div class="single_product_item_thumb">
                                <img src="<%= pro.getPdt_image()%>" alt="#" class="img-fluid">
                            </div>
                            <h3> <a href="single-product.jsp?product_id=<%= pro.getPdt_id()%>"><%= pro.getPdt_name()%></a> </h3>
                            <p>From $ <%= pro.getPdt_price()%></p>
                        </div>
                    </div>
                    <% }%>
                </div>
            </div>
        </section>
        <!-- trending item end-->

        <!-- client review part here -->
        <section class="client_review">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="client_review_slider owl-carousel">
                            <div class="single_client_review">
                                <div class="client_img">
                                    <img src="img/client.png" alt="#">
                                </div>
                                <p>CE000000</p>
                                <h5>- T??N tv</h5>
                            </div>
                            <div class="single_client_review">
                                <div class="client_img">
                                    <img src="img/client_1.png" alt="#">
                                </div>
                                <p>CE000000</p>
                                <h5>- T??N tv</h5>
                            </div>
                            <div class="single_client_review">
                                <div class="client_img">
                                    <img src="img/client_2.png" alt="#">
                                </div>
                                <p>CE000000</p>
                                <h5>- T??N tv</h5>
                            </div>
                            <div class="single_client_review">
                                <div class="client_img">
                                    <img src="img/client.png" alt="#">
                                </div>
                                <p>CE000000</p>
                                <h5>- T??N tv</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- client review part end -->


        <!-- feature part here -->
        <section class="feature_part section_padding">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-6">
                        <div class="feature_part_tittle">
                            <h3>Credibly innovate granular
                                internal or organic sources
                                whereas standards.</h3>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="feature_part_content">
                            <p>Seamlessly empower fully researched growth strategies and interoperable internal or ???organic??? sources. Credibly innovate granular internal or ???organic??? sources whereas high standards in web-readiness.</p>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-lg-3 col-sm-6">
                        <div class="single_feature_part">
                            <img src="img/icon/feature_icon_1.svg" alt="#">
                            <h4>Credit Card Support</h4>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single_feature_part">
                            <img src="img/icon/feature_icon_2.svg" alt="#">
                            <h4>Online Order</h4>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single_feature_part">
                            <img src="img/icon/feature_icon_3.svg" alt="#">
                            <h4>Free Delivery</h4>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single_feature_part">
                            <img src="img/icon/feature_icon_4.svg" alt="#">
                            <h4>Product with Gift</h4>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- feature part end -->

        <!-- subscribe part here -->
        <div id ="foot">
            <jsp:include page="footer.jsp" flush="true"/>
        </div>
        <!-- subscribe part end -->

        <!--::footer_part start::-->

        <!--::footer_part end::-->

        <!-- jquery plugins here-->
        <script src="js/jquery-1.12.1.min.js"></script>
        <!-- popper js -->
        <script src="js/popper.min.js"></script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <!-- magnific popup js -->
        <script src="js/jquery.magnific-popup.js"></script>
        <!-- carousel js -->
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
