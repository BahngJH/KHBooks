<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<style>
.col-sm-2 a {
   color: black;
   cursor: pointer;
   text-decoration: none;
}

.col-sm-2 a {
   color: black;
   cursor: pointer;
   text-decoration: none;
}

.col-sm-2 {
   margin: 120px 0 0 0;
}

/*  .col-sm-2 hr {
   border: 1px solid  darkgray;
}  */

.col-sm-2 h4 {
   color: black;
}
<style>
	article.myInfo-container{
		border: 1px solid black;
		overflow: auto;
		height: 220px;
	}
	div.accountInfo{
		width: 25%;
		height: 100%;
		background-color: white;	
		text-align: center;	
	}
	
	div.accountInfo h4 {
		margin-top: 30%;
  }
	
	div.userInfo{
		width: 75%;
		height: 100%;
		background-color: white;
	}
	div.accountInfo, div.userInfo{
		float: left;
	}
	div.userInfo table.tbl-userInfo {
		width: 100%;
		height: 100%;
		border-collapse: collapse;
	}
	div.userInfo table.tbl-userInfo th {
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    background: #f3f6f7;
	    text-align: center;
	    width: 20%
	}

	div.userInfo table.tbl-userInfo td {
		width: 30%;
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
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
  			<div class="col-sm-10">
			<section>
				<article class="myInfo-container">
					
					<div class="accountInfo">	
						<h4><span><%=logined.getMemberName() %></span> 님</h4>
						<h6>환영합니다</h6>
					</div>
						
					<div class="userInfo">
						<table class="tbl-userInfo table-bordered">
							<tr>	
								<th>아이디</th>
								<td><%=logined.getMemberId()%></td>
								<th>마일리지</th>
								<td><%=logined.getMileage() %></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><%=logined.getMemberName()%></td>
								<th>가입날짜</th>
								<td><%=logined.getEnrollDate() %></td>
							</tr>
							<tr>
								<th>phone</th>
								<td colspan='3'><%=logined.getPhone()%></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td colspan='3'><%=logined.getEmail() %></td>
							</tr>
							<tr>
								<th>주소</th>
								<td colspan='3'><%=logined.getAddress() %></td>
							</tr>
						</table>
					</div>
				</article>


		</div>
		</section>	
	</div>

<%@include file="/views/common/footer.jsp"%>