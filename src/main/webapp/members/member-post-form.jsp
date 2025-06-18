<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%-- JSTL core 라이브러리 사용을 위한 선언, 태그 라이브러리 지시자 --%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Post Form - Egyou's Blog</title>
        <%@ include file="../main/header.jsp"%> <!-- 페이지 모듈화, include 지시자 -->
        <!-- Custom fonts for this template-->
        <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
                href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="../css/sb-admin-2.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Navigation-->
        <jsp:include page="../main/nav.jsp"/> <!-- JSP include 표준 action, 실행 시점에 호출되어 합쳐짐 -->
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('../img/home-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>Register</h1>
                            <span class="subheading">Blogger </span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Main Content-->
        <div class="container">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                        <div class="col-lg-7">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                                </div>
                                <form class="user" action="../members/post.do" method="post">
                                    <div class="form-group row">
                                        <div class="form-group">
                                            <input name="email" type="email" class="form-control form-control-user" id="exampleInputEmail"
                                                   placeholder="Email Address">
                                        </div>
                                        <div class="form-group">
                                            <input name="pw" type="password" class="form-control form-control-user" id="exampleFirstName"
                                                   placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <input name="username" type="text" class="form-control form-control-user" id="exampleLastName"
                                                   placeholder="Name">
                                        </div>
                                        <div class="form-group">
                                            <input name="phone" type="text" class="form-control form-control-user"
                                                   id="exampleInputPassword" placeholder="Phone">
                                        </div>
                                        <div class="form-group">
                                            <input name="address" type="text" class="form-control form-control-user"
                                                   id="exampleRepeatPassword" placeholder="Address">
                                        </div>
                                    </div>
                                    <button class="btn btn-primary btn-user btn-block" type="submit">
                                      Register Account
                                    </button>
                                    <%--<hr>
                                    <a href="index.html" class="btn btn-google btn-user btn-block">
                                        <i class="fab fa-google fa-fw"></i> Register with Google
                                    </a>
                                    <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                        <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                    </a>--%>
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="forgot-password.html">Forgot Password?</a>
                                </div>
                                <div class="text-center">
                                    <a class="small" href="login.html">Already have an account? Login!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- Footer-->
        <%@include file="../main/footer.jsp"%>
    </body>
</html>
