<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.book.model.vo.*,java.util.*" %>
    <%
    	List<Book> list=(List)request.getAttribute("list");
    %>
<%@ include file="/views/common/adminheader.jsp"%>



<style>
 table  div.tbl td image{
width: 10px;
height:10px;		
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
						<th>표지</th>
						<th>책 제목</th>
						<th>가격</th>
						<th>출판사</th>
						<th>장르</th>
						<th>책번호</th>
						<th>ISBN</th>
						<th>출간일</th>
						
						
					</tr>
					<%for(Book b : list) {%>
					<tr>
						<div class="tbl">
						<td><image src="<%=request.getContextPath()%>/images/book/<%=b.getBookImage()%>"></td>
						</div>
						<td><%=b.getBookName()%></td>
						<td><%=b.getPrice()%></td>
						<td><%=b.getPublisher()%></td>
						<td><%=b.getGenre()%></td>
						<td><%=b.getBookId()%></td>
						<td><%=b.getIsbn()%></td>
						<td><%=b.getBookDate()%></td>
						
						
					</tr>
					<%} %>

	</table>
		</div>
		</div>
<%@include file="/views/common/footer.jsp"%>