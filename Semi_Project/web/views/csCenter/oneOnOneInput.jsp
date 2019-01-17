<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>


<%@ include file="/views/common/noticeHeader.jsp"%>

<%
Member m = (Member)request.getSession().getAttribute("logined");
String mail1 []=m.getEmail().split("@");
%>

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
			 <h3 class="title">1:1 문의</h3>
			 <hr>
		 </div>
		 
		 <div class="row">
		   <p>상담 하시고자 하는 구분을 선택해주세요.</p>
		 </div>
	     <form class="form-inline" name="enrollAsk" action="<%=request.getContextPath()%>/qna/qnaInputFormEnd" onsubmit="return validate();" method="post" enctype="multipart/form-data">
		  <!--상담 구분 라디오 버튼 div -->
	        <div class="row">
			 	 <div class="select_area col-md-12">
            		<div class="row" id="ra"> 
						<ul class="num01 col-sm-4">
							<li><input type="radio" name="qanPart"  id="radio1" value="회원정보.서비스"  onclick="setAdcDvsnCodeRdo(this.value)" /> <label for="radio1">회원정보.서비스</label></li>						
							<li><input type="radio" name="qanPart"  id="radio2" value="배송.수령일 안내"  onclick="setAdcDvsnCodeRdo(this.value)"/> <label for="radio2">배송.수령일 안내</label></li>
						    <li><input type="radio" name="qanPart"  id="radio3" value="매장관련"  onclick="setAdcDvsnCodeRdo(this.value)"/> <label for="radio3">매장관련</label></li>
						</ul>
						<ul class="num02 col-sm-4">
							<li><input type="radio" name="qanPart"  id="radio4" value="도서.상품정보"  onclick="setAdcDvsnCodeRdo(this.value)"/> <label for="radio4">도서.상품정보</label></li>
							<li><input type="radio" name="qanPart"  id="radio5" value="웹사이트이용관련"  onclick="setAdcDvsnCodeRdo(this.value)"/> <label for="radio5">웹사이트이용관련</label></li>						
						    <li><input type="radio" name="qanPart"  id="radio6" value="반품.교환.환불"  onclick="setAdcDvsnCodeRdo(this.value)" /> <label for="radio6">반품.교환.환불</label></li>
						</ul>
						<ul class="num03 col-sm-4">
							<li><input type="radio" name="qanPart"  id="radio7" value="주문.결제"  onclick="setAdcDvsnCodeRdo(this.value)"/> <label for="radio7">주문.결제</label></li>
							<li><input type="radio" name="qanPart"  id="radio8" value="파본.상품불량신고"  onclick="setAdcDvsnCodeRdo(this.value)"/> <label for="radio8">파본.상품불량신고</label></li>
							<li><input type="radio" name="qanPart"  id="radio9" value="기타"  onclick="setAdcDvsnCodeRdo(this.value)"/> <label for="radio9">기타</label></li>
						</ul>
				  	</div>
				</div>
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
					   <input  type="text" name="mail1" class="form-control input_style10" id="emailInput" value="<%=mail1[0] %>" maxlength="20"  required_msg="E-Mail 정보가 없습니다. 입력하세요.">&nbsp; @&nbsp;												  
					   <input type="text" name="mail2" id="inputMail" name="" class="form-control" value="<%=mail1[1] %>" readonly>&nbsp;&nbsp;&nbsp;&nbsp;
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
						<input title="일반전화 국 번호" type="text" name="tel2" value="" class="tel form-control" style="width:80px;" maxlength="4" required > -
						<input title="일반전화 가입자 번호" type="text" name="tel3" value="" class="tel form-control" style="width:80px; "  maxlength="4" required >
		 			</div>
		 			<hr/>
		 			<div class="form-group">
			  		 	<label for="">제목</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
			 		 	<input type="text" name="qnaTitle" style="width:450px;  class="form-control"  required="required" />				  
			  		</div>  
		 			<hr/>
		 			<div class="form-group">
			  		 	<label for="">내용</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
			 		 	<textarea id="askContent" class="noresize" rows="7" cols="60" name="qnaContent" required="required" /></textarea>			  
			  		</div> 
		 			<hr/>
		 			<div class="form-group">
			  		 	<label for="">첨부파일</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
			 		 	<input type="file" name="upfile" class="" />	  
			  		</div>			  		 			  		
		 			<hr/>
		 			<button type="submit" class="btn_sub btn btn-default">Send invitation</button>		 								 		 				 		          
				</div>				
		 	</div>	 	      
    	 </form>
   </div>
 </section>
</div>








<script>
	/* 상담 구분 선택 함수 */

	function setAdcDvsnCodeRdo(value) {
		var val = value;
		document.getElementById("askPart").innerText = val;
	}

	/* 메일 선택 함수 */
	function setMail() {

		var mailCho = document.getElementById("mailCho");

		var selValue = mailCho.options[mailCho.selectedIndex].value;

		var inputMail = document.getElementById("inputMail");

		inputMail.value = selValue;

		var self = document.getElementById("self").value;

		if (selValue === '') {
			inputMail.readOnly = false;
			inputMail.focus();

		} else {
			inputMail.readOnly = true;

		}

	}

	/* 010 기본선택자 함수 */
	$(function() {
		selMenu2(2);
	});

	/* 연락처 선택 함수 */
	function selMenu2(value) {
		var v = value;
		var phone;
		//document.getElementById(id).style.display = "";
		//document.getElementById('pho1').style.display = "none";
		if (v == 1) {
			phone += '<option value="02" >02</option>';
			phone += '<option value="031" >031</option>';
			phone += '<option value="032" >032</option>';
			phone += '<option value="033" >033</option>';
			phone += '<option value="041" >041</option>';
			phone += '<option value="042" >042</option>';
			phone += '<option value="043" >043</option>';
			phone += '<option value="044" >044</option>';
			phone += '<option value="051" >051</option>';
			phone += '<option value="052" >052</option>';
			phone += '<option value="053" >053</option>';
			phone += '<option value="054" >054</option>';
			phone += '<option value="055" >055</option>';
			phone += '<option value="061" >061</option>';
			phone += '<option value="062" >062</option>';
			phone += '<option value="063" >063</option>';
			phone += '<option value="064" >064</option>';
			phone += '<option value="0502" >0502</option>';
			phone += '<option value="0503" >0503</option>';
			phone += '<option value="0505" >0505</option>';
			phone += '<option value="0506" >0506</option>';
			phone += '<option value="0507" >0507</option>';
			phone += '<option value="0508" >0508</option>';
			phone += '<option value="070" >070</option> ';
		} else if (v == 2) {
			//document.getElementById(id).style.display = "";
			//document.getElementById('pho2').style.display = "none";			
			phone += '<option value="010" selected>010</option>';
			phone += '<option value="011" >011</option>';
			phone += '<option value="016" >016</option>';
			phone += '<option value="017" >017</option>';
			phone += '<option value="018" >018</option>';
			phone += '<option value="019" >019</option>';
			phone += '<option value="0502" >0502</option>';
			phone += '<option value="0503" >0503</option>';
			phone += '<option value="0505" >0505</option>';
			phone += '<option value="0506" >0506</option>';
			phone += '<option value="0507" >0507</option>';
			phone += '<option value="0508" >0508</option>';
		}
		$('#pho1').html(phone);
	}

	/* 숫자만 입력받게 하는 함수 */
	$('.tel').on('keyup', function() {
		if (/\D/.test(this.value)) {
			this.value = this.value.replace(/\D/g, '')
			alert('숫자만 입력가능합니다.');
		}
	});

	 function validate() {
		var content = $('textArea[name=qnaContent]').val();
		var qnaPart = $("#ra input[type='radio']:checked").val();

		if (qnaPart == null) {
			alert("상담 구분을 선택해주세요")
			document.getElementById("askPartRadio").scrollIntoView();
			return false;
		}
		
		return true;
	} 
</script>






<%@ include file="/views/common/footer.jsp"%>