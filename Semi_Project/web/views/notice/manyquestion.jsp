<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="/views/common/noticeHeader.jsp"%>
<style>
#return{
background-color: #555555;
color:white;
border: none;
 padding: 8px 20px;
   margin-top:100px;
   margin-left:370px;
   text-align:center;
}



#content{margin:100px 0 0 0; white-space: pre-line; }

</style>
<section>
	
			<div class="col-sm-12 col-md-9">
			<br/><br/><br/>
						<h2>도서주문후 얼마나 걸리나요?</h2>
						<hr/>
					<p>2019-1-20</p>
										
						
						
						<p id="content">도서 신청후 소요시간은 <br/>최대 3일~4일 후에 받아보실수 있습니다.<br/></p>
				
						
			

				<button id="return" onclick="main_Notice();">목록으로</button>
				<br/><br/><br/><br/>
		<script>
			function main_Notice(){
				location.href="<%=request.getContextPath()%>/notice/noticemain";
			}
			
	
		</script>
			
				
</section>
			</div>

<%@include file="/views/common/footer.jsp"%>