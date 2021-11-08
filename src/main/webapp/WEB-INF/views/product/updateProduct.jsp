<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정(/guestbook/updateProduct.jsp)</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품수정</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img alt="images" src="/resources/images/${productVO.filename}" style="width: 100%;" />
			</div>
			<div class="col-md-7">

				<form name="newProduct" action="/update"
					class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2">상품코드</label>
						<div class="col-sm-3">
							<input type="text" name="productId" id="productId"
								class="form-control" value="${productVO.productId}" readonly />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상품명</label>
						<div class="col-sm-3">
							<input type="text" name="pname" id="pname" class="form-control"
								value="${productVO.pname}" />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-3">
							<input type="text" name="unitPrice" id="unitPrice"
								class="form-control" value="${productVO.unitPrice}" />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상세 설명</label>
						<div class="col-sm-3">
							<textarea name="description" cols="50" rows="2"
								class="form-control">${productVO.description}</textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">제조사</label>
						<div class="col-sm-3">
							<input type="text" name="manufacturer" class="form-control"
								value="${productVO.manufacturer}" />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">분류</label>
						<div class="col-sm-3">
							<input type="text" name="category" class="form-control"
								value="${productVO.category}" />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">재고 수</label>
						<div class="col-sm-3">
							<input type="text" name="unitsInStock" id="unitsInStock"
								class="form-control" value="${productVO.unitsInStock}" />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상태</label> 
						<c:set var="lth" value='${productVO.condition}' />
						<div class="col-sm-3">
							<input type="radio" name="condition" value="New"
								<c:if test="${lth eq 'new'}">checked</c:if> />신규 제품
							<input type="radio" name="condition" value="Old"
								<c:if test="${lth eq 'old'}">checked</c:if> />중고 제품
							<input type="radio" name="condition" value="Refurbished"
								<c:if test="${lth eq 'refurbished'}">checked</c:if> />재생 제품
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-5">
							<input type="file" name="uploadFile" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-primary" value='등록'
								onclick="CheckAddProduct()" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>