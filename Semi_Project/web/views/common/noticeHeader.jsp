<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>



<style>
.notice-header a {
   color: black;
   cursor: pointer;
   text-decoration: none;
}

div a {
   color: black;
   cursor: pointer;
   text-decoration: none;
}

.notice-header {
   margin: 120px 0 0 0;
}

.notice-header hr {
   border: solid 1px darkgray;
   margin-right:80%;
   width:150px;
}

.notice-header h4 {
   color: black;
}

#map table {
   cellpadding: 0;
   cellspacing: 0;
   width: 100px;
   
}

#map table td {
   border: 1px solid #cecece;
}

#map table td img {
   width: 150px;
   height: 180px;
   border: 0px;
   vertical-align: top;
}

.notice-header ol, .col-sm-2 ol a {
   color: black;
}

.dropdown-toggle {
   data-toggle: dropdown;
   role: button;
   aria-expanded: false;
}

.notice-header .dropdown-toggle {
   color: black;
}
</style>

<script>
   
   

   function a_click() {
      alert("로그인후 이용해주세요");
   loaction.href="<%=request.getContextPath()%>/notice/firstNotice";
   }
</script>


<div class="container">
   <div class="col-sm-12 col-md-3 notice-header">

      <h5>
         <span class="glyphicon glyphicon-phone-alt" aria-hidden="true">
            <a href="<%=request.getContextPath()%>/notice/firstNotice"><strong>고객센터</strong></a>
         </span>
      </h5>
      <hr>
     

      <%if(logined!=null){%>
  
      
         <a href="<%=request.getContextPath()%>/qna/qnaListMain"><strong>1:1문의</strong></a>
         <hr/>
        
         <a href="<%=request.getContextPath()%>/absence/page"><strong>희망도서 신청</strong></a> 
      <%}else {%>
        
         <a onclick="a_click();"><strong>1:1문의</strong></a>
          <hr/>
         
         <a onclick="a_click();"><strong>희망도서 신청</strong></a>
      <%}%>
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
      <br/><br/><br/>
     </div>