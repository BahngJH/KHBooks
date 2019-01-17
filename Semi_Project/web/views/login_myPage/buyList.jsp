<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/myHeader.jsp"%>
<%@ page import="java.util.*, com.kh.order.model.vo.Order, com.kh.book.model.vo.Book, com.kh.author.model.vo.Author" %>
<%
	List<Order> list = (List)request.getAttribute("list");
%>

<style>
	div#buyList-options div.input-group{width: 30%; float: left;}
	div.btn-group{float: right;}
	div.middle #bookPrice {
		margin-top: 90px;
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
							<input type="text" class="form-control" placeholder="책 또는 저자명" name="btn-search" aria-describedby="basic-addon2"/>
							<span class="input-group-addon" id="basic-addon2">검색</span>
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
							<div class="buyList row">
          						<div class='result-image col-xs-3 col-sm-2 col-md-2 col-lg-2'>
                                	<a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=o.getBook().getBookId()%>" class="thumbnail">
                                    	<img src="<%=request.getContextPath() %>/images/book/<%=o.getBook().getBookImage() %>"alt="책 이미지">
                                	</a>
                            	</div>
                            	
                            	<div class='middle result-image col-xs-6 col-sm-7 col-md-7 col-lg-7'>
                            		<!-- 책 정보 -->
	                                <h4 class='book_info'>
    	                                <a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=o.getBook().getBookId()%>">
	                                        <h3><strong><%=o.getBook().getBookName()%></strong></h3>
                                    	</a>
                                	</h4>
                                	<!-- 저자, 출판사 정보 -->
                                	<h5><%=o.getBook().getAuthor().getAuthorName() %></h5>  
                                	<h4 id="bookPrice"><%=o.getBook().getPrice() %>원</h4>                              
                            	</div>
                           		<!-- 책 가격과 체크박스 -->
                            	<div class="end col-xs-3 col-sm-3 col-md-3 col-lg-3">
                          			<p class="book_info book_price" id="book_price"><strong><%=o.getBook().getPrice() %>원</strong></p>
                            	</div>
							</div>
						<%}%>						
					<%} else {%>
						<h2>구매목록이 없습니다.</h2>
					<%} %>
				</article>
			</section>
		</div>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>