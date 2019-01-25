<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  

<style>

marquee {
	height: 30px;
	width:300px;
}


marquee ul {
	list-style-type: none;
}

.title h4, .notice h4 {

	color: black;
	text-align:center;
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


footer.fot, div#btn a {
	background-color: #f8f8f8;
	
}

.fot hr {
	border: 1px solid gray;
	margin-top:8px;
}

div#btn a, {
	color: black;
	
	text-align: center;
	
}


div.notice-scroll{
	text-align: center;
}

footer.fot{
text-align:center;
}
footer.fot a{color:black;}

div.mark{background-color:#f8f8f8; margin-bottom:0%; margin-top:-2%;}
div#btn{
	margin-left: 35.3%;margin-right:30%;	
}
footer.fot div.notice{margin-left:-5%;margin-right: 30%;}
footer.fot div.title{margin-left: 20%}
div.col-xs-1 col-sm-1 col-md-1 h4 span{margin-bottom:20px;}

</style>

<footer class="fot container-fluid">
	<div class="row">
		<div class="row notice-scroll">
			<div class="title col-xs-3 col-md-offset-4 col-md-2">
				<h4 >
					<strong>공지사항:</strong>
				</h4>
			</div> 
			<div class="notice  col-xs-3 col-md-offset-4 col-md-2">
			
				<marquee onmouseover='this.stop()' onmouseout='this.start()'
					direction='up' scrolldelay=1500>
					<ul class="Notice_List">
						<a>
							<li>kh문고 시스템 점검 1/30</li>
						</a>
						<br/>
						<a>
							<li>개인정보처리방침 개정</li>
						</a>
						<br/>
						<a>
							<li>설 연휴기간 휴무</li>
						</a>
						<br/>
						<a>
							<li>고객센터 하단메뉴이용</li>
						</a>
						<br/>
						<a>
							<li>2019년 휴무일 안내</li>
						</a>
					</ul>
				</marquee>
			</div>
		</div>
		<hr />
		
	
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




