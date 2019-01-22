<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/myHeader.jsp"%>
<%@ page import="java.util.*, com.kh.order.model.vo.Order, com.kh.book.model.vo.Book, com.kh.author.model.vo.Author" %>
<%
	List<Book> list = (List)request.getAttribute("paymentList");
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
							<%for(Book b : list) {%>						
									<tr>
										<!-- 책 이미지 -->
										<td>
											<div id="bookImg">
		                                		<a href="" class="thumbnail">
		                                    		<img src="<%=request.getContextPath()%>/images/book/<%=b.getBookImage()%>"alt="책 이미지">
		                                		</a>
	                                		</div>
										</td>
										<!-- 제목, 저자, 가격 -->                        		                            	
										<td style="text-align: left;">
		                                	<h4 class='book_info'>
	    	                                <a href="">
		                                    	<h3><strong><%=b.getBookName() %></strong></h3>
	                                    	</a>
		                                	</h4>
		                                	<h5><%=b.getAuthor().getAuthorName() %></h5>  
		                                	<h4 id="bookPrice"><%=b.getPrice() %></h4>       
										</td>
									
										<!-- 수량 -->
										<td>
		                            		<p><%=b.getBookCount() %></p>
										</td>
										<!-- 총 가격 -->
										<td>
											<p>원</p>
										</td>
									</tr>
								<%} %>							
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