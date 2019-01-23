<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kh.csCenter.model.vo.Qna"%>

<%@ include file="/views/common/adminheader.jsp"%>

  <%
	List<Qna> list = (List) request.getAttribute("list");
    Qna q =(Qna)request.getAttribute("q");
    //Member m =(Member)request.getAttribute("m");  
%> 
<style>
.answerContent{

color: #5F5AF3;
}
</style>
<section id="board-container">
	 <div class="row col-md-offset-1 col-md-7">
		 <div>
			 <h3 class="title">1:1 문의(관리자화면)</h3>
			 <hr>
		 </div>
 	</div>
		 <div class="row">	
				<div class="col-md-offset-1 col-md-7">					 					 					 			  	
				 	 <div class="qnaList">			  		  
				  		  <table class="table table-striped">										  		 							  		  
							<thead>		  		   
						      <tr>
						        <th>문의번호 <%=q.getQnaNum() %></th>
						        <td>회원번호  <%=q.getQnaWriter()%></td>
						        <th>E-mail 답변 수신 여부: <%=q.getQnaAnswer()%></th>
						        <th><%=q.getQnaMail()%></th>
						      </tr>						    
						    </thead>	 			  		   
						    <tbody>	
						      <tr>
						        <th>문의유형 <%=q.getQnaPart()%> </th>       
						        <th> </th>
						        <th>연락처:<%=q.getQnaTel()%></th>
						        <td></td>          
						      </tr>
						    </tbody>			 
						    <tbody>
						      <tr>
						        <th>제목 :<%=q.getQnaTitle() %></th>
						        <td></td>
						        <td></td>
						        <td> </td>
						      </tr>
						    </tbody>	
						    <tbody>  		   
						      <tr>
						        <td>내용: <%=q.getQnaContent()%></td>
						        <th></th>
						        <th></th>
						        <th></th>
						      </tr>						 
						    </tbody>
						 </table>
				  		<div>				  		 
				            <span><b>첨부파일: </b></span>					         						         
					         <%if(q.getQnaReFile()!=null) {%>
					         <img src="<%=request.getContextPath()%>/upload/qna/<%=q.getQnaReFile() %>">					        
					         <%}else{ %><b> 없음</b><%} %>
					         <br>				          			      				     					         
					         <strong>등록된 답변 :</strong>
					         <br>					        
					         <p class="answerContent"><%if(q.getReContent()!=null){ %>
					         <%=q.getReContent() %></p>	<br>				         					          		                     			 	              
	           		  </div>
	              <div class="">			  			     				          		         		         
			         <button class="btn_sub btn btn-default"  onclick="fn_updateAnswer()">답변수정</button>			        	      				       			        		  
		  		  </div>
				  <div class=""><%}else{ %>			  			     				          			        
		  		   <form name="enrollAnswer" action="<%=request.getContextPath()%>/qna/qnaAnswerEnd" method="post" > 	                                    	
			          <textarea id="" class="noresize" rows="7" cols="60" name="reContent" required="required"/></textarea>
			          <br>
			          <button type="submit" class="btn_sub btn btn-default">답변 등록</button><%} %>	
			          <button class="btn_sub btn btn-default" onclick="fn_AnswerList()">목록으로</button>
			          <input type="hidden" name="memberNum" value="<%=q.getQnaWriter()%>"/>
			  		  <input type="hidden" name="qnaNum" value="<%=q.getQnaNum()%>"/>
			  		  <input type="hidden" name="reCheck" value="<%=q.getReCheck() %>"/>
			  		  <input type="hidden" name="reMail" value="<%=q.getQnaAnswer()%>">	      				       			        		  
  			  		</form>				         			        					        					 					  								      						 					       		    				   			
		  		  </div> 
			</div>				 				 				                   		                 
		</div>
	</div>
 </section>


<script>	
<%-- 	function fn_fileDounwLoad(rName,oName)
	{
		var url="<%=request.getContextPath()%>/board/boardFileDownLoad";
		//한글파일명이 있을경우 인코딩 처리를 해야함.
		oName=encodeURIComponent(oName);
		location.href=url+"?oName="+oName+"&rName="+rName;
	}		
		 --%>	
	function fn_AnswerList(){
		location.href="<%=request.getContextPath()%>/qna/qnaListAdmin";
	}
	function fn_updateAnswer()
	{
		location.href="<%=request.getContextPath()%>/qna/answerUpdate?qnaNum=<%=q.getQnaNum()%>";
	} 
	
</script>
</div>

<%@ include file="/views/common/footer.jsp"%>