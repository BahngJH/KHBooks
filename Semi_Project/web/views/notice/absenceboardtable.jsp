<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.*,com.kh.absence.model.vo.*, com.kh.member.model.vo.*" %>
	<%
		List<Absence> list=(List)request.getAttribute("list");
			String pageBar=(String)request.getAttribute("pageBar");
	%>
<%@ include file="/views/common/noticeHeader.jsp"%>


<style>

.col-sm-9 a{
	text-decoration:none;
	color: black;
	cursor: pointer;
}

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
 input[value='새등록']{
  background-color: skyblue;
  border: none;
  color: white;
  padding: 8px 20px;
  text-decoration: none;

  float:right;
  cursor: pointer;}
input[value='주문하기'] {
  background-color: skyblue;
  border: none;
  color: white;
  padding: 8px 20px;
  text-decoration: none;

  float:right;
  cursor: pointer;
}
</style>

<section>

<script>
function absence1(){
	location.href="<%=request.getContextPath()%>/notice/absence";
}
function absence(){
	alert("로그인후 이용해주세요");
	location.href="<%=request.getContextPath()%>/notice/absence";
}
</script>

			<div class="col-sm-1"></div>
			<div class="col-sm-9">
				<div class="notcecontent">
				<h2>부재도서 주문</h2>
				<br/>
				<article id="edit">
				
				<%if(logined!=null) {%>
					<input type="button" value="주문하기" onclick="absence1();"/>
					<%}else{ %>
					<input type="button" value="주문하기" onclick="absence();"/>
				<%} %>
				
				</article>
				
				
				
				
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
					
 			
					<%for(Absence ab : list){ %>
					<% if(ab.getStatus().equals("Y")){ %>
					<tr>
						 <td><%=ab.getMember().getMemberId()%></td>
						<td><a href="<%=request.getContextPath() %>/notice/absencecontent?no=<%=ab.getAppNum()%>"><%=ab.getBookName()%></a></td>
						<td><%=ab.getAppDate()%></td>					
					</tr> 
					<%} 
					}%>					
				</table>
				<div class="text-center">
					<%=pageBar %>
				</div>
			</div>
				
			

</section>
			</div>







<%@include file="/views/common/footer.jsp"%>