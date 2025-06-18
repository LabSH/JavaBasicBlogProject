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
        <title>Blog List - Egyou's Blog</title>
        <%@ include file="../main/header.jsp"%> <!-- 페이지 모듈화, include 지시자 -->
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
                            <c:choose>
                                <c:when test="${requestScope.by != null}">
                                    <h1>Blog List</h1>
                                    <span class="subheading">${requestScope.by.replace(',',' ')}</span>
                                </c:when>
                                <c:otherwise>
                                    <h1>Blog List</h1>
                                </c:otherwise>
                            </c:choose>
                            <span class="subheading"></span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Main Content-->
        <div class="container px-4 px-lg-5">
            <c:if test="${requestScope.by != null}">
                <div class="post-preview">
                    <div class="post-meta">
                        <ul class="navbar-nav" style="flex-direction: row; justify-content: center">
                            <li><a class="nav-link px-lg-3 py-3 py-lg-4" href="../blogs/sort.do?by=desc,title&pn=1">desc title</a></li>
                            <li><a class="nav-link px-lg-3 py-3 py-lg-4" href="../blogs/sort.do?by=asc,title&pn=1">asc title</a></li>
                            <li><a class="nav-link px-lg-3 py-3 py-lg-4" href="../blogs/sort.do?by=desc,email&pn=1">desc email</a></li>
                            <li><a class="nav-link px-lg-3 py-3 py-lg-4" href="../blogs/sort.do?by=asc,email&pn=1">asc email</a></li>
                        </ul>
                    </div>
                </div>
            </c:if>
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <%--<%
                        request.getAttribute("blogList")
                        //형변환
                        //자바 if, for문 활용해서 처리해야 함
                    %>--%>
                    <c:forEach items="${requestScope.blogList}" var="blog">
                        <!-- Post preview-->
                        <div class="post-preview">
                            <a href="detail.do?id=${blog.id}">
                                <h2 class="post-title">${blog.title}</h2>
                                <h3 class="post-subtitle">${blog.content}</h3>
                            </a>
                            <p class="post-meta">
                                Posted by ${blog.email}
                            </p>
                         </div>
                        <!-- Divider-->
                        <hr class="my-4" />
                    </c:forEach>
                    <!-- Pager-->
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <c:choose>
                                    <c:when test="${requestScope.by != null}">
                                        <c:if test="${pagination.beginPageNo > pagination.perPagination}">
                                            <li class="page-item">
                                                <a class="page-link" href="../blogs/sort.do?by=${requestScope.by}&pn=${pagination.beginPageNo - 1}" tabindex="-1" aria-disabled="true">Previous</a>
                                            </li>
                                        </c:if>
                                        <c:forEach var="pageNo" begin="${pagination.beginPageNo}" end="${pagination.endPageNo}">
                                            <c:choose>
                                                <c:when test="${pageNo == pagination.curPageNo}">
                                                    <li class="page-item active"><a class="page-link" href="../blogs/sort.do?by=${requestScope.by}&pn=${pageNo}">${pageNo}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item"><a class="page-link" href="../blogs/sort.do?by=${requestScope.by}&pn=${pageNo}">${pageNo}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${pagination.endPageNo < pagination.totalPages}">
                                            <li class="page-item">
                                                <a class="page-link" href="../blogs/sort.do?by=${requestScope.by}&pn=${pagination.endPageNo + 1}" tabindex="-1" aria-disabled="true">Next</a>
                                            </li>
                                        </c:if>
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${pagination.beginPageNo > pagination.perPagination}">
                                            <li class="page-item">
                                                <a class="page-link" href="../blogs/list.do?pn=${pagination.beginPageNo - 1}" tabindex="-1" aria-disabled="true">Previous</a>
                                            </li>
                                        </c:if>
                                        <c:forEach var="pageNo" begin="${pagination.beginPageNo}" end="${pagination.endPageNo}">
                                            <c:choose>
                                                <c:when test="${pageNo == pagination.curPageNo}">
                                                    <li class="page-item active"><a class="page-link" href="../blogs/list.do?pn=${pageNo}">${pageNo}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item"><a class="page-link" href="../blogs/list.do?pn=${pageNo}">${pageNo}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${pagination.endPageNo < pagination.totalPages}">
                                            <li class="page-item">
                                                <a class="page-link" href="../blogs/list.do?pn=${pagination.endPageNo + 1}" tabindex="-1" aria-disabled="true">Next</a>
                                            </li>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </nav>
                        <%--<div class="d-flex justify-content-end mb-4"><a class="btn btn-primary text-uppercase" href="#!">Older Posts →</a></div>--%>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <%@include file="../main/footer.jsp"%>
    </body>
</html>
