<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH BOOKS</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
           	color:pink;
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
        #logo {
        
            font-size: 200%;
        }
        span{
        	color:red;
        }
</style>
</head>
<body>
	
	<div class="container">
        <div id="logo"><a href="<%=request.getContextPath() %>/main/mainview"><b>KH BOOKS<b></b></a></div>
        <hr>
        <h3>거래가 실패되었습니다.</h3>
        <h3>저희 KH BOOKS를 이용해서 주셔서 감사합니다.</h3>
        <button type="button" class="btn btn-primary" onclick="goMain();">메인 화면가기</button>
            
 	   </div>
	<script>
		function goMain(){
			location.href="<%=request.getContextPath()%>";
		}
	</script>

</body>
</html>