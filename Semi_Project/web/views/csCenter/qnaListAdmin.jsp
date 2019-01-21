<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kh.csCenter.model.vo.Qna"%>

<%@ include file="/views/common/noticeHeader.jsp"%>

 <%
	List<Qna> list = (List) request.getAttribute("list");
   // int cnt = (int)request.getAttribute("cnt");
	 String pageBar = (String) request.getAttribute("pageBar");
%> 


<!-- 최상단  -->

<section id="board-container">
		 <div class="row col-md-offset-1 col-md-7">
			 <div>
				 <h3 class="title">1:1 문의(관리자화면)</h3>
				 <hr>
			 </div>
		 </div>
			 <!-- 날짜 조회 -->	
		<div class="row">	
			<div class="searchDate col-md-offset-1 col-md-7">	 
				 <div class="sch-lcont">
					<strong>기간별 조회</strong>
					<input type="text" id="htxtFromDate" name="htxtFromDate" value="2018-07-13" class="txt" style="width:76px;" maxlength="8" onfocus="javascript:$.onCalendarFocus(this);" onblur="javascript:$.onCalendarBlur(this, 'htxtToDate');" onkeydown="javascript:$.onCalendarKeyDown();"  onkeyup="javascript:$.onCalendarKeyUp(this);" />
					<img style='cursor:pointer' id=ucCalendarFrom onclick="displayDatePicker('htxtFromDate','','','',event);return false;" src="<%=request.getContextPath()%>/images/icons/ico_cal.gif" align='absMiddle'> ~
					<input type="text" id="htxtToDate" name="htxtToDate" value="2019-01-13" class="txt" style="width:76px;" maxlength="8"  onfocus="javascript:$.onCalendarFocus(this);"  onblur="javascript:$.onCalendarBlur(this);" onkeydown="javascript:$.onCalendarKeyDown();"  onkeyup="javascript:$.onCalendarKeyUp(this);"/>
					<img style='cursor:pointer' id=ucCalendarTo onclick="displayDatePicker('htxtToDate','','','',event);return false;" src="<%=request.getContextPath()%>/images/icons/ico_cal.gif" align='absMiddle'>												
					<div>
						<span class="cbtn">					  		
					      <a class="btn btn-default" href="javascript:$.setDate('dateFieldName, year, month, day');" role="button">오늘</a>  
					      <a class="btn btn-default" href="javascript:$.setDate('dateFieldName, year, month, day');" role="button">일주일</a>  
					      <a class="btn btn-default" href="javascript:$.setDate('dateFieldName, year, month, day');" role="button">1개월</a>  
					      <a class="btn btn-default" href="javascript:$.setDate('dateFieldName, year, month, day');" role="button">최신순</a>
					      <a class="btn btn-default" href="javascript:$.setDate('dateFieldName, year, month, day');" role="button">문의유형</a>
					       <a class="btn btn-default" href="javascript:$.setDate('dateFieldName, year, month, day');" role="button">답변여부</a>   	 
					      <a class="btn btn-default" href="javascript:$.onClickBtnSearch();" id="btnSearch" role="button">조회</a>     
						</span>
						  <hr>
					</div>
				 </div>
			 </div>	
			 <div class="row">	
				<div class="searchDate col-md-offset-1 col-md-7">		
				  <div class="qnaList">
					  <table class="table table-striped">						  
					    <thead>
					      <tr>
					      <th><input type="checkbox" name="vehicle1" value="Bike"></th>
					        <th><b>문의유형</b></th>
					        <th><b>문의제목</b></th>				        					        
					        <th><b>문의날짜</b></th>
					        <th><b>답변여부</b></th>					       
					      </tr>
					    </thead>					    
					     <tbody>			
					      <%for(Qna q : list){ %>	
					  		 <% if(q.getQnaStatus().equals("Y")){ %> 	
						        <th><b><%=q.getQnaPart()%></b></th>
						        <th><b><a href="<%=request.getContextPath() %>/qna/qnaContent?no=<%=q.getQnaNum()%>"><%=q.getQnaTitle()%></a></b></th>						   					        
						        <th><b><%=q.getQnaDate()%></a></b></th>					       
						        <th><b>답변여부</b></th>					        
						        <th><b>읽음|안읽음</b></th>				        					         
						      </tr>
					       	<%} 
				    	  } %> 	 		    
					    </tbody>
					  </table>
  					</div>
  				</div>				 				 				                   		                 
			</div>
		</div>	
		<!--페이징처리 -->
		<div class="row">		                
	   		<div class="qna-paging col-md-offset-1 col-md-7" >
	   			<div id='pageBar'>
		 			<nav>
		 				<ul class="pagination">			  		
							<li><%=pageBar %></li>				
						</ul>
	   	  		 	</nav>
   	  		 	</div>		 	
	   		</div>
		</div>			 		  			
 </section>
</div>


<%@ include file="/views/common/footer.jsp"%>