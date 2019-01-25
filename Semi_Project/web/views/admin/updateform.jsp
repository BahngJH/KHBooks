<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.notice.model.vo.*,java.util.*" %>
<%@ include file="/views/common/adminheader.jsp"%>

<%
	Notice n=(Notice)request.getAttribute("n");
%>
<style>
#sub{border:none;}

</style>




<section>
	<div class="col-sm-12 col-md-9">
		<form action="<%=request.getContextPath()%>/admin/adminnoticeupdate"">
			<h2>공지사항 수정</h2>
			<table class="table" id="update">
				<tr>
					<th><h4>번호:</h4></th>
					<td><input class="form-control" type="text" name="no1" value="<%=n.getNoticeNo()%>"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<th><h4>날짜:</h4></th>
					<td><input class="form-control" type="text" name="date"
						value="<%=n.getNoticeDate()%>" readonly="readonly" /></td>
				</tr>
				<tr>
					<th><h4>제목:</h4></th>
					<td><input class="form-control" type="text" name="title"
						value="<%=n.getNoticeTitle()%>" required="required" /></td>
				</tr>
				<tr>
					<th><h4>내용:</h4></th>
					<td><textarea class="form-control" rows="8" cols="80" name="content"><%=n.getNoticeContent() %></textarea>
					</td>
				</tr>
				<tr>
				<td><input type="submit" class="btn btn-primary" value="등록" /></td>
				<td><input type="button" class="btn btn-danger" onclick="cancel();" value="취소"/></td>
			</table>
		</form>
	</div>
	
</section>
</div>
<script>
	function cancel(){
		history.back();
	}
</script>

<%@include file="/views/common/adminfooter.jsp"%>