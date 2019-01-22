<%@page import="com.kh.absence.model.vo.Absence"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.kh.notice.model.vo.*"%>
<%
	Absence ab =(Absence)request.getAttribute("ab");
%>
<%@ include file="/views/common/noticeHeader.jsp"%>
<style>
#return {
	background-color: #555555;
	color: white;
	border: none;
	padding: 8px 20px;
	margin-top: 100px;
	margin-left: 370px;
	text-align: center;
}

fieldset a {
	float: right;
}

#content {
	margin: 100px 0 0 0;
	text-align: center;
}

table.type10 {
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	margin: 40px 10px 0px 180px;
	width:0px; height:30px;
}

table.type10 thead th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	background: #8C8C8C;
	margin: 20px 10px;
	text-align: center;
}

table.type10 tbody th {
	width: 150px;
	padding: 10px;
	text-align: center;
}

table.type10 td {
	width: 350px;
	padding: 10px;
	vertical-align: center;
}

table.type10 .even {
	background: #EAEAEA;
}

input[value='삭제하기'] {
	background-color: skyblue;
	border: none;
	color: white;
	padding: 8px 20px;
	margin:30px 0px 0px 30px;
	text-decoration: none;
	float: right;
	cursor: pointer;
}
</style>
<section>

	<div class="col-sm-1"></div>
	<div class="col-sm-9">
<br/><br/>
		
		
			<%if(ab.getMemberNum()==logined.getMemberNum()){ %>
			<input type="button" value="삭제하기" id="deleted" onclick="deleted();" />
			<%} %>
			<h2>도서신청 VIEW</h2>
			<hr />


			<br />
			<br />
			<br />
			<%if(logined!=null||logined.getMemberId().equals("admin")){ %>

			
			<table class="type10">
				<thead>

					<tr>
						<th scope="cols">타이틀</th>
						<th scope="cols">내용</th>
					</tr>

				</thead>
				<tbody>
					<tr>
						<th scope="row"><h4>책제목</h4></th>
						<td><%=ab.getBookName() %></td>
					</tr>
					<tr>
						<th scope="row" class="even"><h4>저자</h4></th>
						<td class="even"><%=ab.getAuthor() %></td>
					</tr>
					<tr>
						<th scope="row"><h4>발행연도</h4></th>
						<td><%=ab.getBookDate() %></td>
					</tr>
					<tr>
						<th scope="row" class="even"><h4>출판사</h4></th>
						<td class="even"><%=ab.getPublisher() %></td>
					</tr>
					<tr>
						<th scope="row"><h4>신청번호</h4></th>
						<td><%=ab.getAppNum()%></td>
					</tr>
					<tr>
						<th scope="row" class="even"><h4>등록일</h4></th>
						<td class="even"><%=ab.getAppDate() %></td>


					</tr>
				</tbody>

				<%}%>


			</table>
			
			<!-- 댓글 폼 구현중  -->
	<%-- 		<div class="comment-editor">			
				<form action="<%=request.getContextPath() %>/board/commentInsert" name="boardCommentFrm" method="post">
					<input type="text" class="form-control" placeholder="Text input">
						<input type="hidden" name="boardRef" value="<%=b.getBoardNo() %>"/> 
						<input type="hidden" name="boardCommentWriter" value="<%=logined.getMemberId() %>"/>
						<input type="hidden" name="boardCommentLevel" value="1"/>
						<input type="hidden" name="boardCommentRef" value="0"/>
						<textarea cols='60' rows='3' name=""></textarea>
						<button type="submit" id="btn-insert">등록</button>
				</form>
			</div> --%>
			




		<br />
		<br />

		<button id="return" onclick="main_absence();">목록으로</button>
		<br />
		<br />
		<br />
		<br />
		<script>
		
		function deleted(){
			if(!confirm('정말 삭제하시겠습니까?')){
				return;
			}
			location.href="<%=request.getContextPath()%>/absence/deleted?no3=<%=ab.getAppNum()%>";
			
		}
		
		
		function main_absence(){
			location.href="<%=request.getContextPath()%>/absence/page";
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