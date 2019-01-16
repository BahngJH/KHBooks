<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/noticeHeader.jsp"%>
<%@ page import="java.util.*,com.kh.notice.model.vo.*" %>
<%
	Notice n=(Notice)request.getAttribute("n");
%>

<style>
#insert th{}
#insert {margin: 50px 50px 50px 80px;}
form .panel panel-info{border: 1px solid blue;}
div.aa{border: 1px solid darkgray;}
</style>

<section>
	<div class="col-sm-1"></div>
	<div class="col-sm-9">
	<form action="<%=request.getContextPath()%>/notice/insert">
		<h2>공지사항 등록</h2>
		
			<br/><br/><br/>
			<div class="aa">
			<table id="insert">
				<tr>
					<th><h3>제목:</h3><br/><br/><br/></th>
					<td><input class="form-control" type="text" name="title" required="required" /><br/><br/><br/></td>

				</tr>
				
				<tr>
					<th><h3>내용:</h3></th>
					<td><textarea class="form-control"  rows="8" cols="80" name="content"></textarea>
					</td>

				</tr>

			</table>
			<br/><br/><br/>
				</div>
			
			<input type="submit" value="등록" />
			</form>



	
</section>
</div>


<%@include file="/views/common/footer.jsp"%>