<%-- 
    Document   : Menu
    Created on : Nov 1, 2023, 1:48:08 AM
    Author     : Hi Ryo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<nav class="navbar navbar-expand-md navbar-dark bg-success">
    <div class="container">
        <a class="navbar-brand" href="home"><img style="border-radius:50%;-moz-border-radius:50%;-webkit-border-radius:50%; width: 100px" src="img/logo.jpg" alt="logo"/></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-between" id="navbarsExampleDefault"> <!-- Thay đổi class thành justify-content-between -->
            <ul class="navbar-nav">
                <c:if test="${sessionScope.acc.isAdmin == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="account">Quản lí tài khoản</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc.isSell == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="manager">Quản lí sản phẩm</a>
                    </li>
                </c:if>
            </ul>
            <form action="search" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Tìm kiếm...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <a class="btn btn-success btn-sm ml-3" href="show">
                    <i class="fa fa-shopping-cart"></i> Giỏ hàng
                    <span class="badge badge-light">${amount == 0 ? "" : amount}</span>
                </a>
            </form>
            <ul class="navbar-nav">
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link" style="color: black" href="Login.jsp">Đăng nhập</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Hello ${sessionScope.acc.user}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout"><i class="fa-solid fa-right-from-bracket fa-lg" style="color: #ffffff;"></i>Logout</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>


<section class="jumbotron text-center" style="padding: 15px 16px">
    <div class="container" style="width: 100%">
        <div class="row">
            <div class="col-md-3 d-flex" style="align-items: center;">
                <img class="img-responsive" style="width:100%" src="https://cdn0.fahasa.com/media/wysiwyg/Thang-11-2023/TrangThieuNhiT923_Banner_SmallBanner_310x210-22_1.png">
            </div>
            <div class="col-md-6 d-flex" style="align-items: center;">              
                <div>
                    <h1 class="jumbotron-heading" style="color: green;">Book Store</h1>
                    <p class="lead text-muted mb-0">Uy tín luôn mang đến cho bạn những cuốn sách hay nhất</p>

                </div>
            </div>
            <div class="col-md-3">
                <img class="img-responsive" style="width:100%" src="https://theme.hstatic.net/1000363117/1000911694/14/hbanner_img1.png?v=512">
            </div>
        </div>
    </div>
</section>
