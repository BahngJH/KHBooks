<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.*,com.kh.notice.model.vo.Notice" %>
	
	<%
		List<Notice> list=(List)request.getAttribute("list");
	%>

<%@ include file="/views/common/header.jsp"%>
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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3. /css/bootstrap.min.css">

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
.col-sm-2 ol, .col-sm-2 ol a {
	color: black;
}

.menu a {
	color: black;
}

a {
	color: black;
	cursor: pointer;
}

ol {
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




.surve-tag {
	background-color: azure;
	border: 1px solid azure
}

.menu a {
	cursor: pointer;
}

.menu .hide {
	display: none;
}



.surve-tag {
	text-align: center;
}

.dropdown-toggle {
	data-toggle: dropdown;
	role: button;
	aria-expanded: false;
}

.row a {
	text-decoration: none;
}

#map table {
	cellpadding: 0;
	cellspacing: 0;
	width: 150px;
}

#map table td {
	border: 1px solid #cecece;
}

#map table td img {
	width: 180px;
	height: 200px;
	border: 0px;
	vertical-align: top;
}

.col-sm-2 h4 {
	color: blue;
}
.col-sm-9 table{

cellspacing:0;
 cellpadding:0;
 border:0px;
 }
table th{

 border-bottom:1px solid skyblue;
margin: 5px 0;
padding: 8px 10px;
border-width: 2px;
border-height: 10px;
 text-align:center;

 }

 .col-sm-9 td{
 text-align:center;
 }

hr {
border: solid 1px darkgray;
}
</style>
</head>

<script>
	$(document).ready(function() {

		$("a").click(function() {

			$(this).next("ol").toggleClass("hide");
		});
	});
</script>


<body>

	<div class="container">
		<div class="row header">
			<div class="col-sm-12"></div>
		</div>




		<div class="row">
			<div class="col-sm-2">
				<br /> <br /> <br />
				<h4>
					<strong>고객센터</strong>
				</h4>
				
					<hr/>
				<a class="dropdown-toggle"><strong>게시판</strong><span
					class="caret"></span></a>
				<ol class="hide">
					<br />
					<li><a href="http://www.naver.com">1:1문의</a></li>
					<br />
					<li><a href="http://www.naver.com">희망도서 신청</a></li>
					<br />
				</ol>

				<hr>
				<a href="" id="a1"><strong>도서신청</strong></a>
				<hr>

				<a href="" id="a2"><strong>공지사항</strong></a> 
				<hr/>
				<br/>
				<br />
				<div id="map">
					<table>
						<tr>
							<td><a
								href="https://map.naver.com/?__pinOnly=false&query=&searchCoord=&menu=location&tab=1&lng=a24cfea0fc4db7f9f4e3b955eadc8593&__fromRestorer=true&mapMode=0&mpx=af51abfe49113423a260cedd1e8f63f9b1619d19c679be4b3d3fe32d5adfb54341116eb5a386f56e955a59b6cb2517aa&pinId=11525091&pinType=site&lat=9d1007022b17059c3db21b29a1ecce8a&dlevel=11&enc=b64"
								target="_blank"> <img
									src="http://prt.map.naver.com/mashupmap/print?key=p1547133542722_-789146433" /></a>
							</td>
						</tr>

					</table>
				</div>

			</div>
			<br />
			<div class="col-sm-1"></div>
			<div class="col-sm-9">
				
				<h2>공지사항</h2>
				<br/>
				<table class="table table-hover">
					<colgroup>
						<col width="86px" />
						<col width="*" />
						<col width="126px" />
					</colgroup>

					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>날짜</th>
					</tr>
					
				
					<%for(Notice n : list){ %>
					<% if(n.getStatus().equals("Y")){ %>
					<tr>
						<td><%=n.getNoticeNo() %></td>
						<td><a><%=n.getNoticeTitle()%></a></td>
						<td><%=n.getNoticeDate()%></td>
					
					</tr> 
					<%} 
					}%>					
				</table>

			</div>
			<div class="row">

					<div class="col-sm-12">
						<br /> <br /> <br>
						<div class="surve-tag">
							<address>
								㈜ **문고 서울시 종로구 종로 1 대표이사 : 사업자등록번호 :123-4514 <br /> 대표전화 :
								222222222(발신자 부담전화)<br> 팩스 : 222222-222 (지역번호공통)<br />

							</address>
						</div>
					</div>
				</div>
				</div>
			
</body>

</html>



<%@include file="/views/common/footer.jsp"%>