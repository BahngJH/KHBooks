<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.book.model.vo.Book, java.util.*" %>
<%
	List<Book> best = (List)request.getAttribute("best");
	List<Book> recent = (List)request.getAttribute("recent");
%>
<%@ include file="/views/common/header.jsp"%>
<section>
        <div class="container">

            <div id="carousel-id" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carousel-id" data-slide-to="0" class=""></li>
                    <li data-target="#carousel-id" data-slide-to="1" class=""></li>
                    <li data-target="#carousel-id" data-slide-to="2" class="active"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img class="img-responsive" alt="First slide" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI5MDAiIGhlaWdodD0iNTAwIj48cmVjdCB3aWR0aD0iOTAwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iIzc3NyI+PC9yZWN0Pjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjQ1MCIgeT0iMjUwIiBzdHlsZT0iZmlsbDojN2E3YTdhO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1zaXplOjU2cHg7Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+Rmlyc3Qgc2xpZGU8L3RleHQ+PC9zdmc+">
                        <div class="container">
                            <div class="carousel-caption">
                                <h1>공지사항</h1>
                                <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and
                                    "previous" Glyphicon buttons on the left and right might not load/display properly
                                    due
                                    to web browser security rules.</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="left carousel-control" href="#carousel-id" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                <a class="right carousel-control" href="#carousel-id" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>
            <div class="row">
                <div id="bestSeller" class="col-xs-12 col-lg-12">
                    <div class="book-title row">
                        <h3 class='text-center'> <span class="glyphicon glyphicon-grain"></span>주간 베스트 셀러<span class="glyphicon glyphicon-grain"></span></h3>
                    </div>
					<div class="row">
	                    <%for(Book b : best) {%>
	                    <div class="col-xs-6 col-sm-4 col-lg-2 book-container">
	    	       			<div class="col-xs-12">
		    	       			<a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=b.getBookId()%>" class="author-name"><%=b.getBookName() %></a>
	           				</div>
	                    	<div class="thumbnail-container col-xs-12">
		                        <a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=b.getBookId()%>" class="thumbnail book-thumbnail">
		                            <img src="<%=request.getContextPath()+"/images/book/"+b.getBookImage() %>" alt="도서 이미지">
		                        </a>
		                        <!-- <span class="border"></span> -->
	                    	</div>
	                    </div>
	                    <%} %>
					</div>
                </div>
            </div>
            <div class="row">
                <div id='newBook' class="col-xs-12 col-lg-12">
                    <div class="book-title row">
                        <h3 class='text-center'><span class="glyphicon glyphicon-grain"></span> 신간 도서<span class="glyphicon glyphicon-grain"></span></h3>
                    </div>
                    <div class="row">
	                    <%for(Book b : recent) {%>
	                    <div class="col-xs-6 col-sm-4 col-lg-2 book-container">
	    	       			<div class="col-xs-12">
		    	       			<a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=b.getBookId()%>" class="author-name"><%=b.getBookName() %></a>
	           				</div>
	                    	<div class="thumbnail-container col-xs-12">
		                        <a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=b.getBookId()%>" class="thumbnail book-thumbnail">
		                            <img src="<%=request.getContextPath()+"/images/book/"+b.getBookImage() %>" alt="도서 이미지">
		                        </a>
		                        <!-- <span class="border"></span> -->
	                    	</div>
	                    </div>
	                    <%} %>
					</div>
                </div>
            </div>
        </div>
    </section>

<%@include file="/views/common/footer.jsp"%>