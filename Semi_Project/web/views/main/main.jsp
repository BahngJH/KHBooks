<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.book.model.vo.Book, java.util.*, com.kh.notice.model.vo.Notice" %>
<%
	List<Book> best = (List)request.getAttribute("best");
	List<Book> recent = (List)request.getAttribute("recent");
	List<Notice> notices = (List)request.getAttribute("notice");
	boolean active = false;
%>
<%@ include file="/views/common/header.jsp"%>
<section>
        <div class="container">

            <div id="carousel-id" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carousel-id" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-id" data-slide-to="1" class=""></li>
                    <li data-target="#carousel-id" data-slide-to="2" class=""></li>
                </ol>
                <div class="carousel-inner">
                   	<%for(Notice n : notices){%>
                    <div class="item <%=active?"":"active"%>">
                    	<%active=true; %>
                        <div class="container">
                            <div class="carousel-caption">
	                            <a href="<%=request.getContextPath()%>/notice/noticeContent?no=<%=n.getNoticeNo()%>">
    	                            <h3><%=n.getNoticeTitle() %></h3>
        	                        <p><%=n.getNoticeContent().substring(0, 89)+"..." %></p>
	                            </a>                    
                            </div>
                        </div>
                    </div>
                   	<%} %>
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