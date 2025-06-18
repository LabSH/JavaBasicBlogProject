<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>index.jsp</title>
        <%@ include file="../main/header.jsp"%> <!-- 페이지 모듈화 -->
    </head>
    <body>
        <!-- Navigation-->
        <jsp:include page="../main/nav.jsp"/>
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('../img/home-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>환영</h1>
                            <span class="subheading"> (이름 : 학번)' blog </span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Main Content-->
        <div class="container px-4 px-lg-5">
            <div class="row">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <!-- Post preview-->
                    <div class="row">
                        <h1 class="post-title">주요 기능 소개</h1>
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            회원 관리</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">회원 등록, 조회, 목록조회, 수정, 삭제</div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            블로그 관리</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">블로그 등록, 조회, 목록조회, 수정, 삭제</div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4 py-3 border-left-primary">
                            <div class="card-body">
                                로그인, 로그아웃, 관리자(admin)만 목록 조회, 로그인한 사용자만 블로그 등록, 수정, 삭제 가능
                            </div>
                        </div>
                    </div>
                    <!-- Divider-->
                    <hr class="my-4" />
                    <!-- Pager
                    <div class="d-flex justify-content-end mb-4"><a class="btn btn-primary text-uppercase" href="#!">Older Posts →</a></div>
                    -->
                </div>
            </div>
        </div>
        <!-- Footer-->
        <%@include file="../main/footer.jsp"%>
    </body>
</html>
