<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
marquee {
	height: 30px;
}
marquee ul {list-style-type: none;}

.title a, .notice p {
	color: black;
	text-decoration: none;
}

div.title , div.notice{
	float: left;
	margin: 0px 0px 0px 600px;
	
}

div.notice {
	margin: 0 30px 0 0;
}

.fot address {
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
footer.fot {background-color:#f8f8f8;}
.fot hr{border: 1px solid gray;}
div#btn{ margin:0px 0px 0px 605px;}
div#btn a,div#btn h4{float:left; margin:0px 1px 0px 80px; }
div#btn  a{color:black;}
</style>

<footer class="fot">

	<div class="title">
		<h4><strong>공지사항
				:</strong><h4>
	</div>
	<div class="notice">
		<marquee onmouseover='this.stop()' onmouseout='this.start()'
			direction='up' scrolldelay=1500>
			<ul class="Notice_List">
				<h4><li>kh문고 시스템 점검 1/30</li></h4>
				<h4><li>개인정보처리방침 개정 </li></h4>
				<h4><li>설 연휴기간 휴무</li></h4>
				<h4><li>고객센터 하단메뉴이용</li></h4>
				<h4><li>2019년 휴무일 안내</li></h4>
			</ul>
		</marquee>
	</div>

	<br/>
	<a id="MOVE_TOP_BTN" href="#"></a>
	
	<hr/>
	<div id="btn">
	<h4><strong>바로가기→</strong></h4>
	<a href="<%=request.getContextPath()%>/notice/firstNotice"><strong>고객센터</strong></a>
	<a href="<%=request.getContextPath()%>/qna/qnaListMain"><strong>1대1문의</strong></a>
	<a href="<%=request.getContextPath()%>/absence/page"><strong>도서주문</strong></a>
	</div>
	<br/><br/>
	
	<address>
		㈜ kh문고 서울시 강남구 대표이사 : 사업자등록번호 :123-4514 <br /> 
		대표전화 : 02-858-8282(발신자부담전화)<br/> 
		 팩스 :785-41258 (지역번호공통)
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





