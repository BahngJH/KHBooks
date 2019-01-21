<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/myHeader.jsp"%>
<%@ page import="java.util.*, com.kh.order.model.vo.Order, com.kh.book.model.vo.Book, com.kh.author.model.vo.Author" %>
<%
	List<Order> list = (List)request.getAttribute("searchList");
%>

<style>
	div#buyList-options div.input-group{float: left;}
	div.btn-group{float: right;}	
	table#tbl-orderList{
		margin-top: 65px;
		border-collapse: collapse;
	}
	table#tbl-orderList th, table#tbl-orderList td{
		vertical-align: middle;
		text-align: center;
	}
	table#tbl-orderList td div#bookImg{
		width: 120px;
		min-height: 150px;
		margin-top: 10px;
	}
</style>


		<div class="col-sm-10">
			<section>
				<article class="buyList-container">
					<div id="buyList-title">
						<h3>구매 목록</h3>
					</div>
					<div id="buyList-options">
						<div class="input-group">
							<form class="form-controll navbar-right" role="search" action="<%=request.getContextPath()%>/order/orderSearch" method="get">
				                <div class="form-group">
				                    <div class="input-group">
				                        <input type="text" class="form-control" name="keyword" id="keyword" autocomplete="off" placeholder="책 또는 저자명">
				                        <span class="input-group-btn">
				                            <button type="submit" class="btn btn-default" id="searchBar">검색</button>
				                        </span>
				                    </div>
				                </div>
				            </form>
						</div>
						
						
						<div class="btn-group">
							<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">최근 구매순 <span class="caret"></span></button>
							<ul class="dropdown-menu" role="menu">
							    <li><a href="#">최근 구매순</a></li>
							    <li><a href="#">제목순</a></li>
							    <li><a href="#">저자순</a></li>
						 	</ul>
						</div>
					</div>	
					
					<table class="table table-responsive" id="tbl-orderList">
						<thaed>
							<tr>
								<th id="t-info" colspan='2' scope="col">도서 정보</th>
								<th id="t-date" scope="col">구매일</th>
								<th id="t-count" scope="col">수량</th>
								<th id="t-price" scope="col">결제 금액</th>
							</tr>
						</thaed>
						<tbody>							
							<%for(Order o : list) {%>
								<%if(o.getStatus().equals("Y") || o.getStatus().equals("y")) { %>
									<tr>
										<!-- 책 이미지 -->
										<td>
											<div id="bookImg">
		                                		<a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=o.getBook().getBookId()%>" class="thumbnail">
		                                    		<img src="<%=request.getContextPath() %>/images/book/<%=o.getBook().getBookImage() %>"alt="책 이미지">
		                                		</a>
	                                		</div>
										</td>
										<!-- 제목, 저자, 가격 -->                        		                            	
										<td style="text-align: left;">
		                                	<h4 class='book_info'>
	    	                                <a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=o.getBook().getBookId()%>">
		                                    	<h3><strong><%=o.getBook().getBookName()%></strong></h3>
	                                    	</a>
		                                	</h4>
		                                	<h5><%=o.getBook().getAuthor().getAuthorName() %></h5>  
		                                	<h4 id="bookPrice"><%=o.getBook().getPrice() %>원</h4>       
										</td>
										<!-- 구매일 -->
										<td>
	                            			<p><%=o.getOrderDate() %></p>
										</td>
										<!-- 수량 -->
										<td>
		                            		<p><%=o.getBookCount()%></p>
										</td>
										<!-- 총 가격 -->
										<td>
											<h3><%=o.getBook().getPrice() * o.getBookCount()%></h3>
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
		
		<script>
		</script>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>