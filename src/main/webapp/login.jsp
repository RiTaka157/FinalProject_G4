<%-- 
    Document   : login
    Created on : Oct 25, 2022, 8:44:48 AM
    Author     : Nguyen Huyen Tran <CE161052>
--%>

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
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            var flag = true;
            $(document).ready(function () {
                $('.ajaxGetUserServletResponse').hide();
                $('.PassResponse').hide();
                $('#name').blur(function (event) {
                    flag = true;
                    $('.ajaxGetUserServletResponse').hide();
                    var name = $('#name').val();
                    $.get('SignUpServlet', {
                        name: name
                    }, function (responseText) {
                        if (responseText === "") {
                            $('.ajaxGetUserServletResponse').show();
                            flag = false;
                        }
                    });
                });
                $('#password').blur(function (event) {
                    flag = true;
                    var name = $('#name').val();
                    var pass = $('#password').val();
                    $.post('LoginServlet', {
                        name: name,
                        pass: pass
                    }, function (responseText) {
                        if (responseText === "") {
                            flag = false;
                        }
                    });
                });
                
                $("#LoginForm").submit(function () {
                    if (flag === true) {
                        return true;
                    }
                    $('.PassResponse').show();
                    return false;
                });
            });
        </script>
    </head>

    <body>
        <%  String userName = "";
            if (request.getCookies().length > 0) {
                for (Cookie c : request.getCookies()) {
                    if (c.getName().equals("username")) {
                        response.sendRedirect("index.jsp");
                    }
                }
            }            
        %>
        <!--::header part start::-->
        <jsp:include page="header.jsp" flush="true"/>
        <!-- Header part end-->

        <!-- breadcrumb part start-->
        <section class="breadcrumb_part">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb_iner">
                            <h2>login</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- breadcrumb part end-->

        <!--================login_part Area =================-->
        <section class="login_part section_padding ">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6">
                        <div class="login_part_text text-center">
                            <div class="login_part_text_iner">
                                <h2>New to our Shop?</h2>
                                <p>There are advances being made in science and technology
                                    everyday, and a good example of this is the</p>
                                <a href="signup.jsp" class="btn_3">Create an Account</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="login_part_form">
                            <div class="login_part_form_iner">
                                <h3>Welcome Back ! <br>
                                    Please Sign in now</h3>
                                <form id="LoginForm" class="row contact_form" action="SignUpServlet" method="post" novalidate="novalidate">
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="name" name="name" value=""
                                               placeholder="Username">
                                        <div class="ajaxGetUserServletResponse form-text text-danger">User name is not exit!</div>
                                    </div>

                                    <div class="col-md-12 form-group p_star">
                                        <input type="password" class="form-control" id="password" name="password" value=""
                                               placeholder="Password">
                                        <div class="PassResponse form-text text-danger">Password is not correct!</div>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <div class="creat_account d-flex align-items-center">
                                            <input type="checkbox" id="f-option" name="selector">
                                            <label for="f-option">Remember me</label>
                                        </div>
                                        <button name="btnLogin" id="btnLogin" type="submit" value="submit" class="btn_3">
                                            log in
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================login_part end =================-->

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
