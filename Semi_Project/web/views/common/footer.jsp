<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>

marquee {
	height: 30px;
	width:300px;
}
div.notice,div.title{}

marquee ul {
	list-style-type: none;
}

.title h4, .notice h4 {

	color: black;
	text-align:center;
}



/*  div.title, div.notice {
	float: left;
	margin: 0px 0px 0px 400px;
}  */

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

footer{
	margin-top:0px;
}

footer.fot, div#btn a {
	background-color: #f8f8f8;
	
}

.fot hr {
	border: 1px solid gray;
	padding:0px;
}

div#btn a, div#btn h4 {
	color: black;
	
	text-align: center;
	
}


div.notice-scroll{
	text-align: center;
}

footer.fot{
text-align:center;
}


div#btn{
	margin-left: 35.3%;margin-right:30%;	
}
footer.fot div.notice{margin-left:-10%;margin-right: 30%;}
footer.fot div.title{margin-left: 20%}
div.col-xs-1 col-sm-1 col-md-1 h4 span{margin-bottom:20px;}

</style>

<footer class="fot container-fluid">
	<div class="row">
		<div class="row notice-scroll">
			<div class="title col-xs-3 col-md-offset-4 col-md-2">
				<h4 style="vertical-align: middle;">
					<strong>공지사항:</strong>
				</h4>
			</div> 
			<div class="notice  col-xs-3 col-md-offset-4 col-md-2">
			
				<marquee onmouseover='this.stop()' onmouseout='this.start()'
					direction='up' scrolldelay=1500>
					<ul class="Notice_List">
						<h4>
							<li>kh문고 시스템 점검 1/30</li>
						</h4>
						<h4>
							<li>개인정보처리방침 개정</li>
						</h4>
						<h4>
							<li>설 연휴기간 휴무</li>
						</h4>
						<h4>
							<li>고객센터 하단메뉴이용</li>
						</h4>
						<h4>
							<li>2019년 휴무일 안내</li>
						</h4>
					</ul>
				</marquee>
			</div>
		</div>
		<hr />
		
		<div id="btn" class="row">
			<div class='col-xs-1 col-sm-1 col-md-1'>
				<h4>
					<strong><span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span></strong>
				</h4>
			</div>

			<div class="col-xs-3 col-sm-3 col-md-3">
				<a href="<%=request.getContextPath()%>/notice/firstNotice"><strong>고객센터</strong></a>
			</div>
			<div class="col-xs-3 col-sm-3 col-md-3">
				<a href="<%=request.getContextPath()%>/qna/qnaListMain"><strong>1대1문의</strong></a>
			</div>
			<div class="col-xs-3 col-sm-3 col-md-3">
				<a href="<%=request.getContextPath()%>/absence/page"><strong>도서주문</strong></a>
			</div>
		</div>

		
		<address>
			㈜ kh문고 서울시 강남구 대표이사 : 사업자등록번호 :123-4514 <br /> 대표전화 :
			02-858-8282(발신자부담전화)<br /> 팩스 :785-41258 (지역번호공통)
		</address>
		<a id="MOVE_TOP_BTN" href="#"></a>
		
	</div>
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





