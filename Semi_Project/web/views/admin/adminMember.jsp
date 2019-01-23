<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.*,java.util.*"%>
<%
	List<Member> list = (List) request.getAttribute("list");
	String pageBar = (String) request.getAttribute("pageBar");
%>
<%@ include file="/views/common/adminheader.jsp"%>



<style>
.col-sm-10 table {
	cellspacing: 0;
	cellpadding: 0;
	border: 0px;
}

table th {
	border-bottom: 1px solid skyblue;
	padding: 8px 10px;
	text-align: center;
}

table td {
	text-align: center;
}

input[type=checkbox] {
	/* 체크박스 크기키움 */
	-webkit-transform: scale(1.3);
}
div#buyList-options{margin-top: 50px; display: inline;}
</style>





		<div class="col-sm-10">
		
			<h2>회원정보</h2>
		<hr />
			<div id="buyList-options">
				<div class="input-group">
					<form class="form-controll navbar-right" role="search"
						action="<%=request.getContextPath()%>/order/orderSearch"
						method="get">
						<div class="form-group">
							<div class="input-group">
								<input type="text" class="form-control" name="keyword"
									id="keyword" autocomplete="off" placeholder="책 또는 저자명"> <span
									class="input-group-btn">
									<button type="submit" class="btn btn-default" id="searchBar">검색</button>
								</span>
							</div>
						</div>
					</form>
				</div>
			</div>
		
		<br />
		<table class="table table-striped">
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>주소</th>
				<th>phone</th>
				<th>email</th>
				<th>선택</th>
			</tr>
			<%
					for (Member m : list) {
				%>
			<tr>
				<td><%=m.getMemberId()%></td>
				<td><%=m.getMemberName()%></td>
				<td><%=m.getAddress()%></td>
				<td><%=m.getPhone()%></td>
				<td><%=m.getEmail()%></td>
				<td><input type="checkbox"></td>
			</tr>
			<script>
					
				</script>
			<%
					}
				%>

		</table>
		<div class="text-center">
			<%=pageBar%>

<div class="col-sm-10">
  			
  				<h2>회원정보</h2>
				<hr/>
				<br/>
		<table class="table table-striped">
					<colgroup>
						<col width="86px" />
						<col width="*" />
						<col width="126px" />
					</colgroup>
					<tr>
						<th>선택</th>
						<th>ID</th>
						<th>이름</th>
						<th>주소</th>						
						<th>phone</th>
						<th>email</th>
						
						
					</tr>
					<%for(Member m : list) {%>
					<tr>
						<td><input type="checkbox"></td>
						<td><%=m.getMemberId()%></td>
						<td><%=m.getMemberName()%></td>
						<td><%=m.getAddress()%></td>					
						<td><%=m.getPhone()%></td>
						<td><%=m.getEmail() %></td>
					
					
						
					</tr>
					<%} %>

		</table>
		<div class="text-center">

			<%=pageBar %>
		</div>
	</div>
</div>
</div>
<%@include file="/views/common/footer.jsp"%>