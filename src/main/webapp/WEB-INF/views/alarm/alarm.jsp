<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Title Here</title>
</head>
<body>
<button onclick="alarm()">Alarm</button>

<script type="text/javascript">
	window.onload = function(){
		if(window.Notification){
			Notification.requestPermission();
		}
	}
	
	function alarm(){
		setTimeout(function(){
			notify();
		}, 5000);
	}
	
	function notify(){
		if(Notification.permission !== 'granted'){
			alert('notification is disabled');
		} else {
			var notification = new Notification('깐부조 화이팅',{
		          icon : '/resources/images/권영채.jpg',
                  body: '최프 1등하고 회식하자!'
			});
			
			notification.onclick = function () {
				window.open('http://google.com');
			};
		}
	}
</script>
</body>
</html>