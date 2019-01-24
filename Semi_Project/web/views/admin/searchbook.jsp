<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.book.model.vo.*,java.util.*" %>
    <%
    	List<Book> list=(List)request.getAttribute("list");

    %>
<%@ include file="/views/common/adminheader.jsp"%>



<style>
.col-sm-10 table{
cellspacing:0;
 cellpadding:0;
 border:0px;
 }

table.table th{
 border-bottom:1px solid skyblue;

padding: 8px 10px;

 text-align:center;
 }
 table td{ text-align:center;}
 table#bookname{cursor: pointer;}		
 input[value='삭제'],input[value='수정'],input[value='추가'],.modal-footer button {
	background-color: skyblue;
	border: none;
	color: white;
	padding: 8px 20px;
	margin:10px 0px 10px 10px;
	text-decoration: none;
	float: right;
	cursor: pointer;
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
	<div id="buyList-options">
				<div class="input-group">
					<form class="form-controll" role="search" action="<%=request.getContextPath()%>/admin/searchbook"
						method="get">
						<div class="form-group">
							<div class="input-group">
								<input type="text" class="form-control" name="keyword"
									id="keyword" autocomplete="off" placeholder="책제목 입력"> <span
									class="input-group-btn">
									<button type="submit" class="btn btn-default" id="searchBar">검색</button>
								</span>
							</div>
						</div>
					</form>
				</div>
	

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
				<th>ISBN</th>
				<th>출간일</th>
				<th>선택</th>

			</tr>
			<%for(Book b : list) {%>
			<tr>


				<td><a href="<%=request.getContextPath()%>/inforconpare_hwang/infoView?bookId=<%=b.getBookId()%>" class="thumbnail"><img src="<%=request.getContextPath()%>/images/book/<%=b.getBookImage()%>" alt="도서사진"></a></td>
				<td class="updatebook<%=b.getBookId()%>"><%=b.getBookName()%></td>
				<td class="updatebook<%=b.getBookId()%>"><%=b.getPrice()%></td>
				<td class="updatebook<%=b.getBookId()%>"><%=b.getPublisher()%></td>
				<td class="updatebook<%=b.getBookId()%>"><%=b.getGenre()%></td>
				<td class="updatebook<%=b.getBookId()%>"><%=b.getIsbn()%></td>
				<td class="updatebook<%=b.getBookId()%>"><%=b.getBookDate()%></td>
				<td><input type="checkbox" name="delete" value="<%=b.getBookId()%>"/></td>
				

			</tr>
			
			
			<script>
		  			$('.updatebook<%=b.getBookId()%>').click(function() {
		  				$('.modal').modal();
		  				$('#updatename').val("<%=b.getBookName()%>");
		  				$('#updateprice').val("<%=b.getPrice()%>");
		  				$('#updatepublisher').val("<%=b.getPublisher()%>");
		  				$('#updategenre').val("<%=b.getGenre()%>");
		  				$('#updateisbn').val("<%=b.getIsbn()%>");
		  				$('#bookedit').val("<%=b.getEditor()%>");
		  				$('#bookstock').val("<%=b.getStock()%>");
		  				$('#bookcontent').val("<%=b.getBookContent()%>");	
		  				$('#booknum').val("<%=b.getBookId()%>");
		  			
		  			});
		  			
		  	</script>
			<%} %>

		</table>
	
	
</div>
</div>
</div>
<!-- 리뷰 수정 모달창 -->

<style>
table.tbl-modal tr th{text-align:center;}

</style>
		<div class="modal" id="updateModal" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						책 정보 수정
					</div>
					<div class="modal-body">
					<form method="post" action="<%=request.getContextPath()%>/book/updatebook" name="fr" class="frm">
						<table class="tbl-modal">
				       		<tr>
								<th>책 제목</th>
								<td><input type="text" id="updatename"class="form-control" name="updatename" value=""/></td>
							</tr>
							<tr>
								<th>가격</th>
								<td><input type="text" id="updateprice" class="form-control" name="updateprice" value=""/></td>
							</tr>
							<tr>
								<th>출판사</th>
								<td><input type="text" id="updatepublisher" class="form-control" name="updatepublisher" value=""/></td>
							</tr>
							<tr>
								<th>장르</th>
								<td><input type="text" id="updategenre" class="form-control"  name="updategenre" value=""/></td>
							</tr>
						
							<tr>
								<th>ISBN</th>
								<td><input type="text" id="updateisbn" class="form-control" name="updateisbn" value=""/></td>
							</tr>
	       				   	 	<tr>
								<th>저자</th>
								<td><input type="text" id="bookedit" class="form-control" name="bookedit" value=""/></td>
							</tr>
	       				   <tr>
								<th>재고량</th>
								<td><input type="text" id="bookstock" class="form-control" name="bookstock" value=""/></td>
							</tr>
	       				   	<tr>
								<th>줄거리</th>
								<td><textarea id="bookcontent" class="form-control"  rows="8" cols="50"  name="updatecontent" value=""/></textarea></td>
	       				   	</tr>
	       				   	<tr>	
	       				   	<td><input id="booknum" type="hidden" name="bookId" value=""></td>
	       				   	
	       			
	       				   	
	       				   	</tr>
								
						</table>
						</form>
					</div>
					<div class="modal-footer">
						
						<button type="button" class="btn" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" onclick="updatebo();">수정</button>
					</div>
				</div>
			</div>
		</div>

<script>

	function updatebo(){
		$('.frm').submit();
	}
	function appendBook(){
		location.href="<%=request.getContextPath()%>/admin/bookappend";
	}
</script>

<%@include file="/views/common/footer.jsp"%>