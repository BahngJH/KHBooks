<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.author.model.vo.Author, com.kh.book.model.vo.Book"%>
<%@ include file="/views/common/header.jsp"%>

<%
	Author a = (Author)request.getAttribute("author");
	List <Book> bList = (List)request.getAttribute("blist");
%>

<section class="container author-container">
	<div class="author-data">
		<% if(a!=null){%>
		<div class="author-name">
			<h2><%=a.getAuthorName() %></h2>
		</div>
		<div class="author-info">
			<pre><%=a.getAuthorInfo() %></pre>
		</div>
		<%}else{ %>
		<h3>작가 정보가 없습니다.</h3>
		<%} %>
	</div>
	<div class="book-data">
		<% if(!bList.isEmpty()){
			for(Book b : bList){ %>
		<div class='book-result row'>
    		<!-- 책 이미지 -->
            <div class='result-image col-xs-4 col-sm-4 col-md-2 col-lg-2'>
                <a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=b.getBookId()%>" class="thumbnail">
                    <img src="<%=request.getContextPath() %>/images/book/<%=b.getBookImage() %>"
                        alt="책 이미지">
                </a>
            </div>
            <div class='result-image col-xs-8 col-sm-8 col-md-9 col-lg-9'>
            	<!-- 책 정보 -->
                <h4 class='book_info'>
                    <a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=b.getBookId()%>">
                        <span><strong><%=b.getBookName() %></strong></span>
                    </a>
                </h4>
                <p class="book_info">
                	<span class="book_info"><a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=b.getBookId()%>">5.0</a>|</span>
                	<span class="book_info"><a href="#"><%=a.getAuthorName() %></a>|</span>
                	<span class="book_info"><a href="#"><%=b.getPublisher() %></a></span>
                </p>
            	<!-- 책 줄거리 -->
            	<p class="book_info book_content">
            		<a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=b.getBookId()%>">
            		<%
            			/* 줄거리 내용이 너무 길 경우 자르고 ... 을 추가함 */
            			String content = b.getBookInfo();
            			if(content.length() > 188){
            				content = content.substring(0, 188)+"...";
            			}
            		%>
            		
            		<%=content %></a>
            	</p>
            	<!-- 책 가격 -->
             <p class="book_info book_price" >가격</p> <p class="book_info book_price" id="book_price"><strong><%=b.getPrice() %>원</strong></p>
            </div>
        </div>	
        <% }
        }%>
	</div>
</section>
<%@include file="/views/common/footer.jsp"%>