<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
marquee {
	height: 20px;
}

.title a, .notice p {
	color: black;
	text-decoration: none;
}

div.title , div.notice {
	float: left;
	margin: 0px 0px 0px 550px;
	
}

div.notice {
	margin: 0 30px 0 0;
}

address {
	text-align: center;
}

.Notice_List {
	color: black;
}

a#MOVE_TOP_BTN {
	position: fixed;
	right: 2%;
	bottom: 30px;
	display: none;
	z-index: 999;
}


#MOVE_TOP_BTN {
	height: 33px;
	width: 33px;
	background-image:
		url('<%=request.getContextPath()%>/images/icons/top.png');
}
footer.fot {background-color:#E8D9FF;}
.fot hr{border: 1px solid gray;}
div#btn{ margin:0px 0px 0px 500px;}
div#btn a{float:left; margin:0px 10px 0px 120px; }
div#btn  a{color:black;}
</style>

<footer class="fot">

	<div class="title">
		<a><strong>공지사항
				:</strong><a>
	</div>
	<div class="notice">
		<marquee onmouseover='this.stop()' onmouseout='this.start()'
			direction='up' scrolldelay=1500>
			<ul class="Notice_List">
				<p><li>kh문고 시스템 점검 안내</li></p>
				<p><li>개인정보처리방침 개정 안내</li></p>
				<p><li>설 연휴기간 주문 안내</li></p>
				<p><li>도서 신청 안내</li></p>
				<p><li>2019년 휴무일 안내</li></p>
			</ul>
		</marquee>
	</div>
	
	<a id="MOVE_TOP_BTN" href="#"></a>
	<p>
		&lt;CopyRight 2018. <strong>KH정보교육원</strong>. All rights reserved.&gt;
	</p>
	<hr/>
	<div id="btn">

	<a href="<%=request.getContextPath()%>/notice/firstNotice">고객센터</a>
	<a href="<%=request.getContextPath()%>/qna/qnaListMain">1대1문의</a>
	<a href="<%=request.getContextPath()%>/absence/page">도서주문</a>
	</div>
	<br/><br/>
	
	<address>
		㈜ kh문고 서울시 강남구 대표이사 : 사업자등록번호 :123-4514 <br /> 
		대표전화 : 02-858-8282(발신자부담전화)<br/> 
		 팩스 :785-41258 (지역번호공통)<br />
	</address>



</footer>
<!-- top버튼 -->
<script>
	$(function() {
	    $(window).scroll(function() {
	        if ($(this).scrollTop() > 500) {
	            $('#MOVE_TOP_BTN').fadeIn();
	        } else {
	            $('#MOVE_TOP_BTN').fadeOut();
	        }
	    });
	    
	    $("#MOVE_TOP_BTN").click(function() {
	        $('html, body').animate({
	            scrollTop : 0
	        }, 400);
	        return false;
	    });
	});
	</script>





