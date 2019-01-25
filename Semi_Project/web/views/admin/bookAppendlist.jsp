<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.*,com.kh.absence.model.vo.*, com.kh.member.model.vo.*" %>
	<%
		List<Absence> list=(List)request.getAttribute("list");
			String pageBar=(String)request.getAttribute("pageBar");
	%>
<%@ include file="/views/common/adminheader.jsp"%>


<style>

.col-sm-9 a{
	text-decoration:none;
	color: black;
	cursor: pointer;
}

.col-sm-9 table{
cellspacing:0;
 cellpadding:0;
 border:0px;
 }

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


span.glyphicon-ok{
	color: #1f8ce6;
}
</style>

<section>

<script>
function absence1(){
	location.href="<%=request.getContextPath()%>/notice/absence";
}

</script>

			<div class="col-sm-1"></div>
			<div class="col-sm-9">
				<div class="notcecontent">
				<h2>신청 목록</h2>
				<hr/>
				<br/>
				<article id="edit">
				
				
					
					
				
				</article>
				
				
				
				
				<table class="table table-striped">
					<colgroup>
						<col width="86px" />
						<col width="*" />
						<col width="126px" />
					</colgroup>
					<tr>
						
						<th>작성자</th>
						<th>책 제목</th>
						<th>신청날짜</th>
					</tr>
					
 			
					<%for(Absence ab : list){ %>
					<% if(ab.getStatus().equals("Y") || ab.getStatus().equals("D")){ %>
					<tr>
						 <td><%=ab.getMember().getMemberId()%></td>
						<td>
							<a href="<%=request.getContextPath()%>/admin/absencelist?no=<%=ab.getAppNum()%>"><%=ab.getBookName()%></a>
							<%=ab.getStatus().equals("D")?"<span class='glyphicon glyphicon-ok'></span>":"" %>
						</td>
						<td><%=ab.getAppDate()%></td>	
									
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

		</div>





<%@include file="/views/common/adminfooter.jsp"%>