<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
marquee {
	height: 20px;
}

.title a { 
	color: black;
	text-decoration: none;
}

div.title, div.notice {
	float: left;
}

div.notice {
	margin: 0 100px 0 0;
}
address{
text-align:center;}
.Notice_List{
color: black;}

</style>

<footer>
	<section>
		<div class="title">
			<a href="<%=request.getContextPath()%>/notice/firstNotice">
				<strong>공지사항 :</strong></a>
		</div>
		<div class="notice">
			<marquee onmouseover='this.stop()' onmouseout='this.start()'
				direction='up' scrolldelay=1500>
				<ul class="Notice_List">
					<li ><a href="/support/notice/711">kh문고 시스템 점검 안내</a></li>
					<li ><a href="/support/notice/711">개인정보처리방침 개정 안내</a></li>
					<li ><a href="/support/notice/711">설 연휴기간 주문 안내</a></li>
					<li ><a href="/support/notice/711">도서 신청 안내</a></li>
					<li ><a href="/support/notice/711">2019년 휴무일 안내</a></li>
				</ul>
			</marquee>

		</div>
	</section>
	<p>
		&lt;CopyRight 2018. <strong>KH정보교육원</strong>. All rights reserved.&gt;
	</p>
<address>
	㈜ **문고 서울시 종로구 종로 1 대표이사 : 사업자등록번호 :123-4514 <br /> 대표전화 :
	222222222(발신자 부담전화)<br> 팩스 : 222222-222 (지역번호공통)<br />
</address>
</footer>
</body>
</html>