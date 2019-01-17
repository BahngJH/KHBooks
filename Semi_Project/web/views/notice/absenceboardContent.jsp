<%@page import="com.kh.absence.model.vo.Absence"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.kh.notice.model.vo.*" %>
<%
	Absence ab =(Absence)request.getAttribute("ab");
%>
<%@ include file="/views/common/noticeHeader.jsp"%>
<style>

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
			 	<%if(logined!=null||logined.getMemberId().equals("admin")){ %>
				
			 	<article id="edit">
				<table>
					<tr>
						<th><h4>책제목:</h4></th>
						<td><%=ab.getBookName() %></td>
					</tr>
					<tr>
						<th><h4>저자:</h4></th>
						<td><%=ab.getAuthor() %></td>
					</tr>
					<tr>
							<th><h4>발행연도:</h4></th>
						<td><%=ab.getBookDate() %></td>
					</tr>
					<tr>
					<th><h4>출판사:</h4></th>
						<td><%=ab.getPublisher() %></td>
					</tr>
					<tr>
						<th><h4>신청번호:</h4></th>
						<td><%=ab.getAppNum() %></td>
					</tr>
					<tr>
						<td><%=ab.getAppDate() %></td>
						
						
					</tr>				
					

				<%}%> 
				</table>		
				</article>
				 
						
				
				<br/><br/><br/><br/><br/><br/><br/><br/><br/>

				<button id="return" onclick="main_absence();">목록으로</button>
				<br/><br/><br/><br/>
		<script>
		function main_absence(){
			location.href="<%=request.getContextPath()%>/notice/absenceView";
		}
		
			<%-- function main_Notice(){
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
				
			} --%>
		</script>
				
				
				
</section>
			</div>

<%@include file="/views/common/footer.jsp"%>