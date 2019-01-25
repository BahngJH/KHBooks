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
				
			
			
			
						<h2>배송도 가능한가요?</h2>
						<hr/>
					<p>2019-1-19</p>
										
						
						
						<p id="content">배송은 지원 하지 않습니다.<br/>
						매장 방문후 이용해 주시기 바랍니다.<br/>
						매장 위치는 고객센터 왼쪽하단에 있습니다.</p>
				
						
			

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