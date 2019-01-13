<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.member.model.vo.Member"%>
<%@ include file="/views/common/myHeader.jsp"%>


<style>
	article.myInfo-container{
		border: 1px solid black;
		overflow: hidden;
		height: 200px;
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
	    text-align: right;
	    width: 15%
	}

	div.userInfo table.tbl-userInfo td {
		width: 40%;
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	}
	
	article.buy-container{
		margin-top: 40px;
	}
	article.buy-container h4{display: inline; float: left; width: 40%;}
	article.buy-container a#btn-buyListAll{display: inline; float: right;}
</style>

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
							<tr>
								<th>가입일</th>
								<td colspan='3'><%=logined.getEnrollDate() %></td>
							</tr>
						</table>
					</div>
				</article>
				
				<article class="buy-container">
					<div id="buy-title"  style= 'width: 100%; min-height: 40px;'>
						<h4>구매 목록</h4>
						<a href="<%=request.getContextPath()%>/member/buyList" class="btn btn-primary" id="btn-buyListAll">전체 보기</a>
					</div>
					
					<div style= 'width: 100%; height: 250px; border: 1px solid black;'>
						
					</div>
				</article>
			</section>	
		</div>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>