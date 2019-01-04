<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH Books</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">
    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<header>
		<nav class="navbar navbar-default navbar-fixed-top">
	    <div class="container-fluid">
	        <div class="navbar-header">
	            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">
	                <span class="sr-only">Toggle navigation</span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	            </button>
	            <a class="navbar-brand" href="#">서점</a>
	            <div class="dropdown" style="display: inline">
	                <button class="btn btn-default dropdown-toggle navbar-btn" data-toggle="dropdown" role="button"
	                    aria-expanded="false" id="category">카테고리<span class="caret"></span>
	                </button>
	                <ul class="dropdown-menu" role="menu" aria-labelledby="category">
	                    <li><a href="#">카테고리</a></li>
	                    <li><a href="#">카테고리</a></li>
	                    <li><a href="#">카테고리</a></li>
	                    <li><a href="#">카테고리</a></li>
	                    <li><a href="#">카테고리</a></li>
	                    <li><a href="#">카테고리</a></li>
	                    <li><a href="#">카테고리</a></li>
	                    <li><a href="#">카테고리</a></li>
	                    <li><a href="#">카테고리</a></li>
	                    <li><a href="#">카테고리</a></li>
	                    <li><a href="#">카테고리</a></li>
	                    <li><a href="#">카테고리</a></li>
	                </ul>
	            </div>
	        </div>
	        <div class="collapse navbar-collapse" id="navbar-collapse-1">
	            <form class="navbar-form navbar-left" role="search">
	                <div class="form-group">
	                    <div class="input-group">
	                        <input type="text" class="form-control" placeholder="검색">
	                        <span class="input-group-btn">
	                            <button type="submit" class="btn btn-default">검색</button>
	                        </span>
	                    </div>
	                </div>
	            </form>
	            <ul class="nav navbar-nav navbar-right">
	                <li><button type="button" class="btn btn-default navbar-btn">로그인</button>
	                    <button type="button" class="btn btn-default navbar-btn">회원가입</button></li>
	                <li><a href="#"><img src="" alt=" "></a></li>
	                <li><a href="#"><img src="" alt=" "></a></li>
	                <li><a href="#"><img src="" alt=" "></a></li>
	                <li><a href="#"><img src="" alt=" "></a></li>
	            </ul>
	        </div>
	    </div>
	</nav>
</header>