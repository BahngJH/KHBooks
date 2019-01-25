<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/adminheader.jsp"%>
<%@ page import="java.util.*,com.kh.notice.model.vo.*" %>
<%
   Notice n=(Notice)request.getAttribute("n");
%>

<style>
/* #insert {margin: 50px 50px 50px 80px;} */
form .panel panel-info{border: 1px solid blue;}
/* div.aa{border: 1px solid darkgray;} */
div.new{margin-bottom:23%;}
</style>

<section>
   <div class="new col-sm-12 col-md-9">
		<form action="<%=request.getContextPath()%>/admin/noticeinsert">
      		<h2>공지사항 등록</h2>
         	<table class="table" id="insert">
	            <tr>
	               <th><h5>제목:</h5></th>
	               <td><input class="form-control" type="text" name="title" required="required" /></td>
	            </tr>
	            
	            <tr>
	               <th><h5>내용:</h5></th>
	               <td><textarea class="form-control"  rows="8" cols="80" name="content"></textarea>
	               </td>
	            </tr>
	            <tr>
	            	<td><input class="btn btn-primary" type="submit" value="등록" /></td>
	            	<td><button class="btn btn-danger" onclick="cancel();">취소</button></td>
	            </tr>
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