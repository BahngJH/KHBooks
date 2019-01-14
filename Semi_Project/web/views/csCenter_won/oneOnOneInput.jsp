<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>


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


</style>

<section id="board-container">

	 <div class="container">
  
		 <div class="row">
			 <h3 class="title">1:1 문의</h3>
			 <hr>
		 </div>
		
		 <div class="row">
		   <p>상담 하시고자 하는 구분을 선택해주세요.</p>
		 </div>

	  <form class="form-inline" action="<%=request.getContextPath()%>/board/boardFormEnd" method="post" enctype="multipart/form-data">
	  
				        <div class="row">
						 	 <div class="select_area col-md-offset-1 col-md-10">
			      
	                  			<div class="row">
									<ul class="num01 col-sm-4">
										<li><input type="radio" name="adcDvsnCodeRdo"  id="radio01" value="005"  label="회원정보.서비스" onclick="setAdcDvsnCodeRdo(this)" /> <label for="radio01">회원정보.서비스</label></li>						
										<li><input type="radio" name="adcDvsnCodeRdo"  id="radio04" value="007"  label="시스템불편사항" onclick="setAdcDvsnCodeRdo(this)"/> <label for="radio04">시스템불편사항</label></li>
									    <li><input type="radio" name="adcDvsnCodeRdo"  id="radio18" value="shop"  label="매장 관련" onclick="setAdcDvsnCodeRdo(this)"/> <label for="radio18">매장관련</label></li>
									</ul>
								
									
									
									<ul class="num02 col-sm-4">
										<li><input type="radio" name="adcDvsnCodeRdo"  id="radio06" value="004"  label="도서.상품정보" onclick="setAdcDvsnCodeRdo(this)"/> <label for="radio06">도서.상품정보</label></li>
										<li><input type="radio" name="adcDvsnCodeRdo"  id="radio08" value="006"  label="웹사이트이용관련" onclick="setAdcDvsnCodeRdo(this)"/> <label for="radio08">웹사이트이용관련</label></li>						
									    <li><input type="radio" name="adcDvsnCodeRdo"  id="radio20" value="003"  label="반품.교환.환불" onclick="setAdcDvsnCodeRdo(this)" /> <label for="radio20">반품.교환.환불</label></li>
									</ul>
								
									<ul class="num03 col-sm-4">
										<li><input type="radio" name="adcDvsnCodeRdo"  id="radio11" value="001"  label="주문.결제" onclick="setAdcDvsnCodeRdo(this)"/> <label for="radio11">주문.결제</label></li>
										<li><input type="radio" name="adcDvsnCodeRdo"  id="radio02" value="014"  label="파본.상품불량신고" onclick="setAdcDvsnCodeRdo(this)"/> <label for="radio02">파본.상품불량신고</label></li>
										<li><input type="radio" name="adcDvsnCodeRdo"  id="radio15" value="000"   label="배송.수령일 안내" onclick="setAdcDvsnCodeRdo(this)"/> <label for="radio15">배송.수령일 안내</label></li>
									</ul>
								</div>
								
				</div>
		</div>
		
		<div class="row">	
				<div class="select_area col-md-offset-1 col-md-10">
			   
					    <div class="form-group">
						   <label for="askSection">상담구분</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			  
						 </div> 
					 
					 <hr/>
						 <div class="form-group">
						   <label for="exampleInputName2">Name</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						   <input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">
						 </div> 
						 			 
					 <hr/>	 
					 
						 <div class="form-group">
						   <label for="emailInput">Email</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						   <input type="text" class="form-control input_style10" id="emailInput" placeholder="이메일 사용자 아이디 " maxlength="20" required required_msg="E-Mail 정보가 없습니다. 입력하세요.">&nbsp; @&nbsp;								
						   <input type="text" name="" class="form-control" value="">
							<select title="이메일 서비스 도메인 선택" name="emailsel" class="select_style01 form-control"  setcolor="#4d4d4d,#ffffff,#4d4d4d,#e6e4e4,#d5d5d5,#d5d5d5" setimage="https://simage.kyobobook.co.kr/newimages/apps/b2c/common/i_SelectArrow.gif" onChange="javascript:setMail(this.options[this.selectedIndex].value);" >
									<option selected>선택</option>
									<option  value="hanmail.net">hanmail.net</option>
									<option  value="hotmail.com">hotmail.com</option>
									<option  value="naver.com">naver.com</option>
									<option  value="yahoo.co.kr">yahoo.co.kr</option>
									<option  value="paran.com">paran.com</option>
									<option  value="gmail.com">gmail.com</option>
									<option  value="nate.com">nate.com</option>
									<option value="non">직접입력</option>
							</select>								   
						 </div>
						 
					 <hr/>	 
						 
						 

						 
					 
						  <div class="form-group">
							   <label for="tele">연락처</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							   <label for="telopt_1"><input id="telopt_1" type="radio"  name="telopt"  value="1" onclick="selMenu2(this.value,'pho2')" />전화번호</label>&nbsp;&nbsp;&nbsp;															
			                   <label for="telopt_2"><input id="telopt_2" type="radio"  name="telopt"  value="2" checked onclick="selMenu2(this.value,'pho1')"/> 휴대폰번호</label>&nbsp;&nbsp;&nbsp;
			                   
			                   <select id="pho1" title="휴대폰 사업자 식별번호" name="hp1" class="select_style01 form-control" setcolor="#4d4d4d,#ffffff,#4d4d4d,#e6e4e4,#d5d5d5,#d5d5d5" setimage="https://simage.kyobobook.co.kr/newimages/apps/b2c/common/i_SelectArrow.gif" >
									<option value="010" selected>010</option>
									<option value="011" >011</option>
									<option value="016" >016</option>
									<option value="017" >017</option>
									<option value="018" >018</option>
									<option value="019" >019</option>
									<option value="0502" >0502</option>
									<option value="0503" >0503</option>
									<option value="0505" >0505</option>
									<option value="0506" >0506</option>
									<option value="0507" >0507</option>
									<option value="0508" >0508</option>
								</select>
			                   
							   <select id="pho2" style="display:none;" title="일반전화 지역 번호" name="tel1" class="select_style01 form-control" 	setcolor="#4d4d4d,#ffffff,#4d4d4d,#e6e4e4,#d5d5d5,#d5d5d5" setimage="https://simage.kyobobook.co.kr/newimages/apps/b2c/common/i_SelectArrow.gif" >
									<option value="02" >02</option>
									<option value="031" >031</option>
									<option value="032" >032</option>
									<option value="033" >033</option>
									<option value="041" >041</option>
									<option value="042" >042</option>
									<option value="043" >043</option>
									<option value="044" >044</option>
									<option value="051" >051</option>
									<option value="052" >052</option>
									<option value="053" >053</option>
									<option value="054" >054</option>
									<option value="055" >055</option>
									<option value="061" >061</option>
									<option value="062" >062</option>
									<option value="063" >063</option>
									<option value="064" >064</option>
									<option value="0502" >0502</option>
									<option value="0503" >0503</option>
									<option value="0505" >0505</option>
									<option value="0506" >0506</option>
									<option value="0507" >0507</option>
									<option value="0508" >0508</option>
									<option value="070" >070</option>
								</select> -
								
									<input title="일반전화 국 번호" type="text" name="tel2" value="" class="form-control input_style05 .col-xs-4" style="width:60px; padding:2 0 0 4" maxlength="4" required required_msg="연락처 정보가 없습니다. 연락처를 입력하세요." > -
									<input title="일반전화 가입자 번호" type="text" name="tel3" value="" class="form-control input_style05" style="width:60px; padding:2 0 0 4"  maxlength="4" required required_msg="연락처 정보가 없습니다. 연락처를 입력하세요." >
	                		
														
					    </div>					 		 
		 		          
				</div>				
       </div>


<script>

function selMenu2(v, id){
	
	if(v==1){	
		document.getElementById(id).style.display="";
		document.getElementById('pho1').style.display="none";
		
	}else if(v==2){
		document.getElementById(id).style.display="";
		document.getElementById('pho2').style.display="none";
		
	}
	
}


	
	
/* 	var selNo=document.getElementById("telopt_1");
	var val=selNo.options[selNo.selectedIndex].value; 
	
	if(val==1){
		document.all['pho1'].style.display='';
		document.all['pho2'].style.display='none';
	}else{
		document.all['pho1'].style.display='none';
		document.all['pho2'].style.display=''; */
		
	
	
	/* var selNo=1[1.selectedIndex].value;
	var tel2="";
	if(selNo !="010")
	
	if(val ) */
	
		
	


/* 

function selMenu2(1){		

	var selectedNo=$('[name=telopt]').val();
	
	if(selectedNo==1){

}


function selMenu2(2){
	
	
}
 */


</script>


    <div class="row">
           <div class="select_area col-md-offset-1 col-md-10">		
    
 	           <table class='table table-striped'>
		 
		                  <tr>
			                  <th scope="row">제목</th>
		                   	  <td class="font12"><input type="text" name="title"  class="form-control" style="text-align:center; width:350px; height:25px; letter-spacing: -5px" required="required" /></td>	
		                   	  <th scope="row"></th>
                              <td class="font12"  id="adcDvsnName"></td>			    
	                      </tr>
	                      
	                      
	                      <tr>
			                  <th scope="row">내용</th>
		                   	  <td class="font12"><textarea textarea class="noresize" rows="5" cols="47" name="content" required="required" /></textarea></td>	
		                   	  <th scope="row"></th>
                              <td class="font12"  id="adcDvsnName"></td>			    
	                      </tr>
	                      
	                      
	                      <tr>
			                  <th scope="row">첨부파일</th>
		                   	  <td class="font12"><input type="file" name="upfile" class="" /></td>	
		                   	  <th scope="row"></th>
                              <td class="font12"  id="adcDvsnName"></td>			    
	                      </tr>
	                      
	                
	                      
	                      <tr>
				             <th colspan="2"></th>
				             <th scope="row"><button type="submit" class="btn_sub btn btn-default" onclick="return validate();">Send invitation</button></th>
                             <td class="font12"  id="adcDvsnName"></td>	                          
			              </tr>
	                    
	 	
		          </table>
	
	           </div>
	     </div>
	      
      </form>
   </div>
</section>
   
   
   
   



<%@ include file="/views/common/footer.jsp"%>