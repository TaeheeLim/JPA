<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Title Here</title>
<script type="text/javascript">
function fn_download(fname){
	//iframe 요소
	var vIfrm = document.getElementById("ifrm");
	vIfrm.src = "/download?fileName=" + encodeURIComponent(fname);
}
</script>
</head>
<body>
<%-- <jsp:include page="menu.jsp" /> --%>
<iframe id="ifrm" name="ifrm" style="display:none;"></iframe>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
		
		<div class="container">
			<div class="row" align="center">
				<c:forEach var="row" items="${list}">
				<div class="col-md-4">
					<a href="javascript:fn_download('${row.filename}')">
						<img alt="" src="/resources/images/${row.filename}" style="width:100%">
					</a>
<%-- 					<img src="${path}/resources/images/${row.filename}" style="width:100%" /> --%>
					<h3>${row.pname}</h3>
					<p>${row.description}</p>
					<p>${row.unitPrice}원</p>
					<p><a href="/product?productId=${row.productId}" 
						class="btn btn-secondary" role="button">상세정보&raquo;></a>
					</p>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
<%-- <jsp:include page="footer.jsp" /> --%>
</body>
</html>