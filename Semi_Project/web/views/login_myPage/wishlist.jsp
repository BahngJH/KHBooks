<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.kh.book.model.vo.Book, java.util.*" %>
<%
	List<Book> books = (List<Book>)request.getAttribute("booksList");
	int markCount = (int)request.getAttribute("wishlistCount");
%>
<%@ include file="/views/common/myHeader.jsp"%>
<style>
	.end{
		font-size:150%;
		margin-top:55px;
		
	}
	input[type=checkbox]{
	/* 체크박스 크기키움 */
		-webkit-transform: scale(1.3);
	}
	.end input{
		float:right;
	}
	#btnCheck{float:right;}
	.middle{margin-top:40px;}
	#allCheck{float:right; margin-right:15px;}
	#allText{margin-right:10px;}
	input[type=number]{
		float:left;
		font-size:14px;
		width:40px;
		margin-left:25px;
	}
	#book_price{
		float:left;
	}
	#selectbox{
		margin-left:10px;
	}
	
</style>
	<div class="col-sm-10">
			<section>
				<article class="buyList-container">
					<div id="buyList-title">
						<h3>장바구니</h3>
					</div>
					
					<div id="allCheck">
					<span id="allText"><strong>전체선택</strong></span><input id="checkAll" onclick="cAll();" type="checkbox">
					</div>
					<hr style='margin-top: 60px; border: 1px solid lightgray;'/>
					
					<!-- 찜목록 중단, 데이터 불러오기 시작 -->
					<div id="buyList-actions">
          			<div id="book" class="col-xs-12 col-md-12">
                    <div>
                    <form method="get" name="checkedList" id="checkedList">
                    <!-- 검색 결과가 있을 경우 -->
                    <%if(!books.isEmpty()) {
                    	for(Book b : books){
                   	%>
                    	<div class='result row'>
                    		<!-- 책 이미지 -->
                            <div class='result-image col-xs-3 col-sm-2 col-md-2 col-lg-2'>
                                <a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=b.getBookId()%>" class="thumbnail">
                                    <img src="<%=request.getContextPath() %>/images/book/<%=b.getBookImage() %>"
                                        alt="책 이미지">
                                </a>
                            </div>
                            <div class='middle result-image col-xs-6 col-sm-7 col-md-7 col-lg-7'>
                            	<!-- 책 정보 -->
                                <h4 class='book_info'>
                                    <a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=b.getBookId()%>">
                                        <span><strong><%=b.getBookName() %></strong></span>
                                    </a>
                                </h4>
                                <!-- 저자, 출판사 정보 -->
                                <p><%=b.getAuthor().getAuthorName()%> | <%=b.getPublisher() %></p>
                                <button class="btn btn-default" type="button">구매</button>
                                <button class="btn btn-default" type="button">삭제</button>
                                <input type="hidden" value="<%=b.getBookId()%>">
                                
                            <!-- 책 가격,수량, 선택 체크박스 -->
                            </div>
                            <div class="end col-xs-3 col-sm-3 col-md-3 col-lg-3">
	                          	<p class="book_info book_price" id="book_price"><strong><%=b.getPrice() %>원</strong></p>
	                          	<input type="number" min="0" step="1" max="" value="1">권	                       	                          		                          	
	                            <input type="checkbox" id="selectbox" name="BookId" onclick="bookSum(this.form);" value="<%=b.getBookId()%>">
	                            <input type="hidden" id="bookPrice" class="bookPrice" name="bookPrice" value="<%=b.getPrice()%>">	
                            </div>
                        </div>		
                   	<%	
                    	}%>                   	
	                    	<table border=1 class="table table-bordered" style="text-align:center">
	                    		<tr>
	                    			<td>선택한 권수</td>
	                    			<td>총 결제 금액</td>
	                    			<td>적립될 마일리지</td>
	                    		</tr>
	                    		<tr>
	                    			<td><span id="selectBooks">0</span>권</td>
	                    			<td><span id="totalSum">0</span><span>원</span></td>
	                    			<td><span id="milage"></span></td>
	                    		</tr>
	                    	</table>
	                    	<div id="btnCheck">
	                    	<button class="btn btn-danger">선택 삭제</button>
							<button class="btn btn-primary" >선택 구매</button>
							</div>
                    	<%
                    }else{
                    %>
                    <h2><b>현재 담긴 상품이 없습니다.</b></h2>
                    <%} %>           
                   </form>
                    </div>
                </div>
					</div>
				</article>
			</section>
		</div>
		<script>
		function bookSum(frm){
			var sum = 0;
			var count = frm.BookId.length;
			var selectBooks=0;
			for(var i=0;i<count;i++){
				if(frm.BookId[i].checked==true){
					selectBooks++;
					sum += parseInt(frm.bookPrice[i].value);
				}
			}
			count = selectBooks;
			var milage = sum/10;
			$('#milage').html(milage);
			$('#selectBooks').html(count);
		 	$('#totalSum').html(sum);
		}
			function cAll(){
				if($('#checkAll').is(':checked')){
					$('input[type=checkbox]').prop("checked",true);
					var sum = 0;
					var count =$('.bookPrice').length;
					var selectBooks=0;
					for(var i=0;i<count;i++){					
							selectBooks++;
							sum += parseInt($('.bookPrice')[i].value);
					}
					count = selectBooks;
					var milage = sum/10;
					$('#milage').html(milage);
					$('#selectBooks').html(count);
				 	$('#totalSum').html(sum);
				}else{
					$('input[type=checkbox]').prop("checked",false);
					$('#selectBooks').html(0);
				 	$('#totalSum').html(0);
				 	$('#milage').html(0);
				 	
				}
			}
			
		
		</script>

<%@ include file="/views/common/footer.jsp"%>