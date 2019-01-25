<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
	<%@ page import="java.util.*,com.kh.notice.model.vo.Notice" %>
	
	<%@ include file="/views/common/adminheader.jsp"%>
	<%
		List<Notice> list=(List)request.getAttribute("list");
	String pageBar=(String)request.getAttribute("pageBar");
	%>



<style>
.notice1 a{color:black;}
.col-sm-9 a{
	text-decoration:none;
	color: black;
	cursor: pointer;
}

.col-sm-12 table{
cellspacing:0;
 cellpadding:0;
 border:0px;
 }
a{color:black;}
table th{
 border-bottom:1px solid skyblue;
margin: 5px 0;
padding: 8px 10px;
border-width: 2px;
border-height: 10px;
 text-align:center;
 }
 
 .col-sm-9 td{
 text-align:center;
 }
 input[value='새등록']{
  background-color: skyblue;
  border: none;
  color: white;
  padding: 8px 20px;
  text-decoration: none;

  float:right;
  cursor: pointer;}

</style>

<section>
<script>

function insertNotice(){
	location.href="<%=request.getContextPath()%>/notice/insertNotice";
}
</script>

			<div class="col-sm-12 col-md-9">
				<div class="notcecontent">
				<h2>공지사항</h2>
				<br/>
				<article id="edit">
				<%if(logined!=null&&logined.getMemberId().equals("admin")) {%>
					<input type="button" value="새등록" onclick="insertNotice();"/>
				<%} %>
				
				</article>
				
				
				
				
				<table class="table table-striped">
					<colgroup>
						<col width="86px" />
						<col width="*" />
						<col width="126px" />
					</colgroup>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>날짜</th>
					</tr>
					
			
					<%for(Notice n : list){ %>
					<% if(n.getStatus().equals("Y")){ %>
					<tr>
						<td><%=n.getNoticeNo() %></td>
						<td><a href="<%=request.getContextPath() %>/admin/content?no=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a></td>
						<td><%=n.getNoticeDate()%></td>					
					</tr> 
					<%} 
					}%>	 				
				</table>
				<div class="text-center">
					<%=pageBar %>
				</div>

				</div>
			
</section>

	</div>

			

<%@include file="/views/common/adminfooter.jsp"%>