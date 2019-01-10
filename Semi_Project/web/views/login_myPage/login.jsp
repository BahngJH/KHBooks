<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
	Cookie[] c = request.getCookies();
	String cookieVal="";
	if(c!=null){
		for(Cookie i:c){
			if(i.getName().equals("saveId")){
				cookieVal=i.getValue();
			}
		}
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="content-script-type" content="text/javascript">
<title>로그인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
 div{
            text-align: center;
        }
        #login{
            position: relative;
            top: 50px;
        }
        a{
            text-decoration: none;
            color: pink;
        }
        #checkdiv{
            width:305px; height:40px;
            text-align: center;
        }
        .search{
            position: relative;
            left: 30px;
        }
        #keepLogin {
            position: relative;
           right: 10px;
        }
        #logo{
            font-size: 200%;
        }
        span{
        	color:red;
        }
</style>
</head>

<body>
<div class="container">


        <div id="logo"><a href="#">KH BOOKS</a></div>
        <hr>
        <form method="POST" name="memberInfo" onsubmit="return fn_log();" action="<%=request.getContextPath() %>/member/login" target="_self">
			<input type="text" id="id" name="id" value="<%=cookieVal !="" ? cookieVal : "" %>" placeholder="아이디" style="width:305px; height:40px;"><br>
			<input type="password" id="password" name="password" placeholder="비밀번호" style="width:305px; height:40px;"><br>
        	<input type="checkbox" id="checkbox" class="keepLogin" name="saveId" <%=cookieVal!=""?"checked" : ""%> ><label class="keepLogin">아이디 저장
        	</label> <a href="searchId.html" class="search">아이디 찾기 </a><a class="search" href="#">비밀번호 찾기</a>
         	<br> <%-- 일단 주석처리 <span>
            		<%if(msg!=null){ %>
            <%=msg %>
            <%msg=null;} %>
             </span> --%> <br>
          	<input type="submit" value="로그인" class="btn btn-primary" style="width:305px; height:50px;"><br><br>
        </form>
            <input type="button" value="회원가입" onclick="goEnroll();" class="btn btn-default" style="width:305px; height:50px;">
 	   </div>
    <script>
    	function goEnroll(){
    		location.href="<%=request.getContextPath()%>/member/enroll";
    	}
    
    	function fn_log(){

    		var id = $('#id').val().trim().length;
    		var pw = $('#password').val().trim().length;   		
    		
    		if(id==0 || pw==0)
    		{
    			alert("아이디와 비밀번호를 입력해주세요");

    			return false;
    		}
    		return true; 
    	}
    
    </script>
</body>

</html>