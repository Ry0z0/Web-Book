<%-- 
    Document   : buy
    Created on : Nov 7, 2023, 4:10:59 PM
    Author     : Hi Ryo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buy</title>
        <script src="js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <link href="css/styleBuy.css" rel="stylesheet" type="text/css" media="all"/>
        <!-- for-mobile-apps -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
        <meta name="keywords" content="Classy Login form Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <!-- //for-mobile-apps -->
        <!--Google Fonts-->
        <link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <c:if test="${empty mess}">
            <form method="post" onsubmit="return validateForm()">
                <div class="header">
                    <div class="header-main">
                        <h1>Thông tin người mua</h1>
                        <div class="header-bottom">
                            <div class="header-right w3agile">
                                <div class="header-left-bottom agileinfo">
                                    <input type="text" id="tenKhachHang" placeholder="Tên khách hàng">
                                    <input type="text" id="soDienThoai" placeholder="Số Điện Thoại">
                                    <input type="text" id="diaChi" placeholder="Địa Chỉ">
                                    <input type="submit" value="Xác Nhận">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </c:if>
        <c:if test="${not empty mess}">
            <form action="home">
                <div class="header-main">
                    <div class="header-bottom">
                        <div class="header-right w3agile">
                            <div class="header-left-bottom agileinfo">
                                <input type="submit" value="Mua Thành Công">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </c:if>
    </body>
    <script>
        function validateForm() {
            var tenKhachHang = document.getElementById("tenKhachHang").value;
            var soDienThoai = document.getElementById("soDienThoai").value;
            var diaChi = document.getElementById("diaChi").value;

            if (tenKhachHang === "" || soDienThoai === "" || diaChi === "") {
                alert("Vui lòng điền đầy đủ thông tin.");
                return false;
            }

            // Kiểm tra định dạng số điện thoại (ví dụ: 10 chữ số)
            var phonePattern = /^\d{10}$/;
            if (!phonePattern.test(soDienThoai)) {
                alert("Số điện thoại không hợp lệ. Vui lòng nhập 10 chữ số.");
                return false;
            }

            return true;
        }
    </script>
</html>
