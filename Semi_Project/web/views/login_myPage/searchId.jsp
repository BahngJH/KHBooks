<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div id="logo"><a href="<%=request.getContextPath()%>/views/main/main.jsp"><b>KH BOOKS</b></a></div>
		<h3>아이디 찾기</h3>
		<div id="inputData">
		<form method="post" action="<%=request.getContextPath()%>/member/searchIdEnd" onsubmit="return fn_Frm();">
			<input type="text"  id="name" name="memberName" placeholder="이름"><br>
			<input type="text" id="eamil" name="email" placeholder="이메일"><br>
			<input type="submit" class="btn btn-primary" value="아이디 찾기">
		</form>
		</div>
	</div>
	
	<script>
		
	
	</script>
</body>
</html>