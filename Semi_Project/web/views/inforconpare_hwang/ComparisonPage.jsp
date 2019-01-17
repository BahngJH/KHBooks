<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
    
<meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'>
<%@ include file="/views/common/header.jsp"%>

<style>
body
{
	width:100%;
    background-color:silver;
}
html, body
{
	width:100%;
    height:100%;
}
.container
{
	height:auto;
    border:1px solid darkgray;
    background-color:white;
}
.comparebook
{
	right:12%;
	max-width:100%;
	width:100%;
	height:auto;
    text-align: center;
    margin-top:35px;
    margin-bottom:35px;
}
table
{
	width:100%;
	border:2px solid grey;
	border-collapse: collapse;
}
th, td {
    border: 2px solid grey;
    padding: 20px;
    text-align: center;
}
th {
    background-color: #bbdefb;
}
td {
	background-color: #e3f2fd;
}
.book-1{
	position: relative;
	width: 100%;
	height: 0;
	right: 15px;
	overflow: hidden;
	padding-top:20px;
	padding-bottom: 220px;
}
.book-1 .wrap {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}
.book-2{
	position: relative;
	width: 100%;
	height: 0;
	right: 5px;
	overflow: hidden;
	padding-top:20px;
	padding-bottom: 220px;
}
.book-2 .wrap {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}
.book-3{
	position: relative;
	width: 100%;
	height: 0;
	right: -5px;
	overflow: hidden;
	padding-top:20px;
	padding-bottom: 220px;
}
.book-3 .wrap {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}
.book-4{
	position: relative;
	width: 100%;
	height: 0;
	right: -15px;
	overflow: hidden;
	padding-top:20px;
	padding-bottom: 220px;
}
.book-4 .wrap {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}
.lists {
	margin-top:50px;
}
</style>

<section>

   <div class="container">
 

    <div class='row section'>
		<div class='comparebook col-sm-12'>
			<div class='bookasd col-sm-2' style='width:40%;'>
 		 	</div>
		
			<div class='book-1 col-sm-2' style='width:15%;'>
		        <img src='<%=request.getContextPath() %>/images/book/어린왕자.jpg' height=200px; />
 		 	</div>
		
		
		
			<div class='book-2 col-sm-2' style='width:15%;'>
			    <img src='<%=request.getContextPath() %>/images/book/해리포터2.jpg' height=200px; />
			</div>
			
			
			
			
			<div class='book-3 col-sm-2' style='width:15%;'>
			    <img src='<%=request.getContextPath() %>/images/book/해리포터2.jpg' height=200px; />
			</div>
			
			
			
			
			<div class='book-4 col-sm-2' style='width:15%;'>
			    <img src='<%=request.getContextPath() %>/images/book/해리포터2.jpg' height=200px; />
			</div>
		</div>
            
            
            
            
            <div class='lists col-sm-12' style='margin-bottom:30px; width:80%; left:10%;'>
            <table class='compare_list' summary>
                	<caption></caption>
                	<colgroup>
                		<col width="189px">
                		<col width="189px">
                		<col width="189px">
                		<col width="189px">
                		<col width="189px">
                	</colgroup>
                	<tbody>
                		<tr class='border_colr' id='bookNm'>
                			<th scope='row'>
                				<strong class='rank_title' style='text-weight:bold;'>도서이름</strong>
                			</th>
                			<td id='buycheck01'>
                				<span>소설 도쿄(누벨 바그 2)</span>
                			</td>
                			<td id='buycheck02'>
                				<span>운수 좋은 날(한국문학전집 34)</span>
                			</td>
                			<td id='buycheck03'>
                				<span>해리포터: 마법사의 돌</span>
                			</td>
                			<td id='buycheck04'>
                				<span>어린왕자</span>
                			</td>
                		</tr>
                		<tr class='tr_color' id='price'>
                		<th scope="row">
                      		<strong class="rank_title" style='text-weight:bold;'>가격</strong>
	                    </th>
	                    <td id="buycheck01">
		                    <div class="spec_price">
			                    <span class="cost">12,000원</span>
			                    <span class="price">10,800원</span>ㅣ<span class="discount">600P</span>
		                    </div>
                    	</td>
                    	<td id="buycheck02">
                      		<div class="spec_price">
		                        <span class="cost">10,000원</span>
		                        <span class="price">9,000원</span>ㅣ<span class="discount">500P</span>
                        	</div>
                    	</td>
                    	<td id="buycheck03">
                      		<div class="spec_price">
                          		<span class="cost">9,000원</span>
                          		<span class="price">8,100원</span>ㅣ<span class="discount">450P</span>
                        	</div>
                    	</td>
                    	<td id="buycheck04">
                      		<div class="spec_price">
			                    <span class="cost">6,000원</span>
			                    <span class="price">5,400원</span>ㅣ<span class="discount">300P</span>
                        	</div>
                    	</td>
                		</tr>
                		<tr id="pubNm">
							<th scope="row">
							  <strong class="rank_title" style='text-weight:bold;'>출판사</strong>
							</th>
							<td id="buycheck01">
							  <span>아르띠잔</span>
							</td>
							<td id="buycheck02">
							  <span>문학과지성사</span>
							</td>
							<td id="buycheck03">
							  <span>문학수첩</span>
							</td>
							<td id="buycheck04">
							  <span>새움</span>
							</td>
						</tr>
						<tr id="author">
							<th scope="row">
							  <strong class="rank_title" style='text-weight:bold;'>저자</strong>
							</th>
							<td id="buycheck01">
							  <span>김학찬</span>
							</td>
							<td id="buycheck02">
							  <span>현진건</span>
							</td>
							<td id="buycheck03">
							  <span>J. K. 롤링</span>
							</td>
							<td id="buycheck04">
							  <span>앙투안 드 생텍쥐페리</span>
							</td>
						</tr>
						<tr id="pubYmd">
							<th scope="row">
								<strong class="rank_title" style='text-weight:bold;'>출간일자</strong>
							</th>
							<td id="buycheck01">
								<span>2019년 1월 24일</span>
			               	</td>
			               	<td id="buycheck02">
								<span>2008년 3월 6일</span>
		               		</td>
			               	<td id="buycheck03">
								<span>2014년 12월 18일</span>
			               	</td>
		               		<td id="buycheck04">
								<span>2017년 9월 22일</span>
						  	</td>
						</tr>
                	</tbody>
                </table>
            </div>
    </div>
  </div>
        
</section>
<%@include file="/views/common/footer.jsp"%>