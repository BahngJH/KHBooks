<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.kh.notice.model.vo.*" %>
<%
	Notice n =(Notice)request.getAttribute("n");
%>
<%@ include file="/views/common/noticeHeader.jsp"%>
<style>
input[value='수정'],input[value='삭제'] {
  background-color: skyblue;
  border: none;
  color: white;
  padding: 8px 20px;
  text-decoration: none;
 margin:30px 0px 0px 20px;
  float:right;
  cursor: pointer;
}
#return{
background-color: #555555;
color:white;
border: none;
 padding: 8px 20px;
   margin-top:100px;
   margin-left:370px;
   text-align:center;
}


fieldset a{float:left;}
#content{margin:100px 0 0 0; white-space: pre-line; }

</style>
<section>
	
	<div class="col-sm-1"></div>
			<div class="col-sm-9">
				
				
				
			<br/><br/><br/>
				
				<article id="edit">
				<%if(logined!=null&&logined.getMemberId().equals("admin")){ %>
			
					<input type="button" value="삭제" onclick="deleteNotice();"/>
					<input type="button" value="수정" onclick="updateNotice();"/>
				<%}%> 
			
				</article>
				
						<h2><%=n.getNoticeTitle()%></h2>
						<hr/>
					<a><%=n.getNoticeDate()%></a>
										
						
						
						<p id="content"><%=n.getNoticeContent()%><br/></p>
				
						
			

				<button id="return" onclick="main_Notice();">목록으로</button>
				<br/><br/><br/><br/>
		<script>
			function main_Notice(){
				location.href="<%=request.getContextPath()%>/notice/noticemain";
			}
			function deleteNotice(){
				if(!confirm('정말로 삭제하시겠습니까?'))
				{
					return;	
				}
				location.href="<%=request.getContextPath()%>/notice/noticedelete?no=<%=n.getNoticeNo()%>";
			}
			function updateNotice(){
				location.href="<%=request.getContextPath()%>/notice/noticeupdate?no1=<%=n.getNoticeNo()%>";
				
			}
		</script>
			
				
</section>
			</div>

<%@include file="/views/common/footer.jsp"%>