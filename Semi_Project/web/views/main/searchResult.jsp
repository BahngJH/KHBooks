<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.book.model.vo.Book, com.kh.author.model.vo.Author, com.kh.search.model.vo.GenreCount, java.util.*" %>
<%@ include file="/views/common/header.jsp"%>
<% 
	List<Book> books = (List<Book>)request.getAttribute("bookList"); 
	List<Author> authors = (List<Author>)request.getAttribute("authorList");
	List<GenreCount> genres = (List<GenreCount>)request.getAttribute("genreList");
	String pageBar = (String)request.getAttribute("pageBar");
	int cPage = (int)request.getAttribute("cPage"); 
	String keyword = (String)request.getAttribute("keyword");
%>
<script>
        $(function () {
            var currentPosition = parseInt($("#cart").css("top"));
            //$('#cart').css('height', $(window).height()-100);
            $(window).scroll(function () {
                var width = $(window).width();
                if (width >= 992) {
                    var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다. 
                    
                    $("#cart").stop().animate({
                        "top": position + currentPosition + "px"
                    }, 500);
                }
            });
        });
    </script>
</head>

<body>
    <section>
        <div class="container">
        
        	<!-- 좌측 카테고리 -->
            <div id='category' class="col-xs-12 col-md-3">
            <%if(!genres.isEmpty()){
            	int allGenre = 0;
            	for(GenreCount g : genres){
            		allGenre += g.getCnt();
            	}
            
            %>
            	<h3 class="category_title">결과 내 카테고리</h3>
                <ul class="list-group">
                	<li class="list-group-item"><a href="<%=request.getContextPath()%>/search/search?keyword=<%=keyword%>&cPage=<%=cPage%>">전체<span class="badge">(<%=allGenre %>)</span></a></li>
            <%	for(GenreCount c : genres){%>
                    <li class="list-group-item"><a href="<%=request.getContextPath()%>/search/search?keyword=<%=keyword%>&cPage=<%=cPage%>&category=<%=c.getGenre()%>"><%=c.getGenre() %><span class="badge">(<%=c.getCnt() %>)</span></a></li>
				<%}%>            	
                </ul>
            <%}%> 
                    
            </div>
            <!-- 중앙 검색 결과 -->
            <div id='search' class="col-xs-12 col-md-8">
     			<!-- 저자 검색 결과 -->
                <div id="author" class="col-xs-12 col-md-12">
                    <h3>저자 검색</h3>
                    <%if(!authors.isEmpty()){ 
                    	for(Author a : authors){%>
                    		<div class="row result">
                    			<div class="col-xs-12 col-md-12 author_info">
                    				<p><a href="#"><%=a.getAuthorName() %></a></p>
                    			</div>
                    		</div>
                    	
                    		
                    <%
                    	}
                    %>
                    	
                    <%}else{%>
                    <h4><strong>검색 결과 없음</strong></h4>
                    <%} %>
                </div>
                
                <!-- 책 검색 결과 -->
                <div id="book" class="col-xs-12 col-md-12">
                    <h3>책 검색</h3>
                    <div id='order' class="row">
                        <ul class="order-buttons list-inline col-xs-12 col-md-12">
                            <!--첫번째는 padding-left 속성 빼주기-->
                            <li><a href="#">인기순</a></li>
                            <li><a href="#">최신순</a></li>
                            <li><a href="#">평점순</a></li>
                            <li><a href="#">리뷰 많은순</a></li>
                            <li><a href="#">낮은 가격순</a></li>
                        </ul>
                    </div>
                    <div>
                    <!-- 검색 결과가 있을 경우 -->
                    <%if(!books.isEmpty()) {
                    	for(Book b : books){
                   	%>
                    	<div class='result row'>
                    		<!-- 책 이미지 -->
                            <div class='result-image col-xs-4 col-sm-3 col-md-3 col-lg-3'>
                                <a href="#" class="thumbnail">
                                    <img src="<%=request.getContextPath() %>/images/book/<%=b.getBookImage() %>"
                                        alt="책 이미지">
                                </a>
                            </div>
                            <div class='result-image col-xs-8 col-sm-9 col-md-9 col-lg-9'>
                            	<!-- 책 정보 -->
                                <h4 class='book_info'>
                                    <a href="#">
                                        <span><strong><%=b.getBookName() %></strong></span>
                                    </a>
                                </h4>
                                <p class="book_info">
                                	<span class="book_info"><a href="#">5.0</a>|</span>
                                	<!-- 작가 정보는 서버에서 아직 주지 않았음 -->
                                	<span class="book_info"><a href="#"><%=b.getAuthor().getAuthorName() %></a>|</span>
                                	<span class="book_info"><a href="#"><%=b.getPublisher() %></a></span>
                                </p>
                            	<!-- 책 줄거리 -->
                            	<p class="book_info book_content">
                            		<a href="#">
                            		<%
                            			/* 줄거리 내용이 너무 길 경우 자르고 ... 을 추가함 */
                            			String content = b.getBookInfo();
                            			if(content.length() > 190){
                            				content = content.substring(0, 190)+"...";
                            			}
                            		%>
                            		
                            		<%=content %></a>
                            	</p>
                            	<!-- 책 가격 -->
	                            <p class="book_info book_price" >가격</p> <p class="book_info book_price" id="book_price"><strong><%=b.getPrice() %>원</strong></p>
                            </div>
                        </div>
                    
                    		
                   	<%	
                    	}
                    }
                    %>
                    </div>
                </div>
                <!--페이지네이션-->
                <div class="paging col-xs-12" style="text-align: center">
                    <ul class="pagination pagination-lg">
                        <%=pageBar %>
                    </ul>

                </div>
            </div>

            <div id='cart' class="col-xs-12 col-md-1">

                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <p class="text-center">최근 본 목록</p>
                    </div>
                </div>

                <div class='row'>
                    <div class="cartContent col-xs-2 col-xs-offset-1 col-md-12 col-md-offset-0">
                        <a href="#" class="thumbnail">
                            <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                alt="">
                        </a>

                    </div>
                    <div class="cartContent col-xs-2 col-md-12">
                        <a href="#" class="thumbnail">
                            <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                alt="">
                        </a>

                    </div>
                    <div class="cartContent col-xs-2 col-md-12">
                        <a href="#" class="thumbnail">
                            <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                alt="">
                        </a>

                    </div>
                    <div class="cartContent col-xs-2 col-md-12">
                        <a href="#" class="thumbnail">
                            <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                alt="">
                        </a>

                    </div>
                    <div class="cartContent col-xs-2 col-md-12">
                        <a href="#" class="thumbnail">
                            <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                alt="">
                        </a>

                    </div>

                </div>
            </div>

        </div>
    </section>

<%@include file="/views/common/footer.jsp"%>