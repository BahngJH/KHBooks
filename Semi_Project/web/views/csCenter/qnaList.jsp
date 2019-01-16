<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kh.csCenter.model.vo.Qna"%>

<%@ include file="/views/common/noticeHeader.jsp"%>

<%
	List<Qna> list=(List)request.getAttribute("list");
%>

<style>
.col-sm-9 a {
	text-decoration: none;
	color: black;
	cursor: pointer;
}

.col-sm-9 table {
	cellspacing: 0;
	cellpadding: 0;
	border: 0px;
}

table th {
	border-bottom: 1px solid skyblue;
	margin: 5px 0;
	padding: 8px 10px;
	border-width: 2px;
	border-height: 10px;
	text-align: center;
}

.col-sm-9 td {
	text-align: center;
}
</style>


<script>

function fn_add(){
	location.href="<%=request.getContextPath()%>";
}
</script>

<div class="col-sm-1"></div>
			<div class="col-sm-9">
				
				<h2>등록된 문의글</h2>
				<br/>
				<table class="table table-striped">
					<colgroup>
						<col width="86px" />
						<col width="*" />
						<col width="126px" />
					</colgroup>
					<tr>
						<th>글번호</th>
						<th>문의유형</th>						
						<th>제목</th>
						<th>날짜</th>
						<th>답변상태</th>
					</tr>
					
				
					<%for(Qna q : list){ %>
					<% if(q.getQnaStatus().equals("Y")){ %>
					<tr>
						<td><%=q.getQnaNum() %></td>
						<td><a href="<%=request.getContextPath() %>/qna/qnaContent?no=<%=q.getQnaNum()%>"><%=q.getQnaTitle()%></a></td>
						<td><%=q.getQnaDate()%></td>					
					</tr> 
					<%} 
					}%> 					
				</table>




</div>
<%@ include file="/views/common/footer.jsp"%>