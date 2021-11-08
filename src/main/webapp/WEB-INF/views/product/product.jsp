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
<link href="resources/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<%-- <jsp:include page="menu.jsp" /> --%>
<div class="jumbotron">
   <div class="container">
      <h1 class="display-3">상품정보</h1>
   </div>
   
   <div class="container">
      <div class="row">

         <div class="col-md-5">
            <img src="${path}/resources/images/${vo.filename}" style="width:100%" />
         </div>
         <div class="col-md-6">
            <h3>${vo.pname}</h3>
            <p>${vo.description}</p>
            <p><b>상품 코드 : </b><span class="badge badge-danger">${vo.productId}</span></p>
            <p><b>제조사 : </b>${vo.manufacturer}</p>
            <p><b>분류 : </b>${vo.category}</p>
            <p><b>재고 수 : </b> <fmt:formatNumber value='${vo.unitsInStock}' pattern="#,###" />개</p>
            <h4><fmt:formatNumber value='${vo.unitPrice}' pattern="#,###" />원</h4>
            <p>
               <form name="addForm" action="/addCart?id=${vo.productId}" method="post">
                  <a href="#" class="btn btn-info" onclick="addToCart()">상품 주문&raquo;</a>
                  <a href="/cart" class="btn btn-warning">장바구니&raquo;</a>
                  <a href="/products" class="btn btn-secondary">상품 목록&raquo;</a> 
               </form>
            </p>
         </div>

      </div>
   </div>
</div>
<%-- <jsp:include page="footer.jsp" /> --%>
<script type="text/javascript">
function addToCart(){
	if(confirm("상품을 장바구니에 추가하시겠습니까?")){
		document.addForm.submit();
	} else {
		document.addForm.reset();
	}
}
</script>
</body>
</html>