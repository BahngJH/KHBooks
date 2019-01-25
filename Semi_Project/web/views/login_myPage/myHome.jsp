<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.member.model.vo.Member"%>
<%@ include file="/views/common/myHeader.jsp"%>
<%@ page import="java.util.*, com.kh.order.model.vo.Order, com.kh.review.model.vo.Review, com.kh.csCenter.model.vo.Qna" %>
<%
	String flag = (String)request.getAttribute("flag");
	if(flag == null){
		response.sendRedirect(request.getContextPath()+"/member/login");
		return;
	}
	List<Order> orderList = (List)request.getAttribute("orderList");
	boolean oStatus = (boolean)request.getAttribute("oStatus");
	List<Review> reviewList = (List)request.getAttribute("reviewList");
	boolean rStatus = (boolean)request.getAttribute("rStatus");
	List<Qna> qnaList = (List)request.getAttribute("qnaList");
	boolean qStatus = (boolean)request.getAttribute("qStatus");
	
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
	    vertical-align: middle;
	    border-bottom: 1px solid #ccc;
	    background: #f3f6f7;
	    text-align: center;
	    width: 20%
	}

	div.userInfo table.tbl-userInfo td {
		width: 30%;
	    padding: 10px;
	    vertical-align: middle;
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
	article.review-container{
		margin-top: 40px;
	}
	article.qna-container{
		margin-top: 40px;
	}	
	div#buy-Title {
		width: 100%;
		min-height: 40px;
		margin-top: 20px;
	}
	div#review-Title {
		width: 100%;
		min-height: 40px;
		margin-top: 20px;
	}
	div#qna-Title {
		width: 100%;
		min-height: 40px;
		margin-top: 20px;
	}

	article.buy-container h4{display: inline; float: left; width: 40%;}
	article.buy-container a#btn-buyListAll{display: inline; float: right;}
	article.review-container h4{display: inline; float: left; width: 40%;}
	article.review-container a#btn-reviewListAll{display: inline; float: right;}
	article.qna-container h4{display: inline; float: left; width: 40%;}
	article.qna-container a#btn-qnaListAll{display: inline; float: right;}
	
	div#orderImg{
		width: 100px;
		height: 100px;
	}
	#bookImg{
		width: 100px;
		height: 90px;
	}
	
	table th, table td{
		text-align: center;
		vertical-align: middle;
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
								<td><%=logined.getPhone()%></td>
								<th>이메일</th>
								<td><%=logined.getEmail() %></td>
							</tr>
							<tr>
								<th>주소</th>
								<td colspan='3'><%=logined.getAddress() %></td>
							</tr>
						</table>
					</div>
				</article>
														
				<article class="qna-container">
					<div id="qna-title">
						<h4>1:1 문의 내역</h4>
						<a href="<%=request.getContextPath()%>/qna/qnaListMain" class="btn btn-primary" id="btn-qnaListAll">전체 보기</a>
					</div>
					<table class="table table-stripe" id="tbl-qnaList">
						<colgroup>
							<col width="70%" />
							<col width="10%" />
							<col width="20%" />
						</colgroup>
						<tr>
							<th scope="col">제목</th>
							<th scope="col">답변 여부</th>
							<th scope="col">작성일</th>								
						</tr>				
			
						<tbody>
							<%for(int i = 0; i < 3; i++) {%>
								<%if(qStatus) { %>
							<tr>						
								<td><%=qnaList.get(i).getQnaTitle()%></td>
								<td><%=qnaList.get(i).getReCheck()%></td>
								<td><%=qnaList.get(i).getQnaDate()%></td>
							</tr>	
								<%} else {%>	
									<tr>
										<td colspan='5'>최근 문의 내역이 없습니다.</td>
									</tr>																									
							<% break;}
							}%>					
						</tbody>	
					</table>
				</article>				
				
				<article class="buy-container">
					<div id="buy-title">
						<h4>최근 구매 목록</h4>
						<a href="<%=request.getContextPath()%>/member/orderList" class="btn btn-primary" id="btn-buyListAll">전체 보기</a>
					</div>
								
						<table class="table  table-stripe" id="tbl-orderList">
							<tr>
								<th colspan='2' scope="col">도서 정보</th>
								<th scope="col">구매일</th>
								<th scope="col">수량</th>
								<th scope="col">결제 금액</th>
							</tr>
							
							<tbody>							
								<%for(int i = 0; i < 3; i++) {%>
									<%if(oStatus) { %>
										<tr>
											<!-- 책 이미지 -->
											<td>
												<div id="orderImg">
													<a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=orderList.get(i).getBookId()%>" class="thumbnail">
														<img id="bookImg" src="<%=request.getContextPath()%>/images/book/<%=orderList.get(i).getBook().getBookImage()%>" alt="도서사진">
													</a>
												</div>																					
											</td>
											<!-- 제목, 저자, 가격 -->                        		                            	
											<td style="text-align: left;">
			                                	<h5 class='book_info'>
		    	                                <a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=orderList.get(i).getBookId()%>">
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
				
				
				<article class="review-container">
					<div id="review-title">
						<h4>나의 리뷰 목록</h4>
						<a href="<%=request.getContextPath()%>/member/review" class="btn btn-primary" id="btn-reviewListAll">전체 보기</a>
					</div>				
					
					<table class="table table-stripe" id="tbl-reviewList">
						<colgroup>
							<col width="20%" />
							<col width="40%" />
							<col width="20%" />
							<col width="20%" />
						</colgroup>
						<tr>
							<th scope="col">도서 정보</th>
							<th colspan='2' scope="col">리뷰 내용</th>
							<th scope="col">별점</th>
							<th scope="col">작성일</th>
						</tr>							
						
						<tbody>
							<%for(int i = 0; (i < reviewList.size())&& (i < 3); i++) {%>
								<%if(rStatus) { %>
							<tr>
								<td><a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=reviewList.get(i).getBookId()%>"><%=reviewList.get(i).getBook().getBookName()%></a></td>
								<td colspan='2'><%=reviewList.get(i).getReviewContext()%></td>								
								<td>
									<%for(int j = 0; j < 5; j++) {%>
										<%if(j < reviewList.get(i).getGrade()) { %>
											<span style="color: red;" class="glyphicon glyphicon-star" aria-hidden="true"></span> 
										<%} else { %>
											<span style="color: #ccc;" class="glyphicon glyphicon-star" aria-hidden="true"></span>
										<%}
									}%>									
								</td>
								<td><%=reviewList.get(i).getWriteDate()%></td>
							</tr>
								<%} else {%>	
									<tr>
										<td colspan='5'>남긴 리뷰가 없습니다.</td>
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