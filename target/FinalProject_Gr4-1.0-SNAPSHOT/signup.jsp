<%-- 
    Document   : signup
    Created on : Nov 1, 2022, 9:34:24 AM
    Author     : Nguyen Huyen Tran <CE161052>
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            var flag;
            var patern_email =
                    /^[a-zA-Z]+\w*([.-_]\w+)*\@[a-zA-Z]+\w*([.-_]\w+)*(\.\w+)+$/;
            var patenr_phone = /^0[1-9]\d{8,10}$/;
            $(document).ready(function () {
                $("#txtUserNameHelpBlock").hide();
                $("#txtUserFullNameHelpBlock").hide();
                $("#txtPasswordHelpBlock").hide();
                $("#txtComfirmPasswordHelpBlock").hide();
                $("#txtEmailHelpBlock").hide();
                $("#txtPhoneHelpBlock").hide();
                $('.idError').hide();
                $('#txtUserName').blur(function (event) {
                    var name = $('#txtUserName').val();
                    $.get('SignUpServlet', {
                        name: name
                    }, function (responseText) {
                        if (responseText === '') {
                            $('.idError').hide();
                            flag = true;
                        } else {
                            $('.idError').show();
                            flag = false;
                        }
                    });
                });
                $("#registerForm").submit(function () {
                    $("#txtUserNameHelpBlock").hide();
                    $("#txtPasswordHelpBlock").hide();
                    $("#txtComfirmPasswordHelpBlock").hide();
                    $("#txtEmailHelpBlock").hide();
                    $("#txtPhoneHelpBlock").hide();
                    var username = $.trim($("#txtUserName").val());
                    var fullname = $.trim($("#txtUserFullName").val());
                    var password = $.trim($("#txtPassword").val());
                    var comfirmPassword = $.trim($("#txtComfirmPassword").val());
                    var email = $.trim($("#txtEmail").val());
                    var phone = $.trim($("#txtPhone").val());

                    flag = true;
                    errorArray = [];
                    if (username == "") {
                        $("#txtUserNameHelpBlock").show();
                        flag = false;
                    }
                    if (fullname == "") {
                        $("#txtUserFullNameHelpBlock").show();
                        flag = false;
                    }
                    if ((password.length < 6) | (password.length > 20)) {
                        $("#txtPasswordHelpBlock").show();
                        flag = false;
                    }
                    if (comfirmPassword != password) {
                        $("#txtComfirmPasswordHelpBlock").show();
                        flag = false;
                    }
                    if (patern_email.test(email) == false) {
                        $("#txtEmailHelpBlock").show();
                        flag = false;
                    }
                    if (patenr_phone.test(phone) == false) {
                        $("#txtPhoneHelpBlock").show();
                        flag = false;
                    }

                    if (flag == true) {
                        $("#btnSubmitStatus").text("Register Succesful!");
                        return true;
                    }
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
                            <h2>Register New Account</h2>
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
                                <p>If you have had the account you can go back login page and Sign in now!! </p>
                                <a href="login.jsp" class="btn_3">Back to Login</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="login_part_form">
                            <div class="login_part_form_iner">
                                <h3>Welcome ! <br>
                                    Please Create Your Account</h3>
                                <form class="row contact_form" action="SignUpServlet" method="post" novalidate="novalidate" id="registerForm">
                                    <div class="col-md-12 form-group p_star">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <i class="fa fa-user"></i>
                                                </div>
                                            </div>
                                            <input
                                                id="txtUserName"
                                                name="txtUserName"
                                                placeholder="Please enter your username"
                                                type="text"
                                                class="form-control"
                                                aria-describedby="txtUserNameHelpBlock"
                                                required="required"
                                                />
                                        </div>
                                        <span id="txtUserNameHelpBlock" class="form-text text-danger">Username can't empty</span>

                                        <div class="idError form-text text-danger">User has been existed!</div>
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <i class="fa fa-user"></i>
                                                </div>
                                            </div>
                                            <input
                                                id="txtUserFullName"
                                                name="txtUserFullName"
                                                placeholder="Please enter your full name"
                                                type="text"
                                                class="form-control"
                                                aria-describedby="txtUserFullNameHelpBlock"
                                                required="required"
                                                />
                                        </div>
                                        <span id="txtUserFullNameHelpBlock" class="form-text text-danger">User full name can't empty</span>
                                    </div>


                                    <div class="col-md-12 form-group p_star">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <i class="fa fa-key"></i>
                                                </div>
                                            </div>
                                            <input
                                                id="txtPassword"
                                                name="txtPassword"
                                                placeholder="Please enter your password"
                                                type="password"
                                                class="form-control"
                                                aria-describedby="txtPasswordHelpBlock"
                                                required="required"
                                                />
                                        </div>
                                        <span id="txtPasswordHelpBlock" class="form-text text-danger"
                                              >Password length must be from 6 to 20 character</span>
                                    </div> 

                                    <div class="col-md-12 form-group p_star">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <i class="fa fa-key"></i>
                                                </div>
                                            </div>
                                            <input
                                                id="txtComfirmPassword"
                                                name="txtComfirmPassword"
                                                placeholder="Please comfirm your password"
                                                type="password"
                                                aria-describedby="txtComfirmPasswordHelpBlock"
                                                class="form-control"
                                                required="required"
                                                />
                                        </div>
                                        <span id="txtComfirmPasswordHelpBlock" class="form-text text-danger"
                                              >The password and confirm password must be the same</span>
                                    </div>

                                    <div class="col-md-12 form-group p_star">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <i class="fa fa-address-card"></i>
                                                </div>
                                            </div>
                                            <input
                                                id="txtEmail"
                                                name="txtEmail"
                                                placeholder="Please enter your email address"
                                                type="text"
                                                aria-describedby="txtEmailHelpBlock"
                                                class="form-control"
                                                required="required"
                                                />
                                        </div>
                                        <span id="txtEmailHelpBlock" class="form-text text-danger"
                                              >You must be enter valid email address</span
                                        >
                                    </div>

                                    <div class="col-md-12 form-group p_star">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <i class="fa fa-phone"></i>
                                                </div>
                                            </div>
                                            <input
                                                id="txtPhone"
                                                name="txtPhone"
                                                placeholder="Please enter mobile phone number"
                                                type="text"
                                                aria-describedby="txtPhoneHelpBlock"
                                                class="form-control"
                                                required="required"
                                                />
                                        </div>
                                        <span id="txtPhoneHelpBlock" class="form-text text-danger"
                                              >Please enter valid mobile phone number</span
                                        >
                                    </div>

                                    <div class="col-md-12 form-group p_star">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <i class="fa fa-location-arrow"></i>
                                                </div>
                                            </div>
                                            <input
                                                id="txtAddress"
                                                name="txtAddress"
                                                placeholder="Please enter address"
                                                type="text"
                                                class="form-control"
                                                required="required"
                                                />
                                        </div>
                                    </div>


                                    <div class="col-md-12 form-group">
                                        <input
                                            id="btnAdd"
                                            name="btnAdd"
                                            type="submit"
                                            class="btn_3"
                                            value="Register"
                                            />


                                        <p id="txtSubmitStatus" class="text-info"></p>

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


