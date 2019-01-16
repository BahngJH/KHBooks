<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)request.getAttribute("id");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 변경 창</title>
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
		<div id="logo"><a href="<%=request.getContextPath()%>/views/main/main.jsp"><b>KH BOOKS</b></a></div>
		<h3>비밀번호 변경</h3>
		<div id="inputData">
		<form method="post" action="<%=request.getContextPath()%>/member/searchPwEnd" onsubmit="return fn_Frm();">
			<input type="text" id="key" name="AuthenticationUser" placeholder="인증번호 입력"><br>
			<input type="password" id="pw" name="memberPwNew" placeholder="새 비밀번호 (6글자이상)"><br>
			<input type="password" id="pw_ck" placeholder="새 비밀번호 확인 (영문 숫자 특수문자 조합)"><br>
			<input type="submit" class="btn btn-primary" value="변경">
			<input type="hidden" name="memberId" value="<%=id%>">
		</form>
		</div>
	</div>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	function fn_Frm(){
		if($('#key').val().length<1)
			{
				alert("인증번호를 입력해주세요");
				return false;
			}
		
		var pw = $('#pw').val();
        var pwck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}/;
        if(!pwck.test(pw)){
           alert("조건을 지켜주세요!");
           return false;
        }
	//패스워크 확인 체크
		var pw = $('#pw').val();
        var pw_ck = $('#pw_ck').val();
        if(pw!=pw_ck){
            alert("패스워드가 일치하지 않습니다");
            return false;
        }   
	}
	
	</script>

</body>
</html>