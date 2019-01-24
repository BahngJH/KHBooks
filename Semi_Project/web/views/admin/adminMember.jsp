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
	
	table#memberInfo th {
		border-bottom: 1px solid skyblue;
		padding: 8px 10px;
		text-align: center;
	}
	
	table#memberInfo td {
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
		<table id="memberInfo" class="table table-hover">
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
					<td class="info<%=m.getMemberNum()%>"><%=m.getMemberId()%></td>
					<td class="info<%=m.getMemberNum()%>"><%=m.getMemberName()%></td>
					<td class="info<%=m.getMemberNum()%>"><%=m.getAddress()%></td>
					<td class="info<%=m.getMemberNum()%>"><%=m.getPhone()%></td>
					<td class="info<%=m.getMemberNum()%>"><%=m.getEmail()%></td>
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
					
					
					$('.info<%=m.getMemberNum()%>').click(function(){
						$('.modal').modal();
						$('#moId').val('<%=m.getMemberId()%>');
						$('#moName').val('<%=m.getMemberName()%>');
						$('#moAddr').val('<%=m.getAddress()%>');
						$('#moPhone').val('<%=m.getPhone()%>');
						$('#moEmail').val('<%=m.getEmail()%>');
						$('#moMileage').val('<%=m.getMileage()%>');
						$('#moEnrollDate').val('<%=m.getEnrollDate()%>');
					});
						
					
				</script>
			<%}%>

		</table>
		<div class="text-center">
			<%=pageBar%>
		</div>
	</div>
	
	
	
	
	
		<!-- 리뷰 수정 모달창 -->
		<div class="modal" id="memberModal" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						회원 상세 정보
					</div>
					<div class="modal-body">
						<table class="tbl-modal">

								<tr>
									<th>ID</th>
									<td>
										<input type="text" class="form-control" name="moId" id="moId" value=""/>
									</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>
										<input type="text" class="form-control" name="moName" id="moName" value=""	/>
									</td>									
								</tr>
								<tr>
									<th>마일리지</th>
									<td>
										<input type="text" class="form-control" name="moMileage" id="moMileage" value=""/>
									</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>
										<textarea rows="3" class="form-control" name="moAddr" id="moAddr" value=""></textarea>
									</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td>
										<input type="text" class="form-control" name="moPhone" id="moPhone" value=""/>
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
										<input type="text" class="form-control" name="moEmail" id="moEmail" value=""/>
									</td>
								</tr>
								<tr>
									<th>가입날짜</th>
									<td>
										<input type="text" class="form-control" name="moEnrollDate" id="moEnrollDate" value=""/>
									</td>
								</tr>

						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="updateRe();">수정</button>
						<button type="button" class="btn" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 여기 까지 리뷰 수정 모달 -->	
	
		<!-- 모달 스타일 -->
		<style>
			.tbl-modal{
				border-collapse: separate;
				border-spacing: 5px 10px;
				padding: 8px;	
				width: 580px;		
			}
			
			.tbl-modal th{
				width: 15%;
			}
			.tbl-modal td{
				width: 85%;
			}
			.modal {
		        text-align: center;
			}
 
			@media screen and (min-width: 768px) { 
       			.modal:before {
	                display: inline-block;
	                vertical-align: middle;
	                content: " ";
	                height: 100%;
	    	    }
			}	
 
			.modal-dialog {
		        display: inline-block;
		        text-align: left;
		        vertical-align: middle;
			}
		
			div.modal-content{
				width: 100%;
				height: 100%;
			}
			
			div.modal-body{
				width: 300px;
				height: 380px;
			}
			textarea#updateContext{
				resize: none;
			}
		</style>	
	
	
</div>
<%@include file="/views/common/footer.jsp"%>