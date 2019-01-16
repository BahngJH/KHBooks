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

fieldset a{float:right;}
#content{margin:100px 0 0 0; text-align:center;}

</style>
<section>
	
	<div class="col-sm-1"></div>
			<div class="col-sm-9">
				
				
				
			<br/><br/><br/>
				<fieldset>
				<article id="edit">
				<%if(logined!=null&&logined.getMemberId().equals("1212")){ %>
			
					<input type="button" value="삭제" onclick="deleteNotice();"/>
					<input type="button" value="수정" onclick="updateNotice();"/>
				<%}%> 
			
				</article>
				
						<h2><%=n.getNoticeTitle()%></h2>
						<hr/>
					<a><%=n.getNoticeDate()%></a>
										
						
						
						<h4 id="content"><%=n.getNoticeContent()%></h4>
						
				</fieldset>
				<br/><br/><br/><br/><br/><br/><br/><br/><br/>

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