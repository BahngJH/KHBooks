<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.book.model.vo.*,java.util.*" %>
    <%
		List<Book> list=(List)request.getAttribute("list");
    %>
    
<div class="modal fade">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">도서정보수정</h4>
      </div>
      <div class="modal-body">
       		<table class="table table-striped">
       			<tr>
	       			<th>표지</th>
					<th>책 제목</th>
					<th>가격</th>
					<th>출판사</th>
					<th>장르</th>
					<th>책번호</th>
					<th>ISBN</th>
					<th>출간일</th>
       			</tr>
       			<tr>
       		<%-- 			<td><a href="#" class="thumbnail"><img
						src="<%=request.getContextPath()%>/images/book/<%=b.getBookImage()%>"
						alt="도서사진"></a></td>
						<td><input type="text" name="name" value="<%=b.getBookName()%>" required="required"></td>
						<td><input type="text" name="price" value="<%=b.getPrice()%>" required="required"></td>
						<td><input type="text" name="publisher" value="<%=b.getPublisher()%>" required="required"></td>
						<td><input type="text" name="genre" value="<%=b.getGenre()%>" required="required"></td>
						<td><input type="text" name="bookid" value="<%=b.getBookId()%>" readonly="readonly"></td>
						<td><input type="text" name="isbn" value="<%=b.getIsbn()%>" required="required"></td>
						<td><input type="text" name="date" value="<%=b.getBookDate()%>" readonly="readonly"></td> --%>
       			<tr/>
       		</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<%@include file="/views/common/footer.jsp"%>