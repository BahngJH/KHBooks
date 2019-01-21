<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>



<style>
.col-sm-2 a {
   color: black;
   cursor: pointer;
   text-decoration: none;
}

a {
   color: black;
   cursor: pointer;
   text-decoration: none;
}

.col-sm-2 {
   margin: 120px 0 0 0;
}

.col-sm-2 hr {
   border: solid 1px darkgray;
}

.col-sm-2 h4 {
   color: black;
}

#map table {
   cellpadding: 0;
   cellspacing: 0;
   width: 150px;
}

#map table td {
   border: 1px solid #cecece;
}

#map table td img {
   width: 180px;
   height: 200px;
   border: 0px;
   vertical-align: top;
}

.col-sm-2 ol, .col-sm-2 ol a {
   color: black;
}

.dropdown-toggle {
   data-toggle: dropdown;
   role: button;
   aria-expanded: false;
}

.col-sm-2 .dropdown-toggle {
   color: black;
}
</style>

<script>
   
   $(document).ready(function() {

       $("#side").click(function() {

         $(this).next("ul").toggleClass("hide");
      });
   });
   

   function a_click() {
      alert("로그인후 이용해주세요");
   loaction.href="<%=request.getContextPath()%>/notice/firstNotice";
   }
</script>


<div class="container">
   <div class="col-sm-2">

      <h4>
         <span class="glyphicon glyphicon-phone-alt" aria-hidden="true">
            <strong>고객센터</strong>
         </span>
      </h4>
      <hr>
      <a class="dropdown-toggle" id="side"><strong>게시판</strong><span
         class="caret"></span></a>


      <%if(logined!=null){%>
      <ul class="hide">
         <br />
         <li><%if(logined.getMemberId().equals("admin")){%>
         <a href="<%=request.getContextPath()%>/qna/qnaListAdmin">1:1 문의 목록(관리자)</a>
        <%} else if(logined!=null){%></li>
       
         <a href="<%=request.getContextPath()%>/qna/qnaListMain">1:1 문의 목록(사용자)</a>
      <%} %>
         <br />
         <li><a href="<%=request.getContextPath()%>/absence/page">희망도서 신청 목록</a></li>

      </ul>
      <%}else {%>

      <ul class="hide">
         <br />
         <li><a onclick="a_click();">1:1문의</a></li>
         <br />
         <li><a onclick="a_click();">희망도서 신청</a></li>

      </ul>
      <%}%>

      <hr>
      <a href=""><strong>도서신청</strong></a>
      <hr>



      <a href="<%=request.getContextPath()%>/notice/noticemain"><strong>공지사항</strong></a>
      <hr />

      <br /> <br /> <br /> <br />
      <div id="map">
         <table>
            <tr>
               <td><a
                  href="https://map.naver.com/?__pinOnly=false&query=&searchCoord=&menu=location&tab=1&lng=a24cfea0fc4db7f9f4e3b955eadc8593&__fromRestorer=true&mapMode=0&mpx=af51abfe49113423a260cedd1e8f63f9b1619d19c679be4b3d3fe32d5adfb54341116eb5a386f56e955a59b6cb2517aa&pinId=11525091&pinType=site&lat=9d1007022b17059c3db21b29a1ecce8a&dlevel=11&enc=b64"
                  target="_blank"> <img
                     src="http://prt.map.naver.com/mashupmap/print?key=p1547133542722_-789146433" /></a>
               </td>
            </tr>

         </table>
      </div>
