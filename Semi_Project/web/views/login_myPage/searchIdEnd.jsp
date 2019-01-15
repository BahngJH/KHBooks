<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id = (String)request.getAttribute("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	#container{
		text-align:center;
	}
	#logo a{
		font-size:200%;
		text-decoration: none;
		color:pink;
	}
	input{
		width:305px; height:40px;
		margin-bottom: 15px;
		border: 1px solid gray;
        border-radius: 5px;
	}
</style>
</head>
<body>
<div id="container">
		<div id="logo"><a href="<%=request.getContextPath()%>/views/main/main.jsp"><b>KH BOOKS</b></a></div>
		<h3>회원님의 아이디는 다음과 같습니다.</h3>					
			<h4><%=id %></h4>
			<input type="button" class="btn btn-primary" onclick="goLogin()" value="로그인 하러 가기"><br><br>
			<a href="<%=request.getContextPath()%>/member/searchPw">비밀번호가 생각나지 않으시다구요? 찾으러갑시다!</a>
	</div>
	<script>
		function goLogin(){
			location.href="<%=request.getContextPath()%>/member/login";
		}
	
	</script>

</body>
</html>