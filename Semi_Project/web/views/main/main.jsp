<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.book.model.vo.Book, java.util.*" %>
<%
	List<Book> best = (List)request.getAttribute("best");
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
                    <div class="item">
                        <img data-src="holder.js/900x500/auto/#777:#7a7a7a/text:First slide" alt="First slide" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI5MDAiIGhlaWdodD0iNTAwIj48cmVjdCB3aWR0aD0iOTAwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iIzc3NyI+PC9yZWN0Pjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjQ1MCIgeT0iMjUwIiBzdHlsZT0iZmlsbDojN2E3YTdhO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1zaXplOjU2cHg7Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+Rmlyc3Qgc2xpZGU8L3RleHQ+PC9zdmc+">
                        <div class="container">
                            <div class="carousel-caption">
                                <h1>Example headline.</h1>
                                <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and
                                    "previous" Glyphicon buttons on the left and right might not load/display properly
                                    due
                                    to web browser security rules.</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <img data-src="holder.js/900x500/auto/#666:#6a6a6a/text:Second slide" alt="Second slide" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI5MDAiIGhlaWdodD0iNTAwIj48cmVjdCB3aWR0aD0iOTAwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iIzY2NiI+PC9yZWN0Pjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjQ1MCIgeT0iMjUwIiBzdHlsZT0iZmlsbDojNmE2YTZhO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1zaXplOjU2cHg7Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+U2Vjb25kIHNsaWRlPC90ZXh0Pjwvc3ZnPg==">
                        <div class="container">
                            <div class="carousel-caption">
                                <h1>Another example headline.</h1>
                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi
                                    porta
                                    gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="item active">
                        <img data-src="holder.js/900x500/auto/#555:#5a5a5a/text:Third slide" alt="Third slide" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI5MDAiIGhlaWdodD0iNTAwIj48cmVjdCB3aWR0aD0iOTAwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iIzU1NSI+PC9yZWN0Pjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjQ1MCIgeT0iMjUwIiBzdHlsZT0iZmlsbDojNWE1YTVhO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1zaXplOjU2cHg7Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+VGhpcmQgc2xpZGU8L3RleHQ+PC9zdmc+">
                        <div class="container">
                            <div class="carousel-caption">
                                <h1>One more for good measure.</h1>
                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi
                                    porta
                                    gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="left carousel-control" href="#carousel-id" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                <a class="right carousel-control" href="#carousel-id" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>
            <div class="row">
                <div id="bestSeller" class="col-xs-12 col-lg-12">
                    <div>
                        <h4 class='text-center'> 주간 베스트 셀러</h4>
                    </div>

                    <%for(Book b : best) {%>
                    <div class="col-xs-6 col-md-4 col-lg-2">
                       	<span><%=b.getBookName() %></span>
                    	<div class="thumbnail-container">
	                        <a href="#" class="thumbnail book-thumbnail">
	                            <img src="<%=request.getContextPath()+"/images/book/"+b.getBookImage() %>" alt="도서 이미지">
	                        </a>
	                        <span class="border"></span>
                    	</div>
                    </div>
                    <%} %>
                </div>
            </div>
            <div class="row">
                <div id='newBook' class="col-xs-12 col-lg-12">
                    <div>
                        <h2 class='text-center'>신간 도서</h2>
                    </div>
                    <div class="col-xs-6 col-lg-2 col-lg-offset-1">
                        <a href="#" class="thumbnail">
                            <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                alt="">
                        </a>
                    </div>
                    <div class="col-xs-6 col-lg-2 ">
                        <a href="#" class="thumbnail">
                            <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                alt="">
                        </a>
                    </div>
                    <div class="col-xs-6 col-lg-2 ">
                        <a href="#" class="thumbnail">
                            <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                alt="">
                        </a>
                    </div>
                    <div class="col-xs-6 col-lg-2 ">
                        <a href="#" class="thumbnail">
                            <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                alt="">
                        </a>
                    </div>
                    <div class="col-xs-6 col-lg-2 ">
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