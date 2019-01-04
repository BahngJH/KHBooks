<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ include file="/views/common/header.jsp"%>
 

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/Notice.css">

<body>
<div class="container">
                <div class="row header">
                    <div class="col-sm-11">
<br>
<br>
		     </div>
                </div>
        <div class="sidemenu">
            <div class="nav col-lg-2">
                <h2>고객센터</h2>
                <hr>
                           
                <ol id="a"><strong>게시판</strong>
                    <br>
                    <br>
                   <A href="http://www.naver.com" style="text-decoration:none" target="_blank">
                        <li>자유게시판</li>
                    </A>
                    <a href="" style="text-decoration:none">
                        <li>1:1문의 게시판</li>
                    </a>
              
                </ol>
               
                <hr>
                <a href="<%=request.getContextPath() %>/notice/bookrequest.jsp" id="a1" style="text-decoration:none"><strong>도서신청</strong></a>
                <hr>

                <a  id="a2" style="text-decoration:none"><strong>공지사항</strong></a>
                <hr>
                <div class="surve-tag">
                        <address>
                            ㈜ **문고  서울시 종로구 종로 1  <br>
                            대표이사 : <br />
                            사업자등록번호 :123-4514<br />
                            대표전화 : 222222222(발신자 부담전화)<br>
                               팩스 : 222222-222 (지역번호공통)<br />
                          
                        </address>
                    </div>




            </div>
          
            <div class="article col-lg-9">
                
                <div id="notice">
                    <section id="books_notice" class="Footer_Notice">
                        <article class="Notice">
                            <h2 class="Notice_Title">
                                <a class="Notice_PageLink" href="/support/notice">
                                		    공지사항
                                    <span class="icon-arrow_1_right Notice_PageLink_ArrowIcon"></span>
                                </a>
                            </h2>
                            <marquee direction=up height="20px" scrollamount='1'onmouseover=this.stop() onmouseout=this.start()>
                                <ul class="Notice_List">
                                    <li class="Notice_Item jsNoticeItem">
                                        <a class="Notice_Item_DetailLink" href="/support/notice/711">[안내] 고객센터 단축운영 공지사항</a>
                                    </li>
                                    <li class="Notice_Item jsNoticeItem">
                                        <a class="Notice_Item_DetailLink" href="/support/notice/779">[업데이트] iOS 앱
                                            v8.11.0</a>
                                    </li>
                                    <li class="Notice_Item jsNoticeItem">
                                        <a class="Notice_Item_DetailLink" href="/support/notice/773">[리디셀렉트] 안드로이드 앱 내에서 셀렉트 사용 가능</a>
                                    </li>
                                    <li class="Notice_Item jsNoticeItem">
                                        <a class="Notice_Item_DetailLink" href="/support/notice/772">[업데이트] 안드로이드 앱
                                            v9.0.0</a>
                                    </li>
                                    <li class="Notice_Item jsNoticeItem">
                                        <a class="Notice_Item_DetailLink" href="/support/notice/768">[리디셀렉트] 마이 셀렉트 도서 수 제한 해제</a>
                                    </li>
                                    <li class="Notice_Item jsNoticeItem">
                                        <a class="Notice_Item_DetailLink" href="/support/notice/767">[업데이트] PC/Mac 뷰어 v2.5.5</a>
                                    </li>
                                    <li class="Notice_Item jsNoticeItem">
                                        <a class="Notice_Item_DetailLink" href="/support/notice/754">[안내] 도서구입비 소득공제 적용일정 안내</a>
                                    </li>

                                </ul>
                            </marquee>
                        </article>
                    </section>
                </div>
                <br>
                <br>
                <div class="QAtitle">
                    <h3>자주묻는질문</h3>
                    <hr>
                    <a href=""  style="text-decoration:none">도서 주문후 얼마나 걸리나요?</a>
                    <hr>
                    <a href=""  style="text-decoration:none">방문해서 수령 해야하나요?</a>
                    <hr>
                    <a href=""  style="text-decoration:none">배송도 가능 한가요?</a>

                </div>
                <br>
                <br>
                <br>
                <div id="QAtitle2">
                    <h2>고객센터 안내사항</h2>
                    <hr>
                    <a href="" style="text-decoration:none">고객센터 단축운영 공지사항</a>
                    <hr>
                    <a href="" style="text-decoration:none">고객센터 운영시간 평일 10:00 ~18:00</a>

                </div>
                <br>
                <br>
                <div class="row footer">
                    <div class="col-sm-11">



                    </div>
                </div>
             
</div>


</body>

<%@include file="/views/common/footer.jsp"%>