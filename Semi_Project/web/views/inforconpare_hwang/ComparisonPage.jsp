<%@ page language='java' contentType='text/html; charset=UTF-8'
import='java.util.*,
java.sql.*,
java.text.*,
com.kh.book.model.vo.Book, 
com.kh.review.model.vo.Review,
com.kh.member.model.vo.Member,
com.kh.author.model.vo.Author'
	pageEncoding='UTF-8'%>
    <%List<Book> bookList=(List<Book>)request.getAttribute("bookList"); %>
<meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'>
<%@ include file="/views/common/header.jsp"%>

<style type="text/css">
#wrap {width:100%; padding:0;}
#header {width:950px; margin:0 auto;}
#header #wing_ad {display:none;}
#container{width:100%;}
.w950 {width:600px; margin:0 auto;}
.book_choice_wrap{width:100%; background-color: white; padding:30px 0;z-index:999;}
.book_choice{display:block;float:left;width:127px;margin:80px 30px 80px 25px;}
.book_choice2{display: inline-block;width: 127px; text-align: center;margin:0 30px;}
.book_choice2>.btn_blue2{padding:6px 15px 1px 14px;margin-top:3px;}
.book_img{position: relative;border:solid 1px #d3d1c1;margin-bottom:10px;}
.book_img>img{}
.book_choice>a{}
.btn_del_book{position: absolute;right:0;top:0; width:27px;height:27px; color:transparent; background: url('<%=request.getContextPath()%>/images/icons/btn_del_book.gif') 0 0 no-repeat; border: 0;}
.books_spec{width:950px; margin:0 auto; margin-bottom:60px;}
.books_spec>table>tbody{text-align:left;vertical-align: top;}
.compare_list th {background-color:#fbfbfb;}
.tr_color, .tr_color>th{background-color:#fff9fb;}
.border_color>th, .border_color>td{border-bottom-color: #a2a3a7; border-top-color: #a2a3a7;}
.books_spec{margin-top: 30px;}
.compare_list{ border-collapse: collapse; border-spacing: 0;border:1px solid #cbcbcb; width: 950px;box-sizing:content-box;font-weight: bold;}
.compare_list th, .compare_list td{color: #39322c; padding:19px 28px; border:1px solid #cbcbcb;}
.spec_price {font-weight:normal;}
.spec_price>span{display:inline-block;vertical-align:top;}
.spec_price .cost{display: block; text-decoration:line-through;}
.spec_price .price {color: #fe0000;font-weight:bold;}
.spec_price span.discount {color: #1186e4;font-weight:bold;}
.result_books_sort {width:100%; padding:30px 0; border-bottom:1px solid #d7d7d7; color:#3a302e; font-weight:bold;}
.compare_list em,
.result_books_rank {width:950px; margin:0 auto;}
.result_books_rank em {font-style:normal;}
.result_books_rank .list_type01 .cover {/*position:absolute;left:146px;top:19px;z-index:10;*/padding:0;}
.result_books_rank .list_type01 .cover a {display:block;width:98px;height:146px;padding-top:4px;background:#fff url('http://image.kyobobook.co.kr/ink/images/welcome/todaybook_bg4.png') 0 0 no-repeat; background-size:98px auto;}
.result_books_rank .list_type01 .cover a img {width:96px;height:144px;border:1px solid #999;}
.result_books_rank .list_type01 .cover a .rank {left:0; width:38px; height:50px; color:transparent;}
.result_books_rank .list_type01 .cover a:hover .rank {/*transform:translate(0,0);*/}
.result_books_rank .list_type01 .detail {width:430px; padding-right:35px; padding-top:19px;border:none;}
.result_books_rank .list_type01 .detail02 {float:left;width:170px;padding-top:5%;padding-right:15px;}
.result_books_rank .list_type01 .book_add {border-left: 1px solid #dadada; padding:19px 0 19px 19px;}
.btn_reset, .btn_compare{display: block;height:43px;width:140px; background-image: url('<%=request.getContextPath()%>/images/buttons/sp_btns.png'); background-repeat: no-repeat;  text-indent: -9999px;}
.btn_reset {background-position: 0 0; margin-bottom:11px;}
.btn_compare{background-position: 0 -54px;}
.compare_list td a {color: #39322c; text-decoration: underline;}
.compare_list td a:hover {color: #1275c8;}
.book_choice .auto_guide {position: relative; display: block; width: 182px; margin-top: 18px; line-height: 18px; letter-spacing: -1px;}
.jangba {
	-moz-box-shadow:inset 0px 0px 0px 2px #aac9e6;
	-webkit-box-shadow:inset 0px 0px 0px 2px #aac9e6;
	box-shadow:inset 0px 0px 0px 2px #aac9e6;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #79bbff), color-stop(1, #378de5) );
	background:-moz-linear-gradient( center top, #79bbff 5%, #378de5 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#79bbff', endColorstr='#378de5');
	background-color:#79bbff;
	-webkit-border-top-left-radius:7px;
	-moz-border-radius-topleft:7px;
	border-top-left-radius:7px;
	-webkit-border-top-right-radius:7px;
	-moz-border-radius-topright:7px;
	border-top-right-radius:7px;
	-webkit-border-bottom-right-radius:7px;
	-moz-border-radius-bottomright:7px;
	border-bottom-right-radius:7px;
	-webkit-border-bottom-left-radius:7px;
	-moz-border-radius-bottomleft:7px;
	border-bottom-left-radius:7px;
	text-indent:0px;
	border:1px solid #ffffff;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:12px;
	font-weight:bold;
	font-style:normal;
	height:23px;
	line-height:23px;
	width:110px;
	text-decoration:none;
	text-align:center;
	text-shadow:0px 1px 0px #1d5d9c;
}
.jangba:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #378de5), color-stop(1, #79bbff) );
	background:-moz-linear-gradient( center top, #378de5 5%, #79bbff 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#378de5', endColorstr='#79bbff');
	background-color:#378de5;
}.jangba:active {
	position:relative;
	top:1px;
}
.nowbuy {
	margin-top:3px;
	-moz-box-shadow:inset 0px 0px 0px 2px #aac9e6;
	-webkit-box-shadow:inset 0px 0px 0px 2px #aac9e6;
	box-shadow:inset 0px 0px 0px 2px #aac9e6;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #79bbff), color-stop(1, #378de5) );
	background:-moz-linear-gradient( center top, #79bbff 5%, #378de5 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#79bbff', endColorstr='#378de5');
	background-color:#79bbff;
	-webkit-border-top-left-radius:7px;
	-moz-border-radius-topleft:7px;
	border-top-left-radius:7px;
	-webkit-border-top-right-radius:7px;
	-moz-border-radius-topright:7px;
	border-top-right-radius:7px;
	-webkit-border-bottom-right-radius:7px;
	-moz-border-radius-bottomright:7px;
	border-bottom-right-radius:7px;
	-webkit-border-bottom-left-radius:7px;
	-moz-border-radius-bottomleft:7px;
	border-bottom-left-radius:7px;
	text-indent:0px;
	border:1px solid #ffffff;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:12px;
	font-weight:bold;
	font-style:normal;
	height:23px;
	line-height:23px;
	width:110px;
	text-decoration:none;
	text-align:center;
	text-shadow:0px 1px 0px #1d5d9c;
}
.nowbuy:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #378de5), color-stop(1, #79bbff) );
	background:-moz-linear-gradient( center top, #378de5 5%, #79bbff 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#378de5', endColorstr='#79bbff');
	background-color:#378de5;
}.nowbuy:active {
	position:relative;
	top:1px;
}
.Book1 {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9) );
	background:-moz-linear-gradient( center top, #f9f9f9 5%, #e9e9e9 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9');
	background-color:#f9f9f9;
	-webkit-border-top-left-radius:20px;
	-moz-border-radius-topleft:20px;
	border-top-left-radius:20px;
	-webkit-border-top-right-radius:20px;
	-moz-border-radius-topright:20px;
	border-top-right-radius:20px;
	-webkit-border-bottom-right-radius:20px;
	-moz-border-radius-bottomright:20px;
	border-bottom-right-radius:20px;
	-webkit-border-bottom-left-radius:20px;
	-moz-border-radius-bottomleft:20px;
	border-bottom-left-radius:20px;
	text-indent:0;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#666666;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:34px;
	line-height:34px;
	width:72px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #ffffff;
	margin-bottom:6px;
}
.Book1:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9) );
	background:-moz-linear-gradient( center top, #e9e9e9 5%, #f9f9f9 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9');
	background-color:#e9e9e9;
}.Book1:active {
	position:relative;
	top:1px;
}
.Book2 {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9) );
	background:-moz-linear-gradient( center top, #f9f9f9 5%, #e9e9e9 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9');
	background-color:#f9f9f9;
	-webkit-border-top-left-radius:20px;
	-moz-border-radius-topleft:20px;
	border-top-left-radius:20px;
	-webkit-border-top-right-radius:20px;
	-moz-border-radius-topright:20px;
	border-top-right-radius:20px;
	-webkit-border-bottom-right-radius:20px;
	-moz-border-radius-bottomright:20px;
	border-bottom-right-radius:20px;
	-webkit-border-bottom-left-radius:20px;
	-moz-border-radius-bottomleft:20px;
	border-bottom-left-radius:20px;
	text-indent:0;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#666666;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:34px;
	line-height:34px;
	width:72px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #ffffff;
	margin-bottom:6px;
}
.Book2:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9) );
	background:-moz-linear-gradient( center top, #e9e9e9 5%, #f9f9f9 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9');
	background-color:#e9e9e9;
}.Book2:active {
	position:relative;
	top:1px;
}
</style>

<section>

   <div class="container">
 			<div class="book_choice_wrap">
	 			<div class="modal fade" id="conpareModal1">
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header text-center">
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">×</span>
				                </button>
				                <h3 class="modal-title" id="myModalLabel">BOOK SEARCH1</h3>
				            </div>    
				            <div class="modal-body text-center">
				                 <form id="conpareForm1" role="search" action="<%=request.getContextPath()%>/inforconpare_hwang/conpareView" method="post" onsubmit="return false;">
			                         <div class="input-group">
			                            <span class="input-group-addon">책 이름 검색</span>
			                            	<!-- 검색 하는곳 -->
			                            <input type="text" class = "form-control" onkeyup="searchFunction1();" id="bookName1" name="bookName1">
			                            <span class="input-group-btn">
			                            	<!-- 검색 버튼 -->
			                                <button type="button" class="btn btn-default" onclick="searchFunction1();" id="searchBtn1" name='searchBtn1'>검색</button>
			                            </span>
			                        </div>
				                </form>
				                <p>
				                </p>
				                <div>
				                <div style="width:100%; height:515px; overflow:auto">
				                       <table class = "table text-center">
				                        <thead>
				                            <tr>
				                                <th style="width:150px;">책 이미지</th>
				                                <th style="width:600px;">책 이름</th>
			                                </tr>
				                        </thead>
				                        <tbody id='ajaxTable1'>
				                        </tbody>
				                    </table>
				                </div>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
				<div class="modal fade" id="conpareModal2">
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header text-center">
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">×</span>
				                </button>
				                <h3 class="modal-title" id="myModalLabel2">BOOK SEARCH2</h3>
				            </div>    
				            <div class="modal-body text-center">
				                 <form id="conpareForm2" role="search" action="<%=request.getContextPath()%>/inforconpare_hwang/conpareView" method="post" onsubmit="return false;">
			                         <div class="input-group">
			                            <span class="input-group-addon">책 이름 검색</span>
			                            	<!-- 검색 하는곳 -->
			                            <input type="text" class = "form-control" onkeyup="searchFunction2();" id="bookName2" name="bookName2">
			                            <span class="input-group-btn">
			                            	<!-- 검색 버튼 -->
			                                <button type="button" class="btn btn-default" onclick="searchFunction2();" id="searchBtn2" name='searchBtn2'>검색</button>
			                            </span>
			                        </div>
				                </form>
				                <p>
				                </p>
				                <div>
				                <div style="width:100%; height:515px; overflow:auto">
				                       <table class = "table text-center">
				                        <thead>
				                            <tr>
				                                <th style="width:150px;">책 이미지</th>
				                                <th style="width:600px;">책 이름</th>
			                                </tr>
				                        </thead>
				                        <tbody id='ajaxTable2'>
				                        </tbody>
				                    </table>
				                </div>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
			
 			<!-- 이미지 누르면 찾아가기 -->
			<%-- <form action="<%=request.getContextPath()%>/inforconpare_hwang/conpareView" method="post">
				<!-- 버튼 -->
				<input type="hidden" name="bookId" value="">
				<input type="hidden" name="ejkGb" value="">
				<!-- 이미지1 -->
				<input type="hidden" name="bookId0" value="<!-- 이미지의 bookid -->9788932917245">
				<input type="hidden" name="ejkGb0" value="KOR">
				<!-- 이미지2 -->
				<input type="hidden" name="bookId1" value="<!-- 이미지의 bookid -->9791159039690">
				<input type="hidden" name="ejkGb1" value="KOR">
			</form> --%>
			
			
            <div class="w950">
                <div class="book_choice">
                    <a href="#" class="btn_reset" style="">초기화</a>
                    <a href="#" class="btn_compare">비교하기</a>
                </div>
                <div id="buycheck01" class="book_choice2">
                  <div class="book_img" id="book_img1" style="top:-12px; width:125px; height:179px; border:1px solid white;">
                  </div>
                  <a class="Book1" href="#" id="zip_codeBtn1" data-toggle="modal" data-target="#conpareModal1">BOOK1</a>
                </div>
                <div id="buycheck02" class="book_choice2">
                  <div class="book_img" id="book_img2" style="top:-12px; width:125px; height:179px; border:1px solid white;">
                  </div>
                  <a class="Book2" href="#" id="zip_codeBtn2" data-toggle="modal" data-target="#conpareModal2">BOOK2</a>
                </div>
            </div>
        </div>
           
           <div class="books_spec">
            <table class="compare_list" summary="">
                <caption></caption>
                <colgroup>
                <col width="168px"><col width="189px"><col width="189px"><col width="189px"><col width="189px">
                </colgroup>
                <tbody>
                  <tr class="border_color" id="bookNm">
                    <th scope="row">
                      <strong class="rank_title"><small>도서명</small></strong>
                    </th>
					<td id="bottomTitle1">
					</td>
					<td id="bottomTitle2">
	                    <span><small>어린왕자(초판본)(양장본 HardCover)</small></span>
					</td>
                  </tr>
                  <tr class="tr_color" id="price">
                    <th scope="row">
                      <strong class="rank_title"><small>가격</small></strong>
                    </th>
                    <td id="bottomPrice1">
                    </td>
                    <td id="bottomPrice2">
                      <div class="spec_price">
                          <span class="cost"><small>9,800원</small></span>
                          <span class="price" style='font-size:20px;'><small>8,820원</small></span>ㅣ<span class="discount"><small>490P</small></span>
                        </div>
                    </td>
                  </tr>
                  <tr id="pubNm">
                    <th scope="row">
                      <strong class="rank_title"><small>출판사</small></strong>
                    </th>
                    <td id="bottomPubl1">
                    </td>
                    <td id="bottomPubl2">
                      <span><small>더스토리</small></span>
                    </td>
                    
                    
                  </tr>
                  <tr id="author">
                    <th scope="row">
                      <strong class="rank_title"><small>저자</small></strong>
                    </th>
                    <td id="bottomAuthorName1">
                    </td>
                    <td id="bottomAuthorName2">
                      <span><small>생텍쥐페리</small></span>
                    </td>
                    
                    
                  </tr>
                  <tr id="pubYmd">
					<th scope="row">
						<strong class="rank_title"><small>출간일자</small></strong>
					</th>
                    <td id="bottomDate1">
                    </td>
                    <td id="bottomDate2">
						<span><small>2018년 9월 10일</small></span>
                    </td>
                  </tr>
                </tbody>
              </table>
        </div>
    </div>
    <script type="text/javascript">
	var request=new XMLHttpRequest();
	function searchFunction1() {
		var context=$('[name=bookName1]').val();
		if(context.trim().length!=0){
		request.open("post","<%=request.getContextPath()%>/search/preview?keyword="+encodeURIComponent(document.getElementById('bookName1').value), true);
		request.onreadystatechange=searchProcess1;
		request.send();
		return true;
		}
		else
		{
			return false;
		}
	}
	function searchProcess1() 
	{
		var table=document.getElementById("ajaxTable1");
		table.innerHTML="";
/* 		var imgtable=document.getElementById("book_img1");
		var bottomtable=document.getElementById("bottomTitle1");
		var bottomPrice1=document.getElementById("bottomPrice1");
		var bottomPubl1=document.getElementById("bottomPubl1");
		var bottomAuthorName1=document.getElementById("bottomAuthorName1");
		var bottomDate1=document.getElementById("bottomDate1"); */
/* 		imgtable.innerHTML="";
		bottomtable.innerHTML="";
		bottomPrice1.innerHTML="";
		bottomPubl1.innerHTML="";
		bottomAuthorName1.innerHTML="";
		bottomDate1.innerHTML=""; */
		if(request.readyState==4 && request.status==200)
		{
			var result=eval(request.responseText);
			
			for(var i=0; i<result.length; i++)
			{
				table.innerHTML+="<tr>";
				table.innerHTML+="<td><img class='imagess1' src='"+'<%=request.getContextPath()%>/images/book/'+result[i].bookImage+"'></td>"+"<td><strong>"+result[i].bookName+"</strong><a href='#' onclick='' style='float:right;'><img style='border:none; width:20px; height:20px;' src='<%=request.getContextPath()%>/images/icons/choice.png'></a></td>";
				table.innerHTML+="</tr>";
				<%-- imgtable.innerHTML+="<p>";
				imgtable.innerHTML+="<a id='detail0' href='"+'<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId='+result[i].bookId+"' target='_blank'><img id='img0' width='125' height='179' src='"+'<%=request.getContextPath()%>/images/book/'+result[i].bookImage+"'></a>";
				imgtable.innerHTML+="</p>";
				bottomtable.innerHTML+="<span>";
				bottomtable.innerHTML+="<small>"+result[i].bookName+"</small>";
				bottomtable.innerHTML+="</span>";
				bottomPrice1.innerHTML+="<div class='spec_price'>";
				bottomPrice1.innerHTML+="<span class='cost' style='font-size:20px; color:red;'><small>"+result[i].price+"원</small></span>";
				bottomPrice1.innerHTML+="</div>";
				bottomPubl1.innerHTML+="<span><small>"+result[i].publisher+"</small></span>";
				bottomAuthorName1.innerHTML+="<span><small>"+result[i].author.authorName+"</small></span>";
				bottomDate1.innerHTML+="<span><small>"+result[i].bookDate+"</small></span>"; --%>
				
				console.log(result);
			}
		}
	}
	
	
	function searchFunction2() {
		var context=$('[name=bookName2]').val();
		if(context.trim().length!=0){
		request.open("post","<%=request.getContextPath()%>/search/preview?keyword="+encodeURIComponent(document.getElementById('bookName2').value), true);
		request.onreadystatechange=searchProcess2;
		request.send();
		return true;
		}
		else
		{
			return false;
		}
	}
	function searchProcess2() 
	{
		var table=document.getElementById("ajaxTable2");
		table.innerHTML="";
		if(request.readyState==4 && request.status==200)
		{
			var result=eval(request.responseText);
			for(var i=0; i<result.length; i++)
			{
				table.innerHTML+="<tr>";
				table.innerHTML+="<td><img class='imagess2' src='"+'<%=request.getContextPath()%>/images/book/'+result[i].bookImage+"'></td>"+"<td><strong>"+result[i].bookName+"</strong><a href='#' onclick='' style='float:right;'><img style='border:none; width:20px; height:20px;' src='<%=request.getContextPath()%>/images/icons/choice.png'></a></td>";
				table.innerHTML+="</tr>";
				
				console.log(result);
			}
		}
	}
	/* window.onload=function()
	{
		searchFunction();
	} */
</script>
<style>
#ajaxTable1 td
{
	text-align:left; vertical-align:middle;
}
#ajaxTable1 img
{
	float:left; width:110px; height:140px; border:1px solid lightgrey;
}
#ajaxTable2 td
{
	text-align:left; vertical-align:middle;
}
#ajaxTable2 img
{
	float:left; width:110px; height:140px; border:1px solid lightgrey;
}
</style>
</section>
<%@include file="/views/common/footer.jsp"%>