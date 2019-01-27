<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kh.csCenter.model.vo.Qna, com.kh.csCenter.model.vo.QnaRe"%>
	<%@ include file="/views/common/noticeHeader.jsp"%>

 <%
	List<Qna> list = (List) request.getAttribute("list");
	int cnt = (int) request.getAttribute("cnt");
	String pageBar = (String) request.getAttribute("pageBar");
	List<QnaRe> qrList = (List)request.getAttribute("qrList");
%>

<style>
.askLi {
	padding: 11px 0 2px 0;
	list-style: none;
}

ul {
	display: block;
	list-style-type: disc;
	padding-inline-start: 40px;
}

em {
	font-size: 17px;
}

.cs_title {
	font-size: 2em;
	float: left;
	padding-top: 35px;
	margin: 40px 0 0 40px;
}

#askBtn {
	width: 120px;
	height: 30px;
	font-size: 15px;
	/* 	padding: 0 0 1px 0; */
	float: right;
	text-align: center;
	margin: 90px 0 0 0;
}

.row hr {
	border: 0;
	height: 2px;
	background: #ccc;
}

.qna-paging {
	text-align: center;
}

.searchDate {
	text-align: left;
	padding-left: 70px;
	padding-bottom: 20px;
}

#askTitle_tg {
	width: 100%;
	text-aglign: center;
	outline:none;
}

.sch-lcont {
	padding: 0 50px 50px 20px;
}

.cal {
	padding: 0 15px 10px 15px;
}

.search_btn {
	padding-top: 15px;
}

.searchDate {
	padding-bottom: 40px;
}

.answer_tg {
	
	width: 100%;
	
}
element {
    outline: none;
}

.Answer {
	margin-left: 70px;
}
.pageBar{

padding-top: 30px;
}

.cho_b{

width:20px;height:20px;
}
.myAsk{
margin-right:100px;
}

.answer{
margin-left:100px;

}
</style>

<script>
	function fn_addQna() {
		location.href = "<%=request.getContextPath()%>/qna/qnaInput";}
</script>


<section class="board-container col-sm-12 col-md-9">	
 <!-- 타이틀 -->
 	<div class="row">
		<div class="csCenter col-md-10">			
				<strong><h3 class="cs_title">1:1 문의내역</h3></strong>										
			 <%if(logined!=null){%> 
				<button class="btn btn-primary" id="askBtn" onclick="fn_addQna()">1:1 문의하기</buton>
			<% } %> 
		</div>	  												
	</div>
	<div class="row">
		<div class="csCenter col-md-12">			
			<hr>
		</div>	  												
	</div>
    <!-- 문의리스트 -->
    <div class="row">
		<div class="csCenter col-md-12">  				
			<div class="askTitle">
				<ul class="askList">						
			 	  <%for(Qna q : list){%>									 	   		   					   
	                <li class="askLi">	               
		               	 <button class="btn btn-primary" id="askTitle_tg" type="button" onclick="fn_Content()" data-toggle="collapse" data-target="#Qnum<%=q.getQnaNum() %>" aria-expanded="false" aria-controls="collapseExample">				       		 			       							    					     						       							    							    						     							     						        
		               	 	<div class="row">
		               	 		<div class="col-xs-3">
							        <span class="">답변 상태: <%=q.getReCheck() %></span> 			   						     		               	 		
		               	 		</div>
		               	 		<div class="col-xs-6">
							        <em class="askInfo"><b><%=q.getQnaTitle() %></b></em>	               	 		
		               	 		</div>
		               	 		<div class="col-xs-3">
							        <span class=""><%=q.getQnaDate() %></span>		               	 		
		               	 		</div>
		               	 	</div>
						</button>					
					</li> 							 						
					<!--문의글 확인 및 재문의 -->			
					<div class="answer_tg collapse" id="Qnum<%=q.getQnaNum()%>">
	                     <div class="well" value="">
	                     	 <div class="myAsk alert alert-info">
	  								<strong><h4>내질문 :<%=q.getQnaContent() %></h4></strong>
							 </div>							
							  <div class="Answer alert alert-warning">
	  								<%if(q.getReContent()!=null){%>
	  								<strong><h4>답변 : <%=q.getReContent() %></h4></strong>   								
	  								<% }else{%>
	  								<strong>답변 : 답변대기중입니다.</strong><%} %>
							 </div>			                     	                    	                       																			                        						                                              
						 	<!-- <button >삭제하기</button> -->
	                      </div>                       
	                 </div>
 	                 <%} %> 	                                           							
				</ul>
			</div>									 	  
		</div>
	</div>
				<!--페이징처리 -->
	<div class="row">		                
   		<div class="qna-paging col-md-12" >
   			<div id='pageBar'>
	 			<nav>
	 				<ul class="pageBar pagination">			  		
						<li><%=pageBar %></li>				
					</ul>
   	  		 	</nav>
  	  		 </div>		 	
   		</div>
	</div>
</section>
</div>



<!-- <th colspan="2">
<input type="button" value="수정하기" onclick="fn_updateBoard()"/>
<input type="button" value="삭제하기" onclick="fn_deleteBoard()"/>
</th> 
 -->


	
		


<%@ include file="/views/common/footer.jsp"%> 