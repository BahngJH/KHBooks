<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
		<div id="logo"><a href="<%=request.getContextPath() %>/main/mainview"><b>KH BOOKS</b></a></div>
		<h3>비밀번호 찾기</h3>
		<div id="inputData">
		<form method="post" action="<%=request.getContextPath()%>/member/searchPw2" onsubmit="return fn_Frm();">
			<input type="text"  id="id" name="memberId" placeholder="아이디"><br>
			<input type="text" id="eamil" name="email" placeholder="이메일"><br>
			<input type="submit" class="btn btn-primary" value="인증번호 전송">
		</form>
		</div>
	</div>
	
	<!-- input값들 vaildate줌 -->
	<script>
		function fn_Frm(){
			var id = $('#id').val().trim();
			var frm = 1;
			if(id.length<6)
			{
				frm=0;
				alert("아이디는 6글자 이상입니다.");
				return false;
			}
			return true;
		}
	</script>

</body>
</html>