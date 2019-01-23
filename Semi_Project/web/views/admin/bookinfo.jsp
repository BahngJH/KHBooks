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
function update(){
	
	
}

</script>




<div class="col-sm-10">

	<h2>도서정보</h2>
	<hr />
	
	<form method="get" action="<%=request.getContextPath()%>/book/deleted">
		
		<input type="submit" value="삭제" id="deleted" onclick="deleted();" />
		<input type="button" value="수정" id="update" onclick="update();" />
		<input type="button" value="추가" id="update" onclick="" />
		
		<table class="table table-striped">
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


				<td><a href="#" class="thumbnail"><img src="<%=request.getContextPath()%>/images/book/<%=b.getBookImage()%>" alt="도서사진"></a></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getPublisher()%></td>
				<td><%=b.getGenre()%></td>
				<td><%=b.getBookId()%></td>
				<td><%=b.getIsbn()%></td>
				<td><%=b.getBookDate()%></td>
				<td><input type="checkbox" name="delete" value="<%=b.getBookId()%>"/></td>


			</tr>
			<%} %>

		</table>
	</form>
	<div class="text-center">
		<%=pageBar1 %>
	</div>
</div>
</div>
</div>
<%@include file="/views/common/footer.jsp"%>