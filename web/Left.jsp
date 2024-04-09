<%-- 
    Document   : Left
    Created on : Nov 1, 2023, 2:20:13 AM
    Author     : Hi Ryo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <div class="col-sm-3">
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-success text-white text-uppercase"><i class="fa fa-list"></i> Danh sách</div>
                        <ul class="list-group category_block">
                            <c:forEach items="${listCC}" var="o">
                                <li class="list-group-item text-white ${tag == o.cid ? "active":""}"><a href="category?cid=${o.cid}">${o.cname}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="card bg-light mb-3">
                        <div  class="card-header bg-success text-white text-uppercase">Sản phẩm mới nhất</div>
                        <div class="card-body">
                            <a href="detail?pid=${p.id}"><img class="img-fluid" src="${p.image}" /></a>
                            <h4 class="card-title show_txt"><a href="detail?pid=${p.id}" title="View Product">${p.name}</a></h4>
                            <p class="card-text">${p.title}</p>
                            <p class="bloc_left_price"><fmt:formatNumber type="currency" value="${p.price}" currencyCode="VND" /></p>
                            
                        </div>
                    </div>
                </div>
