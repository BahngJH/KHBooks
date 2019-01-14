<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>도서신청</title>
<link
	href="https://fonts.googleapis.com/css?family=Black+And+White+Picture"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
.col-sm-2 ol,.col-sm-2 ol a {
	color: black;
}

.menu a{
color:black;

}

.col-sm-9 text {
	text-align: center;
}

a{color:black; cursor:pointer;}

ol{
	list-style-type: disc;
	color: black;
}


#a1 {
	list-style-type: disc;
	color: black;
}

#a2 {
	list-style-type: disc;
	color: black;
}

.QAtitle, .QAtitle a {
	color: black;
}

#QAtitle2 a {
	color: black;
	height: 200px;
}

.notice a {
	color: black;
}


.text {
	text-align: center;
	width: 300px;
	padding-left: 100px;
}

#n-surve {
	background-color: antiquewhite;
}

.surve-tag {
	background-color: azure;
	border: 1px solid azure
}
 .menu a{cursor:pointer;}
    .menu .hide{display:none;}
.Notice_List{color:black;}

</style>
</head>

<script>


$(document).ready(function(){
   
    $("a").click(function(){
      
        $(this).next("ol").toggleClass("hide");
    });
});
</script>


<body>

	<div class="container">
		<div class="row header">
			<div class="col-sm-12"></div>
		</div>

		<br /> <br /> <br />
		<div class="col-sm-1"></div>
		
		<div class="row">
			<div class="col-sm-2">
			<br/>
			<br/>
			<br/>
				<h4>
					<strong>고객센터</strong>
				</h4>
				<hr>

		
        
    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"style="text-decoration:none" aria-expanded="false"><strong>공지사항</strong><span class="caret"></span></a>
            <ol class="hide">
            <br/>
             <li><a href="http://www.naver.com" style="text-decoration:none">자유게시판</a></li><br/>
             <li><a href="http://www.naver.com" style="text-decoration:none">1:1문의게시판</a></li><br/>
            </ol>

         
        
        
    
				<hr>
				<a 	href="file:///D:/vscode/vscode/workspace/project/bookrequest.html"
					id="a1" style="text-decoration: none"><strong>도서신청</strong></a>
				<hr>

				<a href="file:///D:/vscode/vscode/workspace/project/mainNotice.html"
					id="a2" style="text-decoration: none"><strong>공지사항</strong></a>
					  
				<br/>
				<br/>
				<br>
				<div class="surve-tag">
					<address>
						㈜ **문고 서울시 종로구 종로 1 <br> 대표이사 : <br /> 사업자등록번호 :123-4514<br />
						대표전화 : 222222222(발신자 부담전화)<br> 팩스 : 222222-222 (지역번호공통)<br />

					</address>
				</div>



			</div>
		<div class="col-sm-1"></div>
			<div class="col-sm-8">
			
			<h3>도서신천</h3>

				
			
				
			</div>

			<div class="row">
				<div class="col-sm-12"></div>
			</div>
		</div>
</body>

</html>



<%@include file="/views/common/footer.jsp"%>