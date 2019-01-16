<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


<style>
	div.container{margin-top: 100px;}
	nav.myNav ul{line-height: 3em; text-align:center;}
	nav.myNav li a {
		font-family: Georgia, "맑은 고딕", serif;
		font-weight: bold;
		display: inline;
		margin: 0 auto;
		color: black;
	}
	ul.nav hr{border: solid 1px darkgray;width: 100%; text-align: left; margin-left: 0px;}
	
	
</style>

<div class="container">
	<div class= "row section">
		<div class="col-sm-2">
			<nav class="myNav">
				<ul class="nav nav-pills nav-stacked">
					<li><h4><span class="glyphicon glyphicon-home" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/member/myHome">마이 홈</h4></a></li>
	               <hr/>
	                <li><a href="<%=request.getContextPath()%>/member/buyList">구매 목록</a></li>
	                <li><a href=""> 장바구니</a></li>
	                <li><a href=""> 찜 목록</a></li>
	                <li><a href="<%=request.getContextPath()%>/member/updateInfo"> 정보 변경</a></li>
	                <li><a href="<%=request.getContextPath()%>/member/review">리뷰 관리</a></li>
	                <li><a href="">1:1 문의</a></li>
				</ul>
			</nav>
		</div>