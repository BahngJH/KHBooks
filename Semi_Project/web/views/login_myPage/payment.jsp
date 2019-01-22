<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/myHeader.jsp"%>
<%@ page import="java.util.*, com.kh.order.model.vo.Order, com.kh.book.model.vo.Book, com.kh.author.model.vo.Author" %>
<%
	List<Book> list = (List)request.getAttribute("payList");
	int totalPrice = 0;
	for (Book b : list) {
		totalPrice += b.getPrice() * b.getBookCount();
	}
	
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
	article#orderInfo{
		margin-top: 115px;
	}

</style>


		<div class="col-sm-8">
			<section>
				<article class="buyList-container">
					<div id="buyList-title">
						<h3>결제 정보</h3>
					</div>					
					
					<table class="table table-responsive" id="tbl-orderList">
						<thaed>
							<tr>
								<th id="t-info" colspan='2' scope="col">도서 정보</th>
								<th id="t-date" scope="col">수량</th>
								<th id="t-count" scope="col">가격</th>								
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
		                                	<h5><%=b.getAuthor().getAuthorName()%> | <%=b.getPublisher() %></h5>  		                                	  
										</td>
									
										<!-- 수량 -->
										<td>
		                            		<p><%=b.getBookCount() %></p>
										</td>
										<!-- 총 가격 -->
										<td>
											<p><%=b.getPrice() %>원</p>
										</td>
									</tr>
								<%} %>							
						</tbody>
					</table>
				</article>
			</section>
		</div>
		<div class="col-sm-2">
			<article class="order_list" id="orderInfo">
                        <h3>결제 정보</h3>

                        <div class="col-sm-8 col-md-4"></div>
                        <div class="buy_info">
                            <table class="table table-striped" id="buy_info_table">
                                <tr >
                                    <td colspan='2'>총 주문 금액</td>                                   
                                </tr>
                                <tr>
                                	<td colspan='2'><%=totalPrice %></td>
                                </tr>
                                <tr>
                                    <td colspan='2'>나의 마일리지</td>                                   
                                </tr>
                                <tr>
                                	<td><%=logined.getMileage() %></td>
                                </tr>									
                                <tr>
                                    <td colspan='2'>적립 마일리지</td>                                    
                                </tr>
								<tr>
									<td colspan='2'><%=totalPrice / 10%></td>
								</tr>                                
                            </table>
							<form action="<%=request.getContextPath()%>/member/realPay" method="post">
								<input type="hidden" name="memberName" value="<%=logined.getMemberName()%>"/>
								<input type="hidden" name="email" value="<%=logined.getEmail()%>"/>
								<input type="hidden" name="phone" value="<%=logined.getPhone()%>"/>
								<input type="hidden" name="address" value="<%=logined.getAddress()%>"/>
								<input type="hidden" name="totalPrice" value="<%=totalPrice%>"/>
								<input type="hidden" name="payBookList" value="<%=list%>">											
								<input style="width: 100%" class="btn btn-primary" type="submit" value="결제하기"></button>
							</form>							
							
                        </div>

                    </article>
		</div>
		<script>
		</script>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>