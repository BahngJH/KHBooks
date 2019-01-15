<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset=UTF-8 " />
<title>Insert title here</title>
<style>
.col-sm-2 {
	margin: 120px 0 0 0;
}

.col-sm-2 hr {
	border: solid 1px darkgray;
}

.col-sm-2 span {
	color: black;
}

.col-sm-2 h4 {
	color: black;
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
</style>
</head>

<body>
	<div class="container">
		<div class="row header"></div>



		<div class="col-sm-2">

			<h4>
				<span class="glyphicon glyphicon-phone-alt" aria-hidden="true">
					<strong>고객센터</strong>
				</span>
			</h4>

			<hr>

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

			<a href="<%=request.getContextPath()%>/notice/noticemain" id="a2"><strong>공지사항</strong></a>
			<hr />

			<br /> <br /> <br /> <br />
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
		
</body>
</html>