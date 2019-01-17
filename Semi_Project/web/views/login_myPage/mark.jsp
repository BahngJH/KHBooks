<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.kh.book.model.vo.Book, java.util.*" %>
<%
	List<Book> books = (List<Book>)request.getAttribute("bookList");
%>    
<%@ include file="/views/common/myHeader.jsp" %>

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
	#btnCheck{float:left;}
	.middle{margin-top:40px;}
	#allCheck{float:right; margin-right:15px;}
	#allText{margin-right:10px;}
</style>
	<div class="col-sm-10">
			<section>
				<article class="buyList-container">
					<div id="buyList-title">
						<h3>찜 목록</h3>
					</div>
					<div id="btnCheck">
					<button class="btn btn-default">선택 담기</button>
					<button class="btn btn-danger" onclick="multiDelete();">선택 삭제</button>
					</div>
					<div id="allCheck">
					<span id="allText"><strong>전체선택</strong></span><input id="checkAll" onclick="cAll();" type="checkbox">
					</div>
					<hr style='margin-top: 60px; border: 1px solid lightgray;'/>
					<div id="buyList-actions">
          				<div id="book" class="col-xs-12 col-md-12">
                    
                    <div>
                    <form method="get" name="deleteList" id="deleteList" action="<%=request.getContextPath()%>/member/markMutiDelete">
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
                                <p>방지훈</p>
                                <button class="btn btn-default">담기</button>
                                <button class="btn btn-default">삭제</button>
                                
                            <!-- 책 가격과 체크박스 -->
                            </div>
                            <div class="end col-xs-3 col-sm-3 col-md-3 col-lg-3">
                          	<p class="book_info book_price" id="book_price"><strong><%=b.getPrice() %>원</strong></p>
                            <input type="checkbox" name="BookId" value="<%=b.getBookId()%>">
                            </div>
                        </div>		
                   	<%	
                    	}
                    }else{
                    %>
                    <h2><b>현재 찜하신 상품이 없습니다.</b></h2>
                    <%} %>
                   </form>
                    </div>
                </div>
					</div>
				</article>
			</section>
		</div>
		<script>
			function cAll(){
				if($('#checkAll').is(':checked')){
					$('input[type=checkbox]').prop("checked",true);
				}else{
					$('input[type=checkbox]').prop("checked",false);
				}
			}
			function multiDelete(){
				var deleteList = $('#deleteList');
				deleteList.submit();
			}
		
		</script>
<%@ include file="/views/common/footer.jsp" %>