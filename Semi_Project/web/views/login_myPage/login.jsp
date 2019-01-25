<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.kh.member.model.vo.Member" %>    
<%
	
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
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>

<body>
<div class="container">
        <div id="logo"><a href="<%=request.getContextPath() %>/main/mainview"><b>KH BOOKS<b></b></a></div>
        <hr>
        <form method="POST" name="memberInfo" onsubmit="return fn_log();" action="<%=request.getContextPath() %>/member/loginEnd" target="_self">
			<div id="inputData"><input type="text"  id="id" name="memberId" value="<%=cookieVal !="" ? cookieVal : "" %>" placeholder="아이디"><br>
			<input type="password" id="password" name="memberPw" placeholder="비밀번호"></div>
        	<label class="keepLogin">아이디 저장 <input type="checkbox" id="checkbox" class="keepLogin" name="saveId" <%=cookieVal!=""?"checked" : ""%> ></label> 
        	<a href="<%=request.getContextPath()%>/member/searchId" class="search">아이디 찾기 </a><a class="search" href="<%=request.getContextPath()%>/member/searchPw">비밀번호 찾기</a>
         	<br> 
              <br>
          	<input type="submit" value="로그인" class="btn btn-primary"><br><br>
        </form>
            <input type="button" value="회원가입" onclick="goEnroll();" class="btn btn-default">
 	   </div>
   
<!--  <a id="kakao-login-btn"></a>
<a href="http://developers.kakao.com/logout"></a>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('23ff1500d98d0c117c03bfce6245e228');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
    	  
    	  //로그인 성공시, kakao API를 호출한다.(카카오에 있는 데이터 불러옴)
    	  Kakao.API.request({
    		  url: '/v2/user/me',
    		  success: function(res){
    			  console.log(res);
    			  console.log(res.kakao_account);
    			  console.log(JSON.stringify(res.properties.nickname));
    			  console.log(JSON.stringify(res.kakao_account.email));
    			  console.log(JSON.stringify(res.kakao_account.gender));
    			  console.log(JSON.stringify(res.kakao_account.birthday));
    			 
    			  
    		  },
    		  fail: function(error){
    			  alert(JSON.stringify(error));
    		  }
    	  });
        alert(JSON.stringify(authObj));
        
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
  //]]>
</script>   -->
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