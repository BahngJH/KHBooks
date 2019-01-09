<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css">
</head>
<body>
<div id="container">
        <div id="logo"><a href="#">KH BOOKS</a></div>
        <hr>
        <form method="POST" name="memberInfo" onsubmit="return fn_log();" action="<%=request.getContextPath() %>/member/login" target="_self">
            <div id="login">
                <input type="text" id="id" name="id" placeholder="아이디" style="width:305px; height:40px;"><br>
                <input type="password" id="password" name="password" placeholder="비밀번호" style="width:305px; height:40px;"><br>
                <input type="checkbox" id="checkbox" class="keepLogin" name="logincheck" value="true"><label class="keepLogin">로그인
                    유지</label> <a href="searchId.html" class="search">아이디 찾기 </a><a class="search" href="#">비밀번호 찾기</a>
                <br> <span></span><br>
               
                <input type="submit" value="로그인" class="btn btn-primary" style="width:305px; height:50px;"></button><br><br>
        </form>
        <form method="GET" action="<%=request.getContextPath()%>/views/login_myPage/enroll.jsp">
            <input type="submit" value="회원가입" class="btn btn-default" style="width:305px; height:50px;"></button>
        </form>
    </div>
    </div>
    <script>
    	function fn_log(){
    		var id = $('#id').val().trim().length();
    		
    		var pw = $('#password').val().trim().length();
    		
    		console.log(id);
    		console.log(pw);
    		
    		if(id<0 || pw<0)
    		{
    			alert("아이디와 비밀번호를 입력해주세요");
    			return false;
    		}
    		return false; 
    	}
    
    </script>
</body>
</html>