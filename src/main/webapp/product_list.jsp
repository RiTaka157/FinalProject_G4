<%-- 
    Document   : product_list
    Created on : Oct 25, 2022, 8:46:55 AM
    Author     : Nguyen Huyen Tran <CE161052>
--%>

<%@page import="com.model.Product"%>
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
        <!--::header part start::-->
        <jsp:include page="header.jsp" flush="true"/>
        <!-- Header part end-->

        <!-- breadcrumb part start-->
        <section class="breadcrumb_part">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb_iner">
                            <h2>product list</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- breadcrumb part end-->
        <%
            ProductDAO productDAO = new ProductDAO();
            Product[] products = productDAO.getAllproduct();
        %>
        <!-- product list part start-->
        <section class="product_list section_padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="product_sidebar">
                            <div class="single_sedebar">
                                <form action="#">
                                    <input type="text" name="#" placeholder="Search keyword">
                                    <i class="ti-search"></i>
                                </form>
                            </div>
                            <div class="single_sedebar">
                                <div class="select_option">
                                    <div class="select_option_list">Category <i class="right fas fa-caret-down"></i> </div>
                                    <div class="select_option_dropdown">
                                        <p><a href="#">Category 1</a></p>
                                        <p><a href="#">Category 2</a></p>
                                        <p><a href="#">Category 3</a></p>
                                        <p><a href="#">Category 4</a></p>
                                    </div>
                                </div>
                            </div>
                            <div class="single_sedebar">
                                <div class="select_option">
                                    <div class="select_option_list">Type <i class="right fas fa-caret-down"></i> </div>
                                    <div class="select_option_dropdown">
                                        <p><a href="#">Type 1</a></p>
                                        <p><a href="#">Type 2</a></p>
                                        <p><a href="#">Type 3</a></p>
                                        <p><a href="#">Type 4</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="product_list">
                            <div class="row">
                                <% 
                                    for (Product product : products) {
                                %>
                                <div class="col-lg-6 col-sm-6">
                                    <div class="single_product_item">
                                        <img src="<%=product.getPdt_image()%>" alt="#" class="img-fluid">
                                        <h3> <a href="single-product.jsp?product_id=<%= product.getPdt_id() %>"><%= product.getPdt_name()%></a> </h3>
                                        <p>From <%= product.getPdt_price() %>$</p>
                                    </div>
                                </div>
                                <% 
                                    }
                                %>
                                
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- product list part end-->

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
                                <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p>
                                <h5>- Micky Mouse</h5>
                            </div>
                            <div class="single_client_review">
                                <div class="client_img">
                                    <img src="img/client_1.png" alt="#">
                                </div>
                                <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p>
                                <h5>- Micky Mouse</h5>
                            </div>
                            <div class="single_client_review">
                                <div class="client_img">
                                    <img src="img/client_2.png" alt="#">
                                </div>
                                <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p>
                                <h5>- Micky Mouse</h5>
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
        <section class="subscribe_part section_padding">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="subscribe_part_content">
                            <h2>Get promotions & updates!</h2>
                            <p>Seamlessly empower fully researched growth strategies and interoperable internal or ???organic??? sources credibly innovate granular internal .</p>
                            <div class="subscribe_form">
                                <input type="email" placeholder="Enter your mail">
                                <a href="#" class="btn_1">Subscribe</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- subscribe part end -->

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