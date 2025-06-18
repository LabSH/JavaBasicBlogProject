<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Clean Blog - Start Bootstrap Theme</title>
        <%@ include file="../main/header.jsp"%> <!-- 페이지 모듈화 -->
    </head>
    <body>
        <!-- Navigation-->
        <%@ include file="../main/nav.jsp"%>
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('../img/about-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="page-heading">
                            <h1>오류</h1>
                            <!-- HTML 주석
                            EL : $ {} 형식의 JSP 프로그래밍 요소
                            EL은 속성값 접근을 손쉽게 할 목적으로 정의
                            속성값은 JSP에서는 4개의 유효범위(scope)를 가짐 : pageScope, requestScope, sessionScope, applicationScope
                            명확하게 써주는 것이 좋음
                            -->
                            <%-- JSP 주석
                            ${requestScope.name} : ${email} :
                            <%
                                String email = (String) request.getAttribute("email");
                                out.println(email);
                            %>
                            --%>
                            <span class="subheading">${errMsg} 요청 처리 실패</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Main Content-->
        <main class="mb-4">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <p> 요청이 정상 처리되지 않았습니다. 불편을 드려 죄송합니다. </div>
                </div>
            </div>
        </main>
        <!-- Footer-->
        <%@ include file="../main/footer.jsp"%>
    </body>
</html>
