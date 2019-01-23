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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>KH Books</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">
    
    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
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
		            <a class="navbar-brand" href="<%=request.getContextPath() %>/main/mainview"><strong>KH BOOKS</strong></a>
		            <div class="dropdown" style="display: inline">
		                <button class="btn btn-default dropdown-toggle navbar-btn" data-toggle="dropdown" role="button" aria-expanded="false" id="category">카테고리<span class="caret"></span></button>
		                <ul class="dropdown-menu" role="menu" aria-labelledby="category">
		                	<%//전체 카테고리
			              	String[] genres = {"소설", "경제", "인문", "역사", "여행", "컴퓨터/IT", "외국어", "과학", "건강", "어린이"};
			                for(String g: genres){%>
			            		<li><a href="<%=request.getContextPath()%>/search/category?category=<%=g%> "><%=g %></a></li>    
			          	<%}%> 
		                </ul>
		            
	            	</div>
	        	</div>
		        <!-- 상단 검색창 -->
		        <a class="navbar-brand" href="<%=request.getContextPath() %>/inforconpare_hwang/conpareView"><strong><span style='color:pink;'>Conpare Books</span></strong></a>
		        <div class="collapse navbar-collapse" id="navbar-collapse-1">
			        <div class="row">
			            <form class="form-controll navbar-right" id="navSearchFrm" role="search" action="<%=request.getContextPath()%>/search/search" method="get" onsubmit="fn_search();">
			                <div class="form-group">
			                    <div class="input-group">
			                        <input type="text" class="form-control" name="keyword" id="keyword" onkeyup="searchPreview();" autocomplete="off" placeholder="검색">
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
			                <li><a href="<%=request.getContextPath()%>/member/wishlist"><img src="<%=request.getContextPath()%>/images/icons/basket2.png" alt="장바구니"></a></li>
			                <li><a href="<%=request.getContextPath()%>/member/mark"><img src="<%=request.getContextPath()%>/images/icons/wishlist2.png" alt="찜 목록"></a></li>
			            </ul>
			            <%}else{ %>
			            <ul class="nav navbar-nav navbar-right nav-button">
			                <li><button type="button" class="btn btn-default navbar-btn" onclick="goLogout();">로그아웃</button></li>
			               <%if(logined.getMemberId().equals("admin")){%> 
			               <li><a href="<%=request.getContextPath()%>/admin/mainview"><img src="<%=request.getContextPath()%>/images/icons/person2.png" alt="마이페이지"></a></li>
			              <% } else{%> 
			                <li><a href="<%=request.getContextPath()%>/member/myHome"><img src="<%=request.getContextPath()%>/images/icons/person2.png" alt="마이페이지"></a></li>
			                <%} %>
			                <li><a href="<%=request.getContextPath()%>/member/wishlist?memberNum=<%=logined.getMemberNum()%>"><img src="<%=request.getContextPath()%>/images/icons/basket2.png" alt="장바구니"></a></li>
			                <li><a href="<%=request.getContextPath()%>/member/mark?memberNum=<%=logined.getMemberNum()%>"><img src="<%=request.getContextPath()%>/images/icons/wishlist2.png" alt="찜 목록"></a></li>
			            </ul>
			            <%} %>
		        	</div>
		        </div>
	    	</div>
		</nav>
	</header>
<script>
	function searchPreview(){
		let keyword = $("#keyword").val();
				
		$("#keyword").autocomplete({
			source: function(request, response){
		   		$.ajax({
		   			type : "get",
		   			url: "<%=request.getContextPath()%>/search/preview",
		   			dataType: "json",
		   			data:{
		   				keyword : keyword
		   			},
		   			success : function(result){
		   				//json 안에 객체들이 저장 되어 있고
		   				//객체 내에서 책 이름만 반복문으로 가져옴 
		   				var datas = [];
		   				
		   				for(var data in result){
		   					datas[datas.length] = result[data].bookName;
		   				}
		   				
		   				response(datas);
		   			},
		   			focus: function(event, ui){
		   				return false;
		   			},
		   		});
			},
  		minLength : 1,
		select: function(event, ui){
			location.href="<%=request.getContextPath()%>/search/search?keyword=" + ui.item.value;
		}
		});
	}
</script>