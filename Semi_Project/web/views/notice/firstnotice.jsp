<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>

.col-sm-2 ol,.col-sm-2 ol a {
	color: black;
}
.col-sm-2{
padding: 0 0 100 0;}
	
.menu a{
color:black;

}


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

	<div class="container">
		<div class="row header">
			<div class="col-sm-12"></div>
		</div>


		
		
		<div class="row">
			<div class="col-sm-2">
			<br/>
			<br/>
			<br/>
				<h4>
					<strong>고객센터</strong>
				</h4>
				<hr>
    
    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"style="te xt-decoration:none" aria-expanded="false"><strong>게시판</strong><span class="caret"></span></a>
            <ol class="hide">
            <br/>
             <li><a href="http://www.naver.com" style="text-decoration:none">1:1문의</a></li><br/>
              <li><a href="http://www.naver.com" style="text-decoration:none">희망도서 신청</a></li><br/>
            </ol>

         
        
        
    
					<hr>
				<a
					href="file:///D:/vscode/vscode/workspace/project/bookrequest.html"
					id="a1" style="text-decoration: none"><strong>도서신청</strong></a>
				<hr>

				<a href="file:///D:/vscode/vscode/workspace/project/mainNotice.html"
					id="a2" style="text-decoration: none"><strong>공지사항</strong></a>
					  
				<br/> <br /> <br>
				<div class="surve-tag">
					<address>
						㈜ **문고 서울시 종로구 종로 1 <br> 대표이사 : <br /> 사업자등록번호 :123-4514<br />
						대표전화 : 222222222(발신자 부담전화)<br> 팩스 : 222222-222 (지역번호공통)<br />

					</address>
				</div>
					<br/>
					<div id="map">
						<table cellpadding="0" cellspacing="0" width="150">
							<tr>
								<td style="border: 1px solid #cecece;"><a
									href="https://map.naver.com/?__pinOnly=false&query=&searchCoord=&menu=location&tab=1&lng=a24cfea0fc4db7f9f4e3b955eadc8593&__fromRestorer=true&mapMode=0&mpx=af51abfe49113423a260cedd1e8f63f9b1619d19c679be4b3d3fe32d5adfb54341116eb5a386f56e955a59b6cb2517aa&pinId=11525091&pinType=site&lat=9d1007022b17059c3db21b29a1ecce8a&dlevel=11&enc=b64"
									target="_blank">
										<img src="http://prt.map.naver.com/mashupmap/print?key=p1547133542722_-789146433"
										width="180" height="180" border="0"
										style="vertical-align: top;" /></a></td>
							</tr>

						</table>
					</div>

			</div>
			<br/>
		<div class="col-sm-1"></div>
			<div class="col-sm-9">

				
				<div class="notice">
					<section id="books_notice" class="Footer_Notice">
						<article class="Notice">
							<h2 class="Notice_Title">
								<a class="Notice_PageLink" href="/support/notice"> 공지사항 <span
									class="icon-arrow_1_right Notice_PageLink_ArrowIcon"></span>
								</a>
							</h2>
							  <marquee direction=up height="20px" scrollamount='1'onmouseover=this.stop() onmouseout=this.start()>
                                <ul class="Notice_List">
                                    <li class="Notice_Item jsNoticeItem">
                                        <a class="Notice_Item_DetailLink" href="/support/notice/711">[안내] 고객센터 단축운영
                                            공지사항</a>
                                    </li>
                                    <li class="Notice_Item jsNoticeItem">
                                        <a class="Notice_Item_DetailLink" href="/support/notice/779">[업데이트] iOS 앱
                                            v8.11.0</a>
                                    </li>
                                    <li class="Notice_Item jsNoticeItem">
                                        <a class="Notice_Item_DetailLink" href="/support/notice/773">[리디셀렉트] 안드로이드 앱
                                            내에서 셀렉트 사용 가능</a>
                                    </li>
                                    <li class="Notice_Item jsNoticeItem">
                                        <a class="Notice_Item_DetailLink" href="/support/notice/772">[업데이트] 안드로이드 앱
                                            v9.0.0</a>
                                    </li>
                                    <li class="Notice_Item jsNoticeItem">
                                        <a class="Notice_Item_DetailLink" href="/support/notice/768">[리디셀렉트] 마이 셀렉트 도서
                                            수 제한 해제</a>
                                    </li>
                                    <li class="Notice_Item jsNoticeItem">
                                        <a class="Notice_Item_DetailLink" href="/support/notice/767">[업데이트] PC/Mac 뷰어
                                            v2.5.5</a>
                                    </li>
                                    <li class="Notice_Item jsNoticeItem">
                                        <a class="Notice_Item_DetailLink" href="/support/notice/754">[안내] 도서구입비 소득공제
                                            적용일정 안내</a>
                                    </li>

                                </ul>
                            </marquee>
						</article>
					</section>
				</div>
				<br> <br>
				<div class="QAtitle">
					<h3>자주묻는질문</h3>
					<hr>
					<a href="">도서 주문후 얼마나 걸리나요?</a>
					<hr>
					<a href="">방문해서 수령 해야하나요?</a>
					<hr>
					<a href="">배송도 가능 한가요?</a>

				</div>
				<br> <br> <br>
				<div id="QAtitle2">
					<h3>고객센터 안내사항</h3>
					<hr>
					<a href="" style="text-decoration: none">고객센터 단축운영 공지사항</a>
					<hr>
					<a href="" style="text-decoration: none">고객센터 운영시간 평일 10:00
						~18:00</a>

				</div>
				<br> <br> <br> <br>
			</div>

			<div class="row">

				<div class="col-sm-12"></div>
			</div>
		</div>
</body>

</html>



<%@include file="/views/common/footer.jsp"%>