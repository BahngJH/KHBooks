<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/noticeHeader.jsp"%>

<style>
hr {
	border: 0;
	height: 1px;
	background: #ccc;
}

.select_area {
	margin: 7px 0 20px;
	margin-top: 7px;
	margin-right: 0px;
	margin-bottom: 20px;
	margin-left: 0px;
	padding: 16px 19px;
	padding-top: 16px;
	padding-right: 19px;
	padding-bottom: 16px;
	padding-left: 19px;
	background: #f6f6f6;
	background-image: initial;
	background-position-x: initial;
	background-position-y: initial;
	background-size: initial;
	background-repeat-x: initial;
	background-repeat-y: initial;
	background-attachment: initial;
	background-origin: initial;
	background-clip: initial;
	background-color: rgb(246, 246, 246);
	border: 1px solid #e9e9e9;
	border-top-color: rgb(233, 233, 233);
	border-top-style: solid;
	border-top-width: 1px;
	border-right-color: rgb(233, 233, 233);
	border-right-style: solid;
	border-right-width: 1px;
	border-bottom-color: rgb(233, 233, 233);
	border-bottom-style: solid;
	border-bottom-width: 1px;
	border-left-color: rgb(233, 233, 233);
	border-left-style: solid;
	border-left-width: 1px;
	border-image-source: initial;
	border-image-slice: initial;
	border-image-width: initial;
	border-image-outset: initial;
	border-image-repeat: initial;
	line-height: 24px;
	color: #555;
}

li {
	list-style: none;
}

#askPart {
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
	
}
</style>





<!-- 최상단  -->

<section id="board-container">
	 <div class="col-sm-9" id="askPartRadio">
		 <div class="row">
			 <h3 class="title">1:1 문의(관리자화면)</h3>
			 <hr>
		 </div>
		
<!-- 상담 개인정보 입력 div -->
			<div class="row">	
			 	<div class="select_area col-md-12">									
			 		<div class="form-group">
			  		 	<label for="askSection">상담구분</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
			 		 	<label id="askPart" for="askSection"></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						  
			  		</div>                                                     
            	 	<hr/>                                
				 	<div class="form-group">
				 	<ul><li>
				   		<label for="exampleInputName2">ID</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   		<input type="text" name="qnaWriter" class="form-control" id="exampleInputName2" value="<%=logined.getMemberId()%>" readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   		<label for="">이메일로 답변을 받아보시겠습니까?</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;					   			
		 		 		<input type="radio" name="qnaAnswer"  class="form-control"  value="yes" checked /><label for="">예</label>&nbsp;&nbsp;&nbsp;
			 		 	<input type="radio" name="qnaAnswer"  class="form-control"  value="no"/><label for="">아니오</label>
	 		 		</li></ul>			 		 	
				   	</div> 				   			   	
				    <hr/>	 			 
				 	<div class="form-group">
					   <label for="emailInput">Email</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					   <input  type="text" name="mail1" class="form-control input_style10" id="emailInput" value="" maxlength="20"  readonly>&nbsp; @&nbsp;												  
					   <input type="text" name="mail2" id="inputMail" name="" class="form-control" value="" readonly>&nbsp;&nbsp;&nbsp;&nbsp;
					   <select id="mailCho" title="이메일 서비스 도메인 선택" name="emailsel" class="select_style01 form-control" onChange="javascript:setMail(this.options[this.selectedIndex].value);" setimage="https://simage.kyobobook.co.kr/newimages/apps/b2c/common/i_SelectArrow.gif"  >
							<option selected>선택</option>
							<option  value="hanmail.net">hanmail.net</option>
							<option  value="hotmail.com">hotmail.com</option>
							<option  value="naver.com">naver.com</option>
							<option  value="yahoo.co.kr">yahoo.co.kr</option>
							<option  value="paran.com">paran.com</option>
							<option  value="gmail.com">gmail.com</option>
							<option  value="nate.com">nate.com</option>
							<option  id="self" value="">직접입력</option>
					  </select>								   
					</div>
					<hr/>	 																	 
				  	<div class="form-group">
					   <label for="tele">연락처</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					   <label for="telopt_1"><input id="telopt_1" type="radio"  name="telopt"  value="1" onclick="selMenu2(this.value)" />전화번호</label>&nbsp;&nbsp;&nbsp;															
		               <label for="telopt_2"><input id="telopt_2" type="radio"  name="telopt"  value="2" checked onclick="selMenu2(this.value)"/> 휴대폰번호</label>&nbsp;&nbsp;&nbsp;	                 
		               <select id="pho1" title="휴대폰 사업자 식별번호" name="tel1" class="select_style01 form-control"  >					
						</select>	-                 			
						<input title="일반전화 국 번호" type="text" name="tel2" value="" class="tel form-control" style="width:80px;" maxlength="4" readonly > -
						<input title="일반전화 가입자 번호" type="text" name="tel3" value="" class="tel form-control" style="width:80px; "  maxlength="4" readonly >
		 			</div>
		 			<hr/>
		 			<div class="form-group">
			  		 	<label for="">제목</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
			 		 	<input type="text" name="qnaTitle" style="width:450px;  class="form-control"  readonly />				  
			  		</div>  
		 			<hr/>
		 			<div class="form-group">
			  		 	<label for="">내용</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
			 		 	<textarea id="askContent" class="noresize" rows="7" cols="60" name="qnaContent" readonly /></textarea>			  
			  		</div> 
		 			<hr/>
		 			<div class="form-group">
			  		 	<label for="">첨부파일</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
			 		 	<input type="file" name="upfile" class="" />	  
			  		</div>			  		 			  		
		 			<hr/>
		 			<div class="form-group">
			  		 	<label for="">답변하기(관리자)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
			 		 	<textarea id="askContent" class="noresize" rows="7" cols="60" name="qnaContent" required="required" /></textarea>			  
			  		</div> 
		 			 <button type="submit" class="btn_sub btn btn-default">답장하기</button>
                     <button type="submit" class="btn_sub btn btn-default">삭제</button>	
                     <button type="submit" class="btn_sub btn btn-default">수정</button>	 								 		 				 		          
				</div>				
		 	</div>	 	      
    	 </form>
   </div>
 </section>
</div>




</div>
<%@ include file="/views/common/footer.jsp"%>