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
	#btnCheck{float:right; margin-bottom:20px;}
	.middle{margin-top:40px;}
	#allCheck{float:right; margin-right:15px;}
	#allText{margin-right:10px;}
	input[type=number]{
		float:left;
		font-size:14px;
		width:40px;
		margin-left:20px;
	}
	#book_price{
		float:left;
	}
	#selectbox{
		float:right;
		margin-left:10px;
	}
	#bookCount{
		float:left;
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
                            <div class='middle result-image col-xs-5 col-sm-5 col-md-5 col-lg-5'>
                            	<!-- 책 정보 -->
                                <h4 class='book_info'>
                                    <a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=b.getBookId()%>">
                                        <span><strong><%=b.getBookName() %></strong></span>
                                    </a>
                                </h4>
                                <!-- 저자, 출판사 정보 -->
                                <p><%=b.getAuthor().getAuthorName()%> | <%=b.getPublisher() %></p>
                                <button class="btn btn-default" type="button" onclick="payOne();">구매</button>
                                <button class="btn btn-default" type="button" onclick="deleteOne();">삭제</button>
                                <input type="hidden" value="<%=b.getBookId()%>">
                                
                            <!-- 책 가격,수량, 선택 체크박스 -->
                            </div>
                            <div class="end col-xs-4 col-sm-5 col-md-5 col-lg-5">
	                          	<p id="book_price" class="book_info book_price"><%=b.getPrice() %>원</p>
	                          	<input type="number" id="bookCount" class="bookCount" name="bookCount" min="0" step="1" max="<%=b.getStock() %>" value="<%=b.getBookCount()%>">권
	                          	<input type="hidden" id="stockMax" value="<%=b.getStock() %>">	                       	                          		                          	
	                            <input type="checkbox" id="selectbox" class="BookId" name="BookId" onclick="bookSum(this.form);" value="<%=b.getBookId()%>">
	                            <input type="hidden" id="bookPrice" class="bookPrice" name="bookPrice" value="<%=b.getPrice()%>">
	                         	<input type="hidden" id="bookPrice2" class="bookPrice2" value="<%=b.getPrice()%>">
	                            <!-- 구매 창으로 넘기는 책 이미지, 작가, 출판사 정보 -->
	                            <input type="hidden" name="bookImage" value="<%=b.getBookImage()%>">
	                            <input type="hidden" name="authorName" value="<%=b.getAuthor().getAuthorName()%>">
	                            <input type="hidden" name="publisher" value="<%=b.getPublisher()%>">
	                            <input type="hidden" name="bookName" value="<%=b.getBookName() %>">
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
	                    	<button class="btn btn-danger" onclick="multiDelete();">선택 삭제</button>
							<button class="btn btn-primary" onclick="multiPayment();">선택 구매</button>
							</div>
                    	<%
                    }else{
                    %>
                    <h2 id="empty"><b>현재 담긴 상품이 없습니다.</b></h2>
                    <%} %>           
                   </form>
                    </div>
                </div>
					</div>
				</article>
			</section>
		</div>
		<script>
		
		//개별선택 체크 했을 때 가격과 수량 체크
		function bookSum(frm){
			var sum = 0;
			var count = frm.BookId.length;
			if(count==undefined){
				count=1;
			}
			var selectBooks=0;
			if(count==1){
				if(frm.BookId.checked==true){
				selectBooks += parseInt(frm.bookCount.value);
				sum+=parseInt(frm.bookPrice.value);
				}
			}else{ 
			for(var i=0;i<count;i++){
				if(frm.BookId[i].checked==true){
					selectBooks +=parseInt(frm.bookCount[i].value);
					sum += parseInt(frm.bookCount[i].value)*parseInt(frm.bookPrice2[i].value);
				}
			}
		}
			count = selectBooks;
			var milage = sum/10;
			$('#milage').html(milage);
			$('#selectBooks').html(count);
		 	$('#totalSum').html(sum);
		} 
		
		
		//전체 체크옵션, 수량 가격 체크
			function cAll(){
				if($('#checkAll').is(':checked')){
					$('input[type=checkbox]').prop("checked",true);
					var sum = 0;
					var count =$('.bookPrice').length;
					var selectBooks=0;
					for(var i=0;i<count;i++){					
							selectBooks+=parseInt($('.bookCount')[i].value);
							sum += parseInt($('.bookCount')[i].value)*parseInt($('.bookPrice2')[i].value);
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
			//수량이 바뀌면 값도 변하게 수정
			$(function(){
				$('.bookCount').blur(function(){
					//재고량보다 많으면 막는 로직
					var count = parseInt($(event.target).val());
					var maxCount = parseInt($(event.target).next().val());
					if(count>maxCount)
						{
							alert("재고량보다 많이 선택하셨습니다. 현재 재고 "+maxCount+"권");
							count = $(event.target).val(maxCount);
							return;
						} 
					//원본데이터를 하나 만들어서 본래의 가격 유지
					var price = parseInt($(event.target).parent().children('.bookPrice2').val());
					var count = parseInt($(event.target).parent().children('.bookCount').val());
					var bookId = parseInt($(event.target).parent().children('.BookId').val());
					var changePrice = price * count;
					
					$(event.target).parent().children('.bookPrice').val(changePrice);
					
					//수량이 바뀌면 디비에 그 수량 바꿔줌
					$.ajax({
						type:"get",
						url:"<%=request.getContextPath()%>/member/updateBookcount",
						data:{bookCount:count, bookId:bookId},
						success:function(data){
							
							
						}
						
					});
					
				});
			});
			
			 function multiDelete(){
				var deleteList = $('#checkedList');
				var url = "<%=request.getContextPath()%>/member/wishlistMultiDelete";
				deleteList.attr("action",url);
				deleteList.submit();
			}
			 function deleteOne(){
				//버튼을 누르면 event가 매개변수로 자동으로 들어오고 event.target으로 현재의 버튼에서 원하는 자료를 찾아간다.
				var bookId = $(event.target).next('input').val();
				location.href="<%=request.getContextPath()%>/member/wishlistMultiDelete?BookId="+bookId;
			} 
			 function multiPayment(){
				 var payList = $('#checkedList');
					var url = "<%=request.getContextPath()%>/member/multiPayment";
					payList.attr("action",url);
					payList.submit();
			 }
			 function payOne(){
				var bookId = $(event.target).next().next('input').val();
				location.href="<%=request.getContextPath()%>/member/multiPayment?BookId="+bookId;
			 }
		
		</script>
		
		</div>
	</div>
<%@ include file="/views/common/footer.jsp"%>
