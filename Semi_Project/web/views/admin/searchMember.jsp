<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.*,java.util.*"%>
<%
	List<Member> list = (List) request.getAttribute("list");
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
	
	div#buyList-options {
		margin-top: 50px;
		display: inline;
	}
	
	div.input-group {
		float: left;
	}
	
	div.btn-group {
		float: right;
	}
	
	div.btn-group button {
		background-color: skyblue;
		border: none;
		color: white;
		padding: 8px 20px;
		margin: 10px 0px 10px 10px;
		text-decoration: none;
		float: right;
		cursor: pointer;
	}
</style>


	<div class="col-sm-10">
			<h2>회원정보</h2>
			<hr />
			<div id="buyList-options">
				<div class="input-group">
					<form class="form-controll" role="search"
						action="<%=request.getContextPath()%>/admin/searchMember"
						method="get">
						<div class="form-group">
							<div class="input-group">
								<input type="text" class="form-control" name="keyword"
									id="keyword" autocomplete="off" placeholder="ID 또는 이름 입력"> <span
									class="input-group-btn">
									<button type="submit" class="btn btn-default" id="searchBar">검색</button>
								</span>
							</div>
						</div>
					</form>
				</div>
				
					
				<div class="btn-group">
					<button type="button" id="deleteMember" onclick="fn_deleteMember();">삭제</button>
				</div>
			</div>
		<br />
		<table class="table table-hover">
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>주소</th>
				<th>phone</th>
				<th>email</th>
				<th>선택</th>
			</tr>
					
			<%for (Member m : list) { %>
				<tr>
					<td><%=m.getMemberId()%></td>
					<td><%=m.getMemberName()%></td>
					<td><%=m.getAddress()%></td>
					<td><%=m.getPhone()%></td>
					<td><%=m.getEmail()%></td>
					<td><input type="checkbox" name="check" value="<%=m.getMemberNum()%>"></td>
				</tr>
				
				<script>
					
					
					function fn_deleteMember() {	
						if(!confirm("정말 삭제하시겠습니까?")){
							return;
						}	
						var chkbox = document.getElementsByName("check");
						var checked = [];
						for(var i=0; i<chkbox.length; i++) {
							if(chkbox[i].checked){
								checked.push(chkbox[i].value);		/* 체크된 회원들을 배열에 담는다 */											
							}
						}			
						
						if(checked.length < 1) {
							alert("선택한 회원이 없습니다.");
							return;
						}

						/* 체크된 값을 배열에 담아 서블릿으로 전송 */
						location.href="<%=request.getContextPath()%>/admin/deleteMember?nums="+checked;	
					}
				</script>
			<%}%>

		</table>
	</div>	
</div>
<%@include file="/views/common/adminfooter.jsp"%>