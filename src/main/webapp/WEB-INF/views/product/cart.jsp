<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<script type="text/javascript">
var disabled = document.querySelector('.disabled');

disabled.addEventListener('click',function(){
	return false;
});
</script>
</head>
<body>
<%-- <jsp:include page="menu.jsp" /> --%>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">장바구니</h1>
	</div>
</div>
<c:if test=""></c:if>
<div class="container">
	<div class="row">
		<table width="100%;">
			<tr>
				<td align="left"><a href="/deleteCart?cartId=${sessionScope.cartId}"
					class="btn btn-danger">삭제하기</a></td>
				<td align="right"><a href="/shippingInfo?cartId=${sessionScope.cartId}"
					class="btn btn-success <c:if test="${empty list}">disabled</c:if>">주문하기</a></td>
			</tr>
		</table>
	</div>
	<div style="padding-top:50px;">
		<table class="table table-hover">
			<tr>
				<th>상품</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>
			</tr>
			<c:set var="sum" value="0" />
			<c:forEach items="${list}" var="row">
				<tr>
					<td>${row.productId} - ${row.pname}</td>
					<td>${row.unitPrice}</td>
					<td>${row.quantity}</td>
					<td>
						<c:set var="sum" value="${sum + row.unitPrice * row.quantity}" />
						${row.unitPrice * row.quantity}
					</td>
					<td><a href="/removeCart?id=${row.productId}"
						class="badge badge-danger">삭제</a></td>
				</tr>
			</c:forEach>
			<tr>
				<th></th>
				<th></th>
				<th>총액</th>
				<th>
					<c:out value="${sum}" />
				</th>
				<th></th>
			</tr>
		</table>
		<a href="/products" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a>
	</div>
</div>
<%-- <jsp:include page="footer.jsp" /> --%>
</body>
</html>