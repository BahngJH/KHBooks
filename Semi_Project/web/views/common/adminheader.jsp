<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/views/common/header.jsp"%>
<style>

.col-sm-2 a {
   color: black;
   cursor: pointer;
   text-decoration: none;
}

.col-sm-2 {
   margin: 80px 0 0 0;
}



.col-sm-2 h4 {
   color: black;
}

</style>





  <div class="container">
   <div class="col-sm-2">

      <h4>
          <span class="glyphicon glyphicon-home" aria-hidden="true"></span> <strong>관리자 페이지</strong>
      </h4>
      <hr/>
       <a href="<%=request.getContextPath()%>/admin/book"><strong>도서정보</strong></a>
      <hr/>
      <a href="<%=request.getContextPath()%>/admin/member"><strong>회원정보</strong></a>
      <hr/>

		
	  <a herf=""><strong>도서신청 목록</strong></a>
	  <hr/>

      
     <a href="<%=request.getContextPath()%>/book/appendlist"><strong>도서신청 목록</strong></a>
     <hr/>

      <a href="<%=request.getContextPath()%>/qna/qnaListAdmin"><strong>1대 1문의</strong></a>
      <hr/>
      </div>
      <div>
