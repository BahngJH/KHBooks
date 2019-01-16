<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.kh.member.model.vo.Member" %>    
<%
	Member logined=null;
	logined = (Member)session.getAttribute("logined");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH Books</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css" type="text/css">
    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script>
    	function fn_search(){
    		var keyword = $("#keyword").val().trim().length;
    		
    		if(keyword === 0){
    			return false;
    		}
    		
    		return true;   
    	}
    	function goLogin()
    	{
    		location.href="<%=request.getContextPath()%>/member/login";	
    	}
    	function goEnroll()
    	{
    		location.href="<%=request.getContextPath()%>/member/enroll";		
    	}
    	function goLogout()
    	{
    		location.href="<%=request.getContextPath()%>/member/logout";		
    	}
    
    	
    </script>
</head>
<body>
	<header>
		<nav class="navbar navbar-default navbar-fixed-top">
	    	<div class="container-fluid">
	        	<div class="navbar-header">
	        	<!-- 카테고리 버튼 -->
	            	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">
		                <span class="sr-only">Toggle navigation</span>
		                <span class="icon-bar"></span>
		                <span class="icon-bar"></span>
		                <span class="icon-bar"></span>
		            </button>
		            <a class="navbar-brand" href="<%=request.getContextPath()%>/"><strong>KH BOOKS</strong></a>
		            <div class="dropdown" style="display: inline">
		                <button class="btn btn-default dropdown-toggle navbar-btn" data-toggle="dropdown" role="button" aria-expanded="false" id="category">카테고리<span class="caret"></span></button>
		                <ul class="dropdown-menu" role="menu" aria-labelledby="category">
		                    <li><a href="#">소설</a></li>
		                    <li><a href="#">경제</a></li>
		                    <li><a href="#">인문</a></li>
		                    <li><a href="#">역사</a></li>
		                    <li><a href="#">여행</a></li>
		                    <li><a href="#">컴퓨터/IT</a></li>
		                    <li><a href="#">외국어</a></li>
		                    <li><a href="#">과학</a></li>
		                    <li><a href="#">건강</a></li>
		                    <li><a href="#">어린이</a></li>
		                </ul>
	            	</div>
	        	</div>
		        <!-- 상단 검색창 -->
		        <div class="collapse navbar-collapse" id="navbar-collapse-1">
			        <div class="row">
			            <form class="form-controll navbar-right" id="navSearchFrm" role="search" action="<%=request.getContextPath()%>/search/search" method="get" onsubmit="fn_search();">
			                <div class="form-group">
			                    <div class="input-group">
			                        <input type="text" class="form-control" name="keyword" id="keyword" placeholder="검색">
			                        <span class="input-group-btn">
			                            <button type="submit" class="btn btn-default" id="searchBar">검색</button>
			                        </span>
			                    </div>
			                </div>
			            </form>
			        </div>
			        <div class="row" id="nav-buttons">
			            <!-- 우측 버튼 -->
			            <%if(logined==null){ %>
			            <ul class="nav navbar-nav navbar-right nav-button">
			                <li><button type="button" class="btn btn-default navbar-btn" onclick="goLogin();">로그인</button>
			                    <button type="button" class="btn btn-default navbar-btn" onclick="goEnroll();">회원가입</button></li>
			                <li><a href="<%=request.getContextPath()%>/member/myHome"><img src="<%=request.getContextPath()%>/images/icons/person2.png" alt="마이페이지"></a></li>
			                <li><a href="<%=request.getContextPath()%>/member/buyList"><img src="<%=request.getContextPath()%>/images/icons/basket2.png" alt="장바구니"></a></li>
			                <li><a href="#"><img src="<%=request.getContextPath()%>/images/icons/wishlist2.png" alt="찜 목록"></a></li>
			            </ul>
			            <%}else{ %>
			            <ul class="nav navbar-nav navbar-right nav-button">
			                <li><button type="button" class="btn btn-default navbar-btn" onclick="goLogout();">로그아웃</button></li>
			                <li><a href="<%=request.getContextPath()%>/member/myHome"><img src="<%=request.getContextPath()%>/images/icons/person2.png" alt="마이페이지"></a></li>
			                <li><a href="<%=request.getContextPath()%>/member/buyList"><img src="<%=request.getContextPath()%>/images/icons/basket2.png" alt="장바구니"></a></li>
			                <li><a href="#"><img src="<%=request.getContextPath()%>/images/icons/wishlist2.png" alt="찜 목록"></a></li>
			            </ul>
			            <%} %>
		        	</div>
		        </div>
	    	</div>
		</nav>
	</header>