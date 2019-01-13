<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/oneOnOneList.css">


<div class="container">

	<div class="csCenter">
		<div class="csAsk col-sm-offset-2 col-sm-8">
			<h3 class="cs_title">1:1 문의내역</h3>
		</div>
		
	

		<div class="csAskBtn col-sm-offset-2 col-sm-8">
		    <p><button type="button" id="askBtn" class="btn btn-primary btn-lg btn-block">1:1 문의하기</button></p>
		</div>
	</div>


	<div class="csCenter col-sm-offset-2 col-sm-8">  
			<div id="askList">	
				<ul class="askList">										   		   
					   <li><a href="" class=""> 
						<span class="bWrap"> 
						    <em class="txt">사은품 문의드립니다. </em> 
							<span class="csInfo"> 
								<span class=""> 읽음</span> 
								<span class="divi">|</span> 
								<span class="info_date">2018.03.31</span>
							</span> 
							<em class="">&nbsp;</em>
						</span>
					</a></li>
					
					
					
					
					
					 <li><a href="" class=""> 
						<span class="bWrap"> 
						    <em class="txt">사은품 문의드립니다. </em> 
							<span class="csInfo"> 
								<span class=""> 읽음</span> 
								<span class="divi">|</span> 
								<span class="info_date">2018.03.31</span>
							</span> 
							<em class="">&nbsp;</em>
						</span>
					</a></li>
					
					
					
					
					
					 <li><a href="" class=""> 
						<span class="bWrap"> 
						    <em class="txt">사은품 문의드립니다. </em> 
							<span class="csInfo"> 
								<span class=""> 읽음</span> 
								<span class="divi">|</span> 
								<span class="info_date">2018.03.31</span>
							</span> 
							<em class="">&nbsp;</em>
						</span>
					</a></li>
			
					
									
							    
					    
					<!-- #####0000000000 문의 내역 리스트 끝 0000000000##### -->
					<li><a href="/Mall/Help/CS/View?AplNo=5609847"
						class="btn_lnk btnC b_size"> 
						<span class="bWrap"> 
						    <em class="txt">사은품 문의드립니다. </em> 
							<span class="csInfo"> 
								<span class="info_item info_status status_05"> 읽음</span> 
								<span class="divi">|</span> 
								<span class="info_item info_date">2018.03.31</span>
							</span> 
							<em class="ico_comm bgYUI ico_goB">&nbsp;</em>
						</span>
					</a></li>
			</ul>
					
		 </div>
				
		<div id="pager" class="" style="">
			<strong class="num">1</strong>
		</div>
	</div>


</div>




<script>
	var g_Page = 1;
	var g_pageIndex = 1;
	var g_pageSize = 10;
	var IsShowPager = "True";
</script>





<%@ include file="/views/common/footer.jsp"%>