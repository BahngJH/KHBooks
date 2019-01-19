<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kh.csCenter.model.vo.Qna"%>

<%@ include file="/views/common/noticeHeader.jsp"%>

 <%
	List<Qna> list = (List) request.getAttribute("list");
 Qna q =(Qna)request.getAttribute("q");
%> 



<section id="board-container">
	
<!-- 상담 개인정보 입력 div -->
		<div class="row">	
				<div class="searchDate col-md-offset-1 col-md-7">		
				  <div class="qnaList">
					  <table class="table table-striped">						  				   				   
					      <tr>				      
					        <th><b>문의유형</b></th>
					        <th><b><%=q.getQnaPart()%></b></th>
				          </tr>
				          <tr>				      
					        <th><b>ID</b></th>
					        <th><b><%=q.getQnaWriter()%></b></th>
					        <th><b>E-mail 답변 여부</b></th>
					        <th><b><%=q.getQnaAnswer()%></b></th>
					        <th><b>연락처</b></th>
					        <th><b><%=q.getQnaTel()%></b></th>				        
				          </tr>
				           <tr>				      
					        <th><b>제목</b></th>
					        <th><b><%=q.getQnaTitle()%></b></th>
				           </tr>
				           <tr>				      
					        <th><b>내용</b></th>
					        <th><b><%=q.getQnaContent()%></b></th>
				           </tr>
				            <tr>				      
					        <th><b>첨부파일</b></th>
					       <th> <img src="<%=q.getQnaContent()%>/upload/qna/<%=q.getQnaOriFile() %>"></b></th>			        	     					      
				           </tr>				         			        					        					 					  								      						 					       		    				   
					  </table>
  					</div>
  				</div>				 				 				                   		                 
			</div>
 </section>
</div>



<%@ include file="/views/common/footer.jsp"%>