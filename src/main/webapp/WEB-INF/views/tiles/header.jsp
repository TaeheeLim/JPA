<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="/welcome">Home</a>
			<a class="navbar-brand" href="/add">상품등록</a>
		</div>
	</div>
	<div>
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="/products">상품 목록</a></li>
			<li class="nav-item"><a class="nav-link" href="/add">상품 등록</a></li>
			<li class="nav-item"><a class="nav-link" href="/edit?edit=update">상품수정</a></li>
			<li class="nav-item"><a class="nav-link" href="/edit?edit=delete">상품삭제</a></li>
		</ul>
	</div>
</nav>