<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/myHeader.jsp"%>
<%@ page import="java.util.*, com.kh.order.model.vo.Order, com.kh.book.model.vo.Book, com.kh.author.model.vo.Author" %>
<%
	List<Order> list = (List)request.getAttribute("list");
%>

<style>
	div#buyList-options div.input-group{float: left;}
	div.btn-group{float: right;}
	div.bookInfo #bookPrice {
		margin-top: 55px;
	}
	div.orderDate, div.orderCount, div.finalPrice {
		margin: 60px 0px;
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
					<hr style='margin-top: 60px; border: 1px solid lightgray;'/>							
					
					
					<%if(!list.isEmpty()) {%>					
						<%for(Order o : list) {%>
							<%if(o.getStatus().equals("Y") || o.getStatus().equals("y")) { %>
								<div class="buyList row">
					          		<!-- 책 이미지 -->
	          						<div class='result-image col-xs-3 col-sm-2 col-md-2 col-lg-2'>
	                                	<a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=o.getBook().getBookId()%>" class="thumbnail">
	                                    	<img src="<%=request.getContextPath() %>/images/book/<%=o.getBook().getBookImage() %>"alt="책 이미지">
	                                	</a>
	                            	</div>
	    							<!-- 제목, 저자, 가격 -->                        	
	                            	<div class='bookInfo result-image col-xs-3 col-sm-4 col-md-4 col-lg-4'>
		                                <h4 class='book_info'>
	    	                                <a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=o.getBook().getBookId()%>">
		                                        <h3><strong><%=o.getBook().getBookName()%></strong></h3>
	                                    	</a>
	                                	</h4>
	                                	<h5><%=o.getBook().getAuthor().getAuthorName() %></h5>  
	                                	<h4 id="bookPrice"><%=o.getBook().getPrice() %>원</h4>                              
	                            	</div>
	                            	<!-- 구매일 -->
	                            	<div class="orderDate col-xs-2 col-sm-2 col-md-2 col-lg-2">
	                            		<p><%=o.getOrderDate() %></p>
	                            	</div>
	                            	<!-- 수량 -->
	                            	<div class="orderCount col-xs-2 col-sm-2 col-md-2 col-lg-2">
	                            		<p><%=o.getBookCount()%></p>
	                            	</div>
	                           		<!-- 총 가격 -->
	                            	<div class="finalPrice end col-xs-2 col-sm-2 col-md-2 col-lg-2">
	                          			<p class="book_info book_price" id="book_price"><strong><%=o.getBook().getPrice() %>원</strong></p>
	                            	</div>
								</div>
							<%}%>
						<%} %>							
					<%} else {%>
						<h2>구매목록이 없습니다.</h2>
					<%} %>
				</article>
			</section>
		</div>
		
		<script>
		</script>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>