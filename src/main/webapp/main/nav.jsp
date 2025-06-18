<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
    <div class="container px-4 px-lg-5">
        <c:choose>
            <c:when test="${sessionScope.logined == null}">
                <a class="navbar-brand" href="../main/index.jsp">(학번)'s Blog</a>
            </c:when>
            <c:otherwise>
                <a class="navbar-brand" href="../main/index.jsp">${sessionScope.logined.email}</a>
            </c:otherwise>
        </c:choose>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">Menu<i class="fas fa-bars"></i></button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ms-auto py-4 py-lg-0">
                <!--
                <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="../blogs/list.do?pn=1">Blogs</a></li>
                -->
                <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="../blogs/list.do?by=desc,title&pn=1">Blogs</a></li>
                <c:choose>
                    <c:when test="${sessionScope.logined == null}">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="../members/login-form.do">Login</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="../members/post-form.do">Register</a></li>
                    </c:when>
                    <c:otherwise>
                        <c:if test="${sessionScope.admin != null}">
                            <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="../members/list.do?by=desc,name&pn=1">Bloggers</a></li>
                        </c:if>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="../blogs/post-form.do?email=${sessionScope.logined.email}&name=${sessionScope.logined.username}">Post</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="../members/detail.do?email=${sessionScope.logined.email}">Info</a></li>
                        <%--<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="../members/detail.do?email=${blog.email}">detail</a></li>--%>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="../members/logout.do">Logout</a></li>
                    </c:otherwise>
                </c:choose>
                <!-- / : servlet 에서는 Application Context 의미, jsp 에서는 root Context 의미 -->
            </ul>
        </div>
    </div>
</nav>