<%@page import="java.sql.SQLException"%>
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
<%-- <jsp:include page="menu.jsp" /> --%>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">상품 편집</h1>
	</div>
</div>

<div class="container">
	<div class="row" align="center">
		<div class="col-md-4">
			<c:forEach var="row" items="${list}">
			<img alt="제품" src="/resources/images/${row.filename}" style="width:100%;" />
			<h3>${row.pname}</h3>
			<p>${row.description}</p>
			<p>${row.unitPrice}원</p>
			<p>
				<c:if test="${param.edit eq 'update'}">
				<a href="/update?id=${row.productId}"
					class="btn btn-success" role="button">수정&raquo;</a>
				</c:if>
				<c:if test="${param.edit eq 'delete'}">
					<a href="#" onclick="deleteConfirm('${row.productId}')"
						class="btn btn-danger" role="button">삭제&raquo;</a>
				</c:if>
			</p>
			</c:forEach>
		</div>
	</div>
</div>
<%-- <jsp:include page="footer.jsp" /> --%>
<script type="text/javascript">
	//상품 삭제 여부를 확인하는 핸들러 함수
	function deleteConfirm(id){
		if(confirm("해당 상품을 삭제합니다!") == true){
			location.href="/delete?id=" + id;
		} else {
			//삭제취소(아무런 동작도 일어나지 않음)
			return;
		}
	}
</script>
</body>
</html>