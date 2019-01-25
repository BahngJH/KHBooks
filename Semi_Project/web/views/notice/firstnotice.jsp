<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

%>
<%@ include file="/views/common/noticeHeader.jsp"%>



<style>
.notice1 a{color:black;}
 a{color:black; cursor:pointer;text-decoration:none;}

.QAtitle, .QAtitle a {
	color: black;
}

#QAtitle2 a {height: 200px; color: black;}


.QAtitle{
border-bottom:2px solid darkgray;

}

.notice1{
margin:50px 0 0 0 ;
border-bottom:2px solid darkgray;

}
.Notice_Title a{text-decoration:none;}

</style>
<section>

			<div class="col-sm-12 col-md-9">

				
				<div class="notice1">
					
						
							<h2 class="Notice_Title">
								<strong>공지사항</strong>
							</h2>
							<hr/>
					<h4><strong>*상세내용은 왼쪽에 공지사항 참조*</strong></h4>
					<hr/>	
                    <p> kh문고 시스템 점검 안내</p>
                    <hr/>
				    <p>개인정보처리방침 개정 안내</p>
                    <hr/>
                    <p>설 연휴기간 휴무 안내</p>
                    <hr/>
					<p>카드사용  안내</p>
                  
				</div>

				<br/> <br/><br/> <br/>
				<div class="QAtitle">
					
					<h2><strong>자주묻는질문</strong></h2>
					 <hr/>
                    <a href="<%=request.getContextPath()%>/views/notice/manyquestion.jsp">도서 주문후 얼마나 걸리나요?</a>
                    <hr/>
                    <a href="<%=request.getContextPath()%>/views/notice/manyquestion1.jsp">방문해서 수령 해야하나요?</a>
                    <hr/>
                    <a href="<%=request.getContextPath()%>/views/notice/manyquestion2.jsp">배송도 가능 한가요?</a>
					<hr/>
					<a href="<%=request.getContextPath()%>/views/notice/manyquestion3.jsp">부재도서 신청은 어떻게 하나요?</a>
                    <hr/>
                    <a href="<%=request.getContextPath()%>/views/notice/manyquestion4.jsp">방문결제도 가능한가요?</a>
                    

				</div>
				<br> <br> <br>
				<div id="QAtitle2">
					<h2><strong>고객센터 안내사항</strong></h2>
					<hr>
					<p >서점 이용시간 평일 10:00~18:00</p>
					<hr>
					<p>고객센터 운영시간 평일 10:00~18:00</p>
					<hr/>
					<p>주말은 휴무입니다.</p>
					<hr/>
					<p>하단에 전화번호로 연락주세요</p>
					<hr/>

				</div>
				<br> <br> 
			</div>

			
		

</section>

</div>

<%@include file="/views/common/footer.jsp"%>