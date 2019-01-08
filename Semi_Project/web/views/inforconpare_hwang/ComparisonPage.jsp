<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
    
<meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'>
<%@ include file="/views/common/header.jsp"%>

<style>
body
{
    margin-top:40px;
    background-color:silver;
}

.container
{
    border:1px solid darkgray;
    background-color:white;
}

.comparebook
{
    text-align: center;
    margin-top:35px;
    margin-bottom:35px;
    display:flex;
    justify-content:center;
}

.compare
{
    align-self:flex-end;
}

.book-1
{
	left:40px;
}
.book-2
{
	right:40px;
}

html, body
{
    height:100%;
}

.book-line col-md-2
{
    height:100%;
}
</style>

<section>

   <div class="container">
 

    <div class='row section'>
        <div class='comparebook col-md-12'>
            <div class='book-1 col-md-6'>
                <img src='photo/bookpic/어린왕자.jpg' height=300px; />
                <div class="compare">
                    <h1 class="booktitle" style='font-size:20px; font-weight:bold;'><strong>어린왕자</strong></h1>
                    <span class="writerName"><small>작가 : <a href="#">앙투안 드 생텍쥐페리</a></small></span>
                    <span class="list_price">
                        <li style="list-style:none;">
                            <small>
                                정가 :
                            </small>
                            <span class="org_price" style="font-weight:bold">
                                6,000
                            </span>
                            <small>
                                원
                            </small>
                            <br>
                            <small>
                                판매가 :
                            </small>
                            <span class="sell_price" title="판매가">
                                <strong style="font-size:large; color:red; font-weight:bold;">
                                    5,400
                                </strong>
                                <small>
                                    원
                                </small>
                            </span>
                        </li>
                    </span>
                    <span class="publishDate" title="출간일">
                        <li style="list-style:none;">
                            <small>
                                출간일 :
                            </small>
                            <span class="date">
                                <small>
                                    2017년 09월 22일 출간
                                </small>
                            </span>
                            <br>
                        </li>
                    </span>
                    <span class="publisher" title="출판사">
                        <li style="list-style:none;">
                            <small>
                                출판사 :
                            </small>
                            <span class="publisherName">
                                <small>
                                    <a href="#">새움</a>
                                </small>
                            </span>
                            <br>
                        </li>
                    </span>
                    <span class="reviewRating" title="평점">
                        <li style="list-style:none;">
                            <small>
                                평점 :
                            </small>
                            <span class="date">
                                <img src="http://image.kyobobook.co.kr/newimages/apps/b2c/search/2009/star05.gif">
                            </span>
                            <br>
                        </li>
                    </span>
                </div>
            </div>
    
            <div class='book-2 col-md-6'>
                <img src='photo/bookpic/해리포터2.jpg' height=300px; />
                <div class="compare">
                    <h1 class="booktitle" style='font-size:20px; font-weight:bold;'><strong>해리포터</strong></h1>
                    <span class="writerName"><small>작가 : <a href="#">조앤.K.롤링</a></small></span>
                    <span class="list_price">
                        <li style="list-style:none;">
                            <small>
                                정가 :
                            </small>
                            <span class="org_price" style="font-weight:bold">
                                9,000
                            </span>
                            <small>
                                원
                            </small>
                            <br>
                            <small>
                                판매가 :
                            </small>
                            <span class="sell_price" title="판매가">
                                <strong style="font-size:large; color:red; font-weight:bold;">
                                    8,100
                                </strong>
                                <small>
                                    원
                                </small>
                            </span>
                        </li>
                    </span>
                    <span class="publishDate" title="출간일">
                        <li style="list-style:none;">
                            <small>
                                출간일 :
                            </small>
                            <span class="date">
                                <small>
                                    2014년 12월 18일 출간
                                </small>
                            </span>
                            <br>
                        </li>
                    </span>
                    <span class="publisher" title="출판사">
                        <li style="list-style:none;">
                            <small>
                                출판사 :
                            </small>
                            <span class="publisherName">
                                <small>
                                    <a href="#">문학수첩</a>
                                </small>
                            </span>
                            <br>
                        </li>
                    </span>
                    <span class="reviewRating" title="평점">
                        <li style="list-style:none;">
                            <small>
                                평점 :
                            </small>
                            <span class="date">
                                <img src="http://image.kyobobook.co.kr/newimages/apps/b2c/search/2009/star05.gif">
                            </span>
                            <br>
                        </li>
                    </span>
                    </li>
                    </span>
                </div>
            </div>
        </div>
    </div>
  </div>
        
</section>
<%@include file="/views/common/footer.jsp"%>