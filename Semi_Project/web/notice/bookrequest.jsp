<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%= request.getContextPath()%>/css/Notice.css">


<body>
	<div class="container">
		<div class="row header">
			<div class="col-sm-11"></div>
		</div>
		<div class="sidemenu">
			<div class="col-sm-2">
				<h2 id>고객센터</h2>
				<hr>

				<ol id="a">
					<strong>게시판</strong>
					<br>
					<br>
					<A href="http://www.naver.com" style="text-decoration: none"
						target="_blank">
						<li>자유게시판</li>
					</A>
					<a href="" style="text-decoration: none">
						<li>1:1문의 게시판</li>
					</a>

				</ol>

				<hr>
				<a href="" id="a1" style="text-decoration: none"><strong>도서신청</strong></a>
				<hr>

				<a href="file:///D:/vscode/vscode/workspace/project/mainNotice.html"
					id="a2" style="text-decoration: none"><strong>공지사항</strong></a>
				<hr>
				<div class="surve-tag">
					<address>
						㈜ **문고 서울시 종로구 종로 1 <br> 대표이사 : <br /> 사업자등록번호 :123-4514<br />
						대표전화 : 222222222(발신자 부담전화)<br> 팩스 : 222222-222 (지역번호공통)<br />

					</address>
				</div>


			</div>
			<div class="col-sm-9">
				<h2>도서 신청 하기 ~</h2>


			</div>

			<div class="row footer">
				<div class="col-sm-11">



				</div>
			</div>



		</div>
</body>

					<%@include file="/views/common/footer.jsp"%>
