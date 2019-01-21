<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kh.csCenter.model.vo.Qna"%>

<%@ include file="/views/common/noticeHeader.jsp"%>

  <%
	List<Qna> list = (List) request.getAttribute("list");
    Qna q =(Qna)request.getAttribute("q");
    //Member m =(Member)request.getAttribute("m");
   
%> 
<section id="board-container">
	 <div class="row col-md-offset-1 col-md-7">
			 <div>
				 <h3 class="title">1:1 문의(관리자화면)</h3>
				 <hr>
			 </div>
		 </div>
		 <div class="row">	
				<div class="col-md-offset-1 col-md-7">		
				  <form name="enrollAnswer" action="<%=request.getContextPath()%>/qna/qnaAnswerEnd" onsubmit="return validate();" method="post" >					 					 			  	
				 	 <div class="qnaList">
			  		  <input type="hidden" name="memberNum" value="<%=q.getQnaWriter()%>"/>
			  		  <input type="hidden" name="qnaNum" value="<%=q.getQnaNum()%>"/>
			  		  <input type="hidden" name="reCheck" value="<%=q.getQnaAnswer()%>"/>
				  		  <table class="table table-striped">							  				   				   
						     <tr>		      
						        <th><b><%=q.getQnaNum() %></b></th>
						        <th><b>문의유형</b></th>
						        <th><b><%=q.getQnaPart()%></b></th>
						        <th><b><input name="reMail" value="<%=q.getQnaAnswer()%>" readonly>E-mail 답변 여부 <%=q.getQnaAnswer()%></b></th>
						        <th><b></b></th>
						        <th><b></b></th>
					          </tr>
					          <tr>				      
						        <th><b>ID</b></th>
						        <th><b>회원번호 <%=q.getQnaWriter()%></b></th> 
						        <th><b>E-mail <%=q.getQnaMail()%></b></th>
						        <th><b></b></th>
						        <th><b>연락처 <%=q.getQnaTel()%></b></th>
						        <th><b></b></th>				        						        
					           </tr>
					           <tr>				      
						        <th><b>제목</b></th>
						        <th><b><%=q.getQnaTitle()%></b></th>
						        <th><b></b></th>
						        <th><b></b></th>
						        <th><b></b></th>
						        <th><b></b></th>
					           </tr>
					           <tr>				      
						         <th><b>내용</b></th>
						         <th><b><%=q.getQnaContent()%></b></th>
						         <th><b></b></th>
						         <th><b></b></th>
						         <th><b></b></th>
						         <th><b></b></th>
					            </tr>
					            <tr>				      
						         <th><b>첨부파일</b></th>
						         <th><b> 						         
						         <%if(q.getQnaReFile()!=null) {%>
						         <img src="<%=request.getContextPath()%>/upload/qna/<%=q.getQnaReFile() %>"></b></th>						         					         
						         <th><%}else {%>
						         <b>첨부파일 없음</b><%} %></th>
						         <th><b></b></th>
						         <th><b></b></th>
						         <th><b></b></th>			        	     					      
					           </tr>  
					           <tr>				      
						         <th><strong>등록된 답변</strong></th>					        
						         <th></th>						         
						         <th><b><%if(q.getReContent()!=null){ %>
						         <%=q.getReContent() %></b></th>
						         <th></th>					        
						         <th></th>			        	     					      
					           </tr>			          
            			 </table>	              
	             </div>
	              <div class="">			  			     				          		         		         
			         <button type="update" class="btn_sub btn btn-default"  onclick="fn_updateAnswer()">답변 수정</button>			        	      				       			        		  
		  		  </div> 	                                    	
				  <div class=""><%}else{ %>			  			     				          			        
			          <textarea id="" class="noresize" rows="7" cols="60" name="reContent" required="required"/></textarea>
			          <button type="submit" class="btn_sub btn btn-default" onclick="fn_enrollAnswer()">답변 등록</button><%} %>	
			          <button class="btn_sub btn btn-default" onclick="fn_AnswerList()">목록으로</button>	      				       			        		  
		  		  </div> 
  			  	</form>				         			        					        					 					  								      						 					       		    				   			
			</div>				 				 				                   		                 
		</div>
 </section>
</div>


	<%-- <script>	
		function fn_fileDounwLoad(rName,oName)
		{
			var url="<%=request.getContextPath()%>/board/boardFileDownLoad";
			//한글파일명이 있을경우 인코딩 처리를 해야함.
			oName=encodeURIComponent(oName);
			location.href=url+"?oName="+oName+"&rName="+rName;
		}		
				
	
		function fn_updateAnswer()
		{
			location.href="<%=request.getContextPath()%>/board/boardUpdate?no=<%=b.getBoardNo()%>";
		}
		
	</script> --%>


<%@ include file="/views/common/footer.jsp"%>