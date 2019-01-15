<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/noticeHeader.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>고객센터 메인.</title>
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
	
.menu a{color:black;}


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

.surve-tag{
text-align:center;
}

.dropdown-toggle{
data-toggle:dropdown;
 role:button;
aria-expanded:false;
}
.row a{text-decoration:none;}
#map table{
cellpadding:0;
 cellspacing:0; width:150px;
}
#map table td{border: 1px solid #cecece;}
#map table td img{
width:180px; height:200px; border:0px;
vertical-align: top;

}

.QAtitle{
border-bottom:2px solid darkgray;

}
.col-sm-2{
margin:120px 0 0 0 ;
}
.notice1{
margin:50px 0 0 0 ;
border-bottom:2px solid darkgray;

}


.col-sm-2 h4{color:blue;}

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
		<div class="col-sm-1"></div>
			<div class="col-sm-9">

				
				<div class="notice1">
					
						
							<h2 class="Notice_Title">
								<a class="Notice_PageLink"><strong>공지사항</strong></a>
							</h2>
							<hr/>
							
                    <a href=""> kh문고 시스템 점검 안내</a>
                    <hr/>
				    <a href="">개인정보처리방침 개정 안내</a>
                    <hr/>
                    <a href="">설 연휴기간 주문 안내</a>
                    <hr/>
                    <a href="">도서 신청 안내</a>
					<hr/>
					<a href="">2019년 휴무일 안내</a>
                  
				</div>

				<br/> <br/><br/> <br/>
				<div class="QAtitle">
					
					<h2><strong>자주묻는질문</strong></h2>
					 <hr/>
                    <a href="">도서 주문후 얼마나 걸리나요?</a>
                    <hr/>
                    <a href="">방문해서 수령 해야하나요?</a>
                    <hr/>
                    <a href="">배송도 가능 한가요?</a>
					<hr/>
					<a href="">부재도서 신청은 어떻게 하나요?</a>
                    <hr/>
                    <a href="">방문결제도 가능한가요?</a>
                    

				</div>
				<br> <br> <br>
				<div id="QAtitle2">
					<h2><strong>고객센터 안내사항</strong></h2>
					<hr>
					<a href="" >고객센터 단축운영 공지사항</a>
					<hr>
					<a href="" >고객센터 운영시간 평일 10:00~18:00</a>

				</div>
				<br> <br> <br> <br>
			</div>

			<div class="row">

				<div class="col-sm-12">
				<br/> <br /> <br>
				<div class="surve-tag">
				
				</div>
				</div>
			</div>
		
</body>

</html>



<%@include file="/views/common/footer.jsp"%>