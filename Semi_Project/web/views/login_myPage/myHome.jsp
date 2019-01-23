<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.member.model.vo.Member"%>
<%@ include file="/views/common/myHeader.jsp"%>
<%@ page import="java.util.*, com.kh.order.model.vo.Order" %>
<%
	String flag = (String)request.getAttribute("flag");
	if(flag == null){
		response.sendRedirect(request.getContextPath()+"/member/login");
		return;
	}
	List<Order> orderList = (List)request.getAttribute("orderList");
	boolean status = (boolean)request.getAttribute("status");
%>


<style>
	article.myInfo-container{
		margin-top: 50px;
		border: 1px solid black;
		overflow: auto;
		height: 220px;
	}
	div.userInfo{
		height: 100%;
		background-color: white;
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
	div.myOrderBook{
		float: left;
		width: 150px;
		height: 100%;
	}	
	article.buy-container{
		margin-top: 40px;
	}
	div#buyTitle {
		width: 100%;
		min-height: 40px;
		margin-top: 20px;
	}
	div.buyList{
		overflow: hidden;
		width: 100%;
		height: 250px;
		border: 1px solid black;
	}
	article.buy-container h4{display: inline; float: left; width: 40%;}
	article.buy-container a#btn-buyListAll{display: inline; float: right;}
	div#orderImg{
		width: 100px;
		height: 100px;
	}
	#bookImg{
		width: 100px;
		height: 90px;
	}
</style>
		<div class="col-sm-10">
			<section>
				<article class="myInfo-container">						
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
				
				<article class="buy-container">
					<div id="buy-title">
						<h4>최근 구매 목록</h4>
						<a href="<%=request.getContextPath()%>/member/orderList" class="btn btn-primary" id="btn-buyListAll">전체 보기</a>
					</div>
					
						<table class="table  table-stripe" id="tbl-orderList">
							<thaed>
								<tr>
									<th id="t-info" colspan='2' scope="col">도서 정보</th>
									<th id="t-date" scope="col">구매일</th>
									<th id="t-count" scope="col">수량</th>
									<th id="t-price" scope="col">결제 금액</th>
								</tr>
							</thaed>
							<tbody>							
								<%for(int i = 0; i < 3; i++) {%>
									<%if(status) { %>
										<tr>
											<!-- 책 이미지 -->
											<td>
												<div id="orderImg">
													<a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=orderList.get(i).getBook().getBookId()%>" class="thumbnail">
														<img id="bookImg" src="<%=request.getContextPath()%>/images/book/<%=orderList.get(i).getBook().getBookImage()%>" alt="도서사진">
													</a>
												</div>																					
											</td>
											<!-- 제목, 저자, 가격 -->                        		                            	
											<td style="text-align: left;">
			                                	<h5 class='book_info'>
		    	                                <a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=orderList.get(i).getBook().getBookId()%>">
			                                    	<h5><strong><%=orderList.get(i).getBook().getBookName()%></strong></h5>
		                                    	</a>
			                                	</h5>
			                                	<h5><%=orderList.get(i).getBook().getAuthor().getAuthorName() %></h5>  
			                                	<h5 id="bookPrice"><%=orderList.get(i).getBook().getPrice() %>원</h5>       
											</td>
											<!-- 구매일 -->
											<td>
		                            			<p><%=orderList.get(i).getOrderDate() %></p>
											</td>
											<!-- 수량 -->
											<td>
			                            		<p><%=orderList.get(i).getBookCount()%></p>
											</td>
											<!-- 총 가격 -->
											<td>
												<p><%=orderList.get(i).getBook().getPrice() * orderList.get(i).getBookCount()%>원</p>
											</td>
										</tr>
									<%} else {%>	
										<tr>
											<td colspan='5'>구매 도서 정보가 없습니다.</td>
										</tr>																									
								<% break;}
								}%>
							</tbody>
						</table>

				</article>
			</section>				
		</div>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>