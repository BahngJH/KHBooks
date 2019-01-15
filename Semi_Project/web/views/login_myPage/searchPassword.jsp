<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
	#container{
		text-align:center;
	}
	a{
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
		<div id="logo"><a href="#"><b>KH BOOKS</b></a></div>
		<h2>비밀번호 찾기</h2>
		<div id="inputData">
		<form method="post" action="<%=request.getContextPath()%>/member/searchPw2">
			<input type="text"  id="id" name="memberId" placeholder="아이디"><br>
			<input type="text" id="eamil" name="email" placeholder="이메일"><br>
			<input type="submit" class="btn btn-primary" value="인증번호 전송">
		</form>
		</div>
	</div>

</body>
</html>