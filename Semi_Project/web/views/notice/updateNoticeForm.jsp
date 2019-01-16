<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.notice.model.vo.*,java.util.*" %>
<%@ include file="/views/common/noticeHeader.jsp"%>

<%
	Notice n=(Notice)request.getAttribute("n");
%>
<style>
#sub{border:none;}

</style>




<section>
	<div class="col-sm-1"></div>
	<div class="col-sm-9">
	<form action="<%=request.getContextPath()%>/notice/update">
		<h2>공지사항 수정</h2>
		
			<table id="update">

				<tr>
					<th><h3>번호:</h3></th>
					<td><input type="text" name="no1" value="<%=n.getNoticeNo()%>"
						readonly="readonly" /></td>

				</tr>
				<tr>
					<th><h3>날짜:</h3></th>
					<td><input type="text" name="date"
						value="<%=n.getNoticeDate()%>" readonly="readonly" /></td>

				</tr>
				<tr>
					<th><h3>제목:</h3></th>
					<td><input type="text" name="title"
						value="<%=n.getNoticeTitle()%>" required="required" /></td>

				</tr>
				<tr>
					<th><h3>내용:</h3></th>
					<td><textarea rows="8" cols="80" name="content"><%=n.getNoticeContent() %></textarea>
					</td>

				</tr>

			</table>
			
			<input type="submit" value="등록" onclick="update();"/>
			</form>



	
</section>
</div>


<%@include file="/views/common/footer.jsp"%>