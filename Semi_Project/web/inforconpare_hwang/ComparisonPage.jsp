<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
    
<meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css'>
<script src='http://code.jquery.com/jquery-3.2.1.min.js'></script>
<script	src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js'></script>
<%@ include file="/views/common/header.jsp"%>

<title>책 비교 페이지</title>
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
        margin-top:35px;
        margin-bottom:35px;
    }
    </style>

<section>

 <div class="container">
    <div class="row header">
        <div class="col-sm-12">
            
        </div>
    </div>



    <div class="row section">
        <div class="col-sm-4">
            <div class="comparebook">
                <div class="book-1">
                    <img src='photo/bookpic/어린왕자.jpg' height=300px;/>
                </div>
                <div class="book-2">
                    <img src='photo/bookpic/해리포터2.jpg' height=300px;/>
                </div>
            </div>
        </div>
    </div>



    <div class="row footer">
        <div class="col-xs-12">
            
        </div>
    </div>
</div>
        
</section>
<%@include file="/views/common/footer.jsp"%>