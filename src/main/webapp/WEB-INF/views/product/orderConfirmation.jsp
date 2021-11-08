<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
</head>
<body>
<jsp:include page="menu.jsp" />
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">주문 정보</h1>
	</div>
	
	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong>
				<br />
				
				성명 : ${cookie.Shipping_name.value}<br />
				우편번호 : ${cookie.Shipping_zipCode.value} <br />
				주소 : ${cookie.addressName.value}(${cookie.Shipping_country.value}) <br />
			</div>
			<div class="col-4" align="right">
				<p><em>배송일 : ${cookie.Shipping_shippingDate.value}</em>
			</div>
			<div>
				<table class="table table-hover">
					<tr>
						<th class="text-center">상품</th>
						<th class="text-center">#</th>
						<th class="text-center">가격</th>
						<th class="text-center">소계</th>
					</tr>
						<c:set var="sum" value="0"/>
						<c:forEach var="row" items="${sessionScope.cartlist}">
							<tr>
								<td class="text-center"><em>${row.pname}</em></td>
								<td class="text-center">${row.quantity}</td>
								<td class="text-center">${row.unitPrice}</td>
								<td class="text-center">
									<c:set var="sum" value="${sum + row.unitPrice * row.quantity}"/>
									${row.unitPrice * row.quantity}원
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td class="text-right"><strong>총액 : </strong></td>
							<td class="text-center text-danger"><strong>${sum}</strong></td>
						</tr>
				</table>
				<a href="/shippingInfo?cartId=${cookie.Shipping_cartId.value}" 
					class="btn btn-secondary" role="button">이전</a>
				<a href="/thankCustomer" class="btn btn-success"
					role="button">주문완료</a>
				<a href="/checkOutCancelled" class="btn btn-secondary"
					role="button">취소</a>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>