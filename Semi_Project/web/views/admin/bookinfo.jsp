<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.book.model.vo.*,java.util.*" %>
    <%
    	List<Book> list=(List)request.getAttribute("list");
    String pageBar1=(String)request.getAttribute("pageBar");
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

padding: 8px 10px;

 text-align:center;
 }
 table td{ text-align:center;}
 table#bookname{cursor: pointer;}		
 input[value='삭제'],input[value='수정'],input[value='추가'] {
	background-color: skyblue;
	border: none;
	color: white;
	padding: 8px 20px;
	margin:10px 0px 10px 10px;
	text-decoration: none;
	float: right;
	cursor: pointer;
}
</style>

<script>
function updateReview() {
	$('.modal').modal();
	
											
	
	
}	

function del(){
	if(!confirm("정말 삭제하시겠습니까?")){
		return;
	}
	
	var check=document.getElementsByName("delete");
	var checkarr=[];
	
	for(var i=0;i<check.length;i++){
		if(check[i].checked){
			checkarr.push(check[i].value);		
		}
		
	}
	if(checkarr.length<1){
		alert("도서를 선택해주세요");
		return;
	}
	location.href="<%=request.getContextPath()%>/book/deleted?del="+checkarr;
}


</script>




<div class="col-sm-10">

	<h2>도서정보</h2>
	<hr />

	

		<input type="button" value="삭제" name="deleted" id="deleted" onclick="del();" />
		
		


		
		<input type="button" value="추가" id="update" onclick="appendBook();" />

		<table class="table table-hover">
			<colgroup>
				<col width="86px" />
				<col width="*" />
				<col width="126px" />
			</colgroup>

			<tr>
				<th>표지</th>
				<th>책 제목</th>
				<th>가격</th>
				<th>출판사</th>
				<th>장르</th>
				<th>책번호</th>
				<th>ISBN</th>
				<th>출간일</th>
				<th>선택</th>

			</tr>
			<%for(Book b : list) {%>
			<tr>


				<td><a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=b.getBookId()%>" class="thumbnail"><img src="<%=request.getContextPath()%>/images/book/<%=b.getBookImage()%>" alt="도서사진"></a></td>
				<td id="bookname" onclick="updateReview()"><%=b.getBookName()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getPublisher()%></td>
				<td><%=b.getGenre()%></td>
				<td><%=b.getBookId()%></td>
				<td><%=b.getIsbn()%></td>
				<td><%=b.getBookDate()%></td>
				<td><input type="checkbox" name="delete"
					value="<%=b.getBookId()%>" /></td>


			</tr>
			<%} %>

		</table>
	
	<div class="text-center">
		<%=pageBar1%>
	</div>
</div>
</div>
</div>
<!-- 리뷰 수정 모달창 -->
		<div class="modal" id="updateModal" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						책 정보 수정
					</div>
					<div class="modal-body">
						<table class="tbl-modal">
							<tr>
				       			<th>표지</th>
				       		</tr>
				       		<tr>
								<th>책 제목</th>
							</tr>
							<tr>
								<th>가격</th>
							</tr>
							<tr>
								<th>출판사</th>
							</tr>
							<tr>
								<th>장르</th>
							</tr>
							<tr>
								<th>책번호</th>
							</tr>
							<tr>
								<th>ISBN</th>
							</tr>
							<tr>
								<th>출간일</th>
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

<script>
	function appendBook(){
		location.href="<%=request.getContextPath()%>/admin/bookappend";
	}
</script>

<%@include file="/views/common/footer.jsp"%>