<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.kh.absence.model.vo.*,com.kh.notice.model.vo.*" %>
<%@ include file="/views/common/header.jsp"%>

<%
	List<Absence> list=(List)request.getAttribute("list");
	List<Notice> list1 =(List)request.getAttribute("list1");
%>
<style>

.col-sm-2 a {
   color: black;
   cursor: pointer;
   text-decoration: none;
}

.col-sm-2 {
   margin: 80px 0 0 0;
}

/*  .col-sm-2 hr {
   border: 1px solid  darkgray;
}  */

.col-sm-2 h4 {
   color: black;
}

</style>



<div class="container">
   <div class="col-sm-2">

      <h4>
          <span class="glyphicon glyphicon-home" aria-hidden="true"></span> <strong>관리자 페이지</strong>
      </h4>
      <hr/>
    	<a href=""><strong>도서정보</strong></a>
      <hr/>
      <a href=""><strong>회원정보</strong></a>
      <hr/>
		
	  <a herf=""><strong>도서신청 목록</strong></a>
	  <hr/>
      <a href="#"><strong>1대1문의내역</strong></a>
      <hr/>
      </div>
      
  			<div class="col-sm-9">
  			
  				<h2>최근 부재도서 주문내역</h2>
				<hr/>
				<br/>
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
					
 			
						<%for(Absence ab : list){%>
					<% if(ab.getStatus().equals("Y")){ %>
						
					<tr>
						 <td><%=ab.getMember().getMemberId()%></td>  
						<td><%=ab.getBookName()%></td>
						<td><%=ab.getAppDate()%></td>	
									
					</tr> 
					 
					<%}
					}%>	
								
				</table>
				<br/>
				<hr/>
				<h2>최근 공지사항내역</h2>
				<hr/>
				<br/>
					<table class="table table-striped">
					<colgroup>
						<col width="86px" />
						<col width="*" />
						<col width="126px" />
					</colgroup>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>날짜</th>
					</tr>
					
			
					<%for(Notice n : list1){ %>
					<% if(n.getStatus().equals("Y")){ %>
					<tr>
						<td><%=n.getNoticeNo() %></td>
						<td>><%=n.getNoticeTitle()%></td>
						<td><%=n.getNoticeDate()%></td>					
					</tr> 
					<%} 
					}%>	 				
				</table>
				
				

		</div>
		</div>
		
	
	

<%@include file="/views/common/footer.jsp"%>