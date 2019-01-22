<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.member.model.vo.*,java.util.*" %>
    <%
    	List<Member> list=(List)request.getAttribute("list");
    String pageBar=(String)request.getAttribute("pageBar");
    %>
<%@ include file="/views/common/adminheader.jsp"%>



<style>
.col-sm-10 table{
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
 		
</style>




<div class="col-sm-10">
  			
  				<h2>도서정보</h2>
				<hr/>
				<br/>
		<table class="table table-striped">
					<colgroup>
						<col width="86px" />
						<col width="*" />
						<col width="126px" />
					</colgroup>
					<tr>
						<th>이름</th>
						<th>ID</th>
						<th>번호</th>
						<th>주소</th>
						<th>생년월일</th>
						<th>성별</th>
						<th>phone</th>
						<th>email</th>
						<th>가입일</th>
						<th>마일리지</th>
						
					</tr>
					<%for(Member m : list) {%>
					<tr>
						
						<td><%=m.getMemberName()%></td>
						<td><%=m.getMemberId()%></td>
						<td><%=m.getMemberNum()%></td>
						<td><%=m.getAddress()%></td>
						<td><%=m.getBirth()%></td>
						<td><%=m.getGender()%></td>
						<td><%=m.getPhone()%></td>
						<td><%=m.getEmail() %></td>
						<td><%=m.getEnrollDate() %></td>
						<td><%=m.getMileage() %></td>
					
						
					</tr>
					<%} %>

	</table>
		<div class="text-center">
					<%=pageBar %>
				</div>
		</div>
		</div>
<%@include file="/views/common/footer.jsp"%>