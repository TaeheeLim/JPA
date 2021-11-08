<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/js/validation.js"></script>
<title>/guestbook/addProduct.jsp</title>
<style type="text/css">
.imgs_wrap{
		width:300px;
		margin-top:50px;
}

.imgs_wrap img{
		max-width:100%;
	}
</style>
<script type="text/javascript">
$(function(){
	//이미지들 미리보기
	var sel_file = [];
	//input type=file의 id=input_img..
	$('#input_img').on('change',handleImgFileSelect);
	//파라미터 e : onchange 이벤트 객체
	function handleImgFileSelect(e){
		//이벤트가 발생된 타겟 안에 들어있는 이미지 파일들
		var files = e.target.files;
		//이미지가 여러개가 있을 수 있으므로 이미지들을 분리해서 배열로 만듬
		var filesArr = Array.prototype.slice.call(files); 
		//파일 타입의 배열 반복. f : 배열 안에 들어있는 이미지 파일 객체
		filesArr.forEach(function(f){
			//이미지 파일이 아닌경우 이미지 미리보기 실패
			if(!f.type.match("image.*")){
				alert("이미지 확장자만 가능합니다.");
				return;
			}
			//미리 선언된 전역 변수(배열)에 이미지 객체를 넣음
			sel_file.push(f);
			
			//이미지 객체를 읽을 reader 객체 생성
			var reader = new FileReader();
			// e : reader가 이미지 객체를 읽는 그 객체
			reader.onload = function(e){
				//e.target(이미지 객체)
				//e.target.result(reader가 이미지를 다 읽은 결과)
				var img_html = "<img src=\"" + e.target.result + "\" />";
				//div 사이에 이미지가 렌더링되어 화면에 보임
				$('.imgs_wrap').html(img_html);
			}
			//reader를 다음 이미지 파일(f)을 위해 초기화
			reader.readAsDataURL(f);
		}); // end forEach
	}
	
	//파일 확장자 제한
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|pdf)$");
	//파일 크기 제한
	var maxSize = 5242880; //5Mb
	
	//파일명과 파일크기를 체크하는 함수
	function checkExtension(fileName, fileSize){
		//파일크기 체크
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		//파일명의 정규식 체크
		if(regex.test(fileName)){
			alert("해당 종류의 파일을 업로드 할 수 없습니다.");
			return false;
		}
		//문제가 없다면
		return true;
	}
})
</script>
</head>
<body>
<!-- 
fmt:bundle => 태그 몸체에서 사용할 리소스 번들을 지정함
fmt:message => 메시지를 출력
fmt:setBundle => 특정 메시지 번들을 사용할 수 있도록 로딩함

위치: src/bundle/message.properties 및 src/bundle/mesasge_en.properties
 -->
<fmt:setLocale value='<%=request.getParameter("language")%>'/>
<fmt:bundle basename="bundle.message">
<%-- <jsp:include page="menu.jsp" /> --%>
<div class="jumbotron">
   <div class="container">
      <h1 class="display-3">상품 등록</h1>
   </div>
</div>
<div class="container">
	<div class="text-right">
		<a href="?language=ko">Korean</a>
		<a href="?language=en">English</a>&nbsp;
	</div>
   <form name="newProduct" action="/add" class="form-horizontal" 
   		method="post" enctype="multipart/form-data">
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="productId" /></label>
         <div class="col-sm-3">
            <input type="text" name="productId" id="productId" class="form-control"/>
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="pname" /></label>
         <div class="col-sm-3">
            <input type="text" name="pname" id="pname" class="form-control"/>
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="unitPrice" /></label>
         <div class="col-sm-3">
            <input type="text" name="unitPrice" id="unitPrice" class="form-control"/>
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="description" /></label>
         <div class="col-sm-3">
            <textarea name="description" id="content"
            	 cols="50" rows="2" class="form-control"></textarea>
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="manufacturer" /></label>
         <div class="col-sm-3">
            <input type="text" name="manufacturer" class="form-control"/>
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="category" /></label>
         <div class="col-sm-3">
            <input type="text" name="category" class="form-control"/>
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="unitsInStock" /> 수</label>
         <div class="col-sm-3">
            <input type="text" name="unitsInStock" id="unitsInStock" class="form-control"/>
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="condition" /></label>
         <div class="col-sm-3">
            <input type="radio" name="condition" value="New" /><fmt:message key="condition_New" />
            <input type="radio" name="condition" value="Old" /><fmt:message key="condition_Old" />
            <input type="radio" name="condition" value="Refurbished" /><fmt:message key="condition_Refurbished" />
         </div>
      </div>
      <div class="form-group row">
      	<label class="col-sm-2"><fmt:message key="filename" /></label>
      		<div class="col-sm-5">
      			<input type="file" id="input_img" name="uploadFile" class="form-control">
      		</div>
      		<div class="imgs_wrap">
			
			</div>
      </div>
      
      <div class="form-group row">
         <div class="col-sm-offset-2 col-sm-10">
            <input type="button" class="btn btn-primary" value='<fmt:message key="button" />'
            	onclick="CheckAddProduct()" />
         </div>
      </div>
   </form>
</div>
</fmt:bundle>
<%-- <jsp:include page="footer.jsp" /> --%>
<script>
CKEDITOR.replace("content");
</script>

</body>
</html>