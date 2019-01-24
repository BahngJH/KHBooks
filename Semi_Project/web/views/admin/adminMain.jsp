<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.kh.absence.model.vo.*,com.kh.notice.model.vo.*" %>
<%@ include file="/views/common/adminheader.jsp"%>

<%
	List<Absence> list=(List)request.getAttribute("list");
	List<Notice> list1 =(List)request.getAttribute("list1");
%>
<style>

.col-sm-9 table{
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
 
 .col-sm-9 td{
 text-align:center;
 }
 a{color: black;}

</style>




  			<div class="col-sm-10">
  			
  				<h2>최근 부재도서 주문내역</h2>
				<hr/>
				<br/>
		<table class="table table-striped" style=text-align:center;>
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
						<td><a href="<%=request.getContextPath() %>/notice/absencecontent?no=<%=ab.getAppNum()%>"><%=ab.getBookName()%></a></td>
						<td><%=ab.getAppDate()%></td>	
									
					</tr> 
					 
					<%}
					}%>	
								
				</table>
				<br/>
				
				<h2>최근 공지사항내역</h2>
				<hr/>
				<br/>
					<table class="table table-striped" style=text-align:center;>
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
						<td><a href="<%=request.getContextPath() %>/notice/noticeContent?no=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a></td>
						<td><%=n.getNoticeDate()%></td>					
					</tr> 
					<%} 
					}%>	 				
				</table>
				
				

		</div>
		</div>
		</div>
		
	
	

<%@include file="/views/common/footer.jsp"%>