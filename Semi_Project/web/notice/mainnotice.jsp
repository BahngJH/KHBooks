<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/notice.css"/>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="js/jquery-3.3.1.js"></script>


	
<body>

	<div class="container">
		<div class="row header">
			<div class="col-xs-12">
				

			</div>
		</div>


		<div class="sidemenu">
			<div class="nav col-lg-2">
				<h2 id>고객센터</h2>
				<hr>

				<ol id="a">
					<strong>게시판</strong>
					<br>
					<br>
					<a href="http://www.naver.com" style="text-decoration: none"
						target="_blank"><li>자유게시판</li></a>
					<a href="" style="text-decoration: none">
						<li>1:1문의 게시판</li>
					</a>

				</ol>

				<hr>
				<a href="" id="a1" style="text-decoration: none"><strong>도서신청</strong></a>
				<hr>

				<a href="" id="a2" style="text-decoration: none"><strong>공지사항</strong></a>
				<hr>

				<div class="surve-tag">
					<address>
						㈜ **문고 서울시 종로구 종로 1 <br> 대표이사 : <br /> 사업자등록번호 :123-4514<br />
						대표전화 : 222222222(발신자 부담전화)<br> 팩스 : 222222-222 (지역번호공통)<br />

					</address>
				</div>



			</div>
			<div class="article col-lg-9">

				<br> <br>
				<div id="notice">
					<section id="books_notice" class="Footer_Notice">
						<article class="Notice">
							<h3 class="Notice_Title">
								<a class="Notice_PageLink" href="/support/notice"> 공지사항 <span
									class="icon-arrow_1_right Notice_PageLink_ArrowIcon"></span>
								</a>
							</h3>
							<hr>
							<div>

								<p class="default">
									<b>등록일</b>
								</p>
								<p class="title">
									<b><strong>제목</b></strong>
								</p>

							</div>
							<section>
								<br>
								<hr>
								<div class="notice1">
									<p id="d1">2018.33.33</p>
									<p id="n1">
										<b>dkjdkdkdkdkdk</b>
									</p>
								</div>
							</section>
							<div class="article col-lg-1">

								<ul class="pager">
									<li><a href="#">Previous</a></li>
									<li><a href="#">Next</a></li>
								</ul>
							</div>
				</div>
			</div>
		</div>
		<br> 
	</div>
	

</body>

						<%@include file="/views/common/footer.jsp"%>