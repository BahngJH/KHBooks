<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/oneOnOne.css">

<div class="container">

	<div class="col-md-offset-1 col-md-10">
		<h3 class="title">1:1 문의</h3>
		<hr>
	</div>
	
	<div class="col-md-offset-1 col-md-10">
	<p>상담 하시고자 하는 구분을 선택해주세요.</p>
	</div>

	<div class="select_area col-md-offset-1 col-md-10">
							
							
							
							<ul class="num01">
								<li><input type="radio" name="adcDvsnCodeRdo" class="radio" id="radio01" value="005"  label="회원정보.서비스" onclick="setAdcDvsnCodeRdo(this)" /> <label for="radio01">회원정보.서비스</label></li>
								<li><input type="radio" name="adcDvsnCodeRdo" class="radio" id="radio21" value="008"  label="서양도서 검색.주문" onclick="setAdcDvsnCodeRdo(this)"/> <label for="radio21">서양도서 검색.주문</label></li>
								<li><input type="radio" name="adcDvsnCodeRdo" class="radio" id="radio12" value="002"  label="검색기능 관련" onclick="setAdcDvsnCodeRdo(this)"/> <label for="radio12">검색기능 관련</label></li>
								<li><input type="radio" name="adcDvsnCodeRdo" class="radio" id="radio04" value="007"  label="시스템불편사항" onclick="setAdcDvsnCodeRdo(this)"/> <label for="radio04">시스템불편사항</label></li>
							</ul>
						
							
							
							<ul class="num02">
								<li><input type="radio" name="adcDvsnCodeRdo" class="radio" id="radio06" value="004"  label="도서.상품정보" onclick="setAdcDvsnCodeRdo(this)"/> <label for="radio06">도서.상품정보</label></li>
								<li><input type="radio" name="adcDvsnCodeRdo" class="radio" id="radio03" value="009"  label="일본도서 검색.주문" onclick="setAdcDvsnCodeRdo(this)"/> <label for="radio03">일본도서 검색.주문</label></li>
								<li><input type="radio" name="adcDvsnCodeRdo" class="radio" id="radio08" value="006"  label="웹사이트이용관련" onclick="setAdcDvsnCodeRdo(this)"/> <label for="radio08">웹사이트이용관련</label></li>
								<li><input type="radio" name="adcDvsnCodeRdo" class="radio" id="radio09" value="013"  label="고객제안/친절불친절" onclick="setAdcDvsnCodeRdo(this)"/> <label for="radio09">고객제안/친절불친절</label></li>
							</ul>
						
							<ul class="num03">
								<li><input type="radio" name="adcDvsnCodeRdo" class="radio" id="radio11" value="001"  label="주문.결제" onclick="setAdcDvsnCodeRdo(this)"/> <label for="radio11">주문.결제</label></li>
								<li><input type="radio" name="adcDvsnCodeRdo" class="radio" id="radio02" value="014"  label="파본.상품불량신고" onclick="setAdcDvsnCodeRdo(this)"/> <label for="radio02">파본.상품불량신고</label></li>
								<li><input type="radio" name="adcDvsnCodeRdo" class="radio" id="radio15" value="000"   label="배송.수령일 안내" onclick="setAdcDvsnCodeRdo(this)"/> <label for="radio15">배송.수령일 안내</label></li>
							</ul>
							
						
						
							<ul class="col-sm-3">
								<li><input type="radio" name="adcDvsnCodeRdo" class="radio" id="radio18" value="shop"  label="매장 관련" onclick="setAdcDvsnCodeRdo(this)"/> <label for="radio18">매장관련</label></li>
								<li><input type="radio" name="adcDvsnCodeRdo" class="radio" id="radio20" value="003"  label="반품.교환.환불" onclick="setAdcDvsnCodeRdo(this)" /> <label for="radio20">반품.교환.환불</label></li>
							</ul>
						
							
							
		</div>
			
			
		<div class="select_area col-md-offset-1 col-md-10">		
			
			
			   <table class="table table-striped">
			 
			 	
							<caption>상담구분 정보</caption>
    
                          <tr class="border_none">
                               <th scope="row">상담구분</th>
                               <td class="font12"  id="adcDvsnName"></td>
                               <th scope="row"></th>
                           <td class="font12"  id="adcDvsnName"></td>
                          </tr>
    
                         
                          <tr>
			                  <th scope="row">이름</th>
		                   	  <td class="font12">이향원              </td>
					          <th scope="row" class="border_left">ID</th>
			                  <td class="font12">qoxnaos   </td>
	                      </tr>
						
							
					       <tr>
								<th scope="row">연락처</th>
								<td class="font12" >				
									<label for="telopt_1"><input id="telopt_1" type="radio"  name="telopt"  value="1" onclick="selMenu2(1)" />전화번호</label>&nbsp;&nbsp;&nbsp;															
								</td>
								<td>	
									<label for="telopt_2"><input id="telopt_2" type="radio"  name="telopt"  value="2" checked onclick="selMenu2(2)"/> 휴대폰번호</label>&nbsp;&nbsp;&nbsp;
								</td>	
								
								
								<td class="font12" colspan="2">
								<div id="titleImg21" style="display:none">
									<select title="일반전화 지역 번호" name="tel1" class="select_style01" 
										setcolor="#4d4d4d,#ffffff,#4d4d4d,#e6e4e4,#d5d5d5,#d5d5d5" setimage="https://simage.kyobobook.co.kr
										/newimages/apps/b2c/common/i_SelectArrow.gif" >
										
										<option value="02" >02</option><option value="031" >031</option><option value="032" >032</option><option value="033" >033</option><option value="041" >041</option><option value="042" >042</option><option value="043" >043</option><option value="044" >044</option><option value="051" >051</option><option value="052" >052</option><option value="053" >053</option><option value="054" >054</option><option value="055" >055</option><option value="061" >061</option><option value="062" >062</option><option value="063" >063</option><option value="064" >064</option><option value="0502" >0502</option><option value="0503" >0503</option><option value="0505" >0505</option><option value="0506" >0506</option><option value="0507" >0507</option><option value="0508" >0508</option><option value="070" >070</option>
									</select>
									-
									<input title="일반전화 국 번호" type="text" name="tel2" value="" class="input_style05" style="width:43px; padding:2 0 0 4" maxlength="4" required required_msg="연락처 정보가 없습니다. 연락처를 입력하세요."> -
									<input title="일반전화 가입자 번호" type="text" name="tel3" value="" class="input_style05" style="width:43px; padding:2 0 0 4"  maxlength="4" required required_msg="연락처 정보가 없습니다. 연락처를 입력하세요.">
								</div>
								<div id="titleImg22" style="display:block">
									<select title="휴대폰 사업자 식별번호" name="hp1" class="select_style01" 
										setcolor="#4d4d4d,#ffffff,#4d4d4d,#e6e4e4,#d5d5d5,#d5d5d5" setimage="https://simage.kyobobook.co.kr
										/newimages/apps/b2c/common/i_SelectArrow.gif" >
										
										<option value="010" selected>010</option><option value="011" >011</option><option value="016" >016</option><option value="017" >017</option><option value="018" >018</option><option value="019" >019</option><option value="0502" >0502</option><option value="0503" >0503</option><option value="0505" >0505</option><option value="0506" >0506</option><option value="0507" >0507</option><option value="0508" >0508</option>
									</select>
									-
									<input title="휴대폰 국 번호" type="text" name="hp2" value="2732" class="input_style05" style="width:43px; padding:2 0 0 4" maxlength="4" required required_msg="연락처 정보가 없습니다. 연락처를 입력하세요."> -
									<input title="휴대폰 가입자 번호" type="text" name="hp3" value="4798" class="input_style05" style="width:43px; padding:2 0 0 4"  maxlength="4" required required_msg="연락처 정보가 없습니다. 연락처를 입력하세요.">
								
								</div>
								</td>
							</tr>
							
							
							<tr>
								<th scope="row">이메일</th>
								<td colspan="3">
									<input title="이메일 사용자 아이디 입력" type="text" name="email1" value="qoxnaos" class="input_style10"  maxlength="20" required required_msg="E-Mail 정보가 없습니다. 입력하세요."> 
									<input title="이메일 서비스 도메인 입력" type="text" name="emailin" value="naver.com" class="input_style10" maxlength="20" required required_msg="E-Mail 정보가 없습니다. 입력하세요." disabled sync=email2>
									<input type="hidden" name="email2" value="naver.com">
									<select title="이메일 서비스 도메인 선택" name="emailsel" class="select_style01"  setcolor="#4d4d4d,#ffffff,#4d4d4d,#e6e4e4,#d5d5d5,#d5d5d5" setimage="https://simage.kyobobook.co.kr/newimages/apps/b2c/common/i_SelectArrow.gif" onChange="javascript:setMail(this.options[this.selectedIndex].value);" >
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
								</td>
							</tr>
							
		
			</table>	
							
        </div>




        <div class="select_area col-md-offset-1 col-md-10">		
        
         <table class="table table-striped">
			 
			
                          <tr class="border_none">
                               <th scope="row">제목</th>
                               <%-- <td><%=b.getBoardTitle() %></td> --%>
                               <td class="font12"  id="adcDvsnName"></td>
                               <th scope="row"></th>
                           <td class="font12"  id="adcDvsnName"></td>
                          </tr>
    
                         
                           <tr class="border_none">
                               <th scope="row">내용</th>
                               <%-- <td><%=b.getBoardTitle() %></td> --%>
                               <td class="font12"  id="adcDvsnName"></td>
                               <th scope="row"></th>
                           <td class="font12"  id="adcDvsnName"></td>
                          </tr>
                          
                          <tr class="border_none">
                               <th scope="row">첨부파일</th>
                               <%-- <td><%=b.getBoardTitle() %></td> --%>
                               <%-- 				<% if(b.getBoardReFile()!=null){%>
				<a href="javascript:fn_fileDownLoad('<%=b.getBoardReFile() %>', '<%=b.getBoardOriFile()%>');">			
				<img alt="첨부파일" src="<%=request.getContextPath() %>/images/file.png" width="16px" />			
				</a>
		
				<%=b.getBoardOriFile() %>
			
				<%} %>			
				</td> --%>
                            
	
			<tr>
				<th>내용</th>
				<%-- <td><%=b.getBoardContent() %></td> --%>
			
			<%-- <% if(loginMember.getMemberId().equals(b.getBoardWriter())||loginMember.getMemberId().equals("admin")){%> --%>
			

			</tr>
			</table>
				<div class="comment-deitor">
			
		<form action="<%=request.getContextPath()%>/board/commentInsert" name="boardCommentFrm" method="post">
		
<%-- 		<input type="hidden" name="boardRef" value="<%=b.getBoardNo() %>"/>
		<input type="hidden" name="boardCommentWriter" value="<%=loginMember.getMemberId() %>"/> --%>
		<input type="hidden" name="boardCommentLevel" value="1"/>
		<input type="hidden" name="boardCommentRef" value="0"/>
		<textarea cols='60' rows='3' name="boardCommentContent"></textarea>
		<button type="submit" id="btn-insert">등록</button>
		
		</form>		
	</div>
			

			<tr>
				<th colspan="2">	
				<input type="button" value="목록으로" onclick="fn_boardList()"/>
				<input type="button" value="수정하기" onclick="fn_updateBoard()"/>
				<input type="button" value="삭제하기" onclick="fn_deleteBoard()"/>
				
				</th>

			</tr>
<%-- <%} %> --%>
		
		

        
        
        
        
        
        </div>




</div>







<%@ include file="/views/common/footer.jsp"%>