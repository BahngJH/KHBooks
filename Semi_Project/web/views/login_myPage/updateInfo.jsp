<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/myHeader.jsp"%>
<%
	Member member = (Member)request.getAttribute("member");
%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
	article.checkAccount{margin-top: 50px;}
	div.input-group {width: 40%;}
	
	div.updateInfo table.tbl-updateInfo {
		width: 100%;
		height: 100%;
		border-collapse: collapse;
	}
	div.updateInfo table.tbl-updateInfo th {
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    background: #f3f6f7;
	    text-align: right;
	    width: 15%
	}

	div.updateInfo table.tbl-updateInfo td {
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	}
	.btn-update{
		float:right;
	}
	.msg{
		display: inline;
		margin-left:30px;
	}
	#addrBtn{
		float:right;
	}
	#sample6_address{
		width: 350px;
	}
</style>

		<div class="col-sm-10">
			<section>
				<h4>정보 변경</h4>
				<article class="checkAccount">
					<!-- <h6>보안을 위해 비밀번호를 한번 더 입력해주세요</h6>
					<div class="input-group">
						<input type="text" class="form-control" name="btn-search" aria-describedby="basic-addon2"/>
						<span class="input-group-addon" id="basic-addon2">비밀번호 입력</span>
					</div> -->
				</article>
				
				<article class="updateInfo-container">
					<div class="updateInfo">
						<form class="form-inline" role="form" name="updateFrm">
							<table class="tbl-updateInfo table-bordered">
								<tr>
									<th>이름</th>
									<td>
										<input type="hidden" name="memberName" value="<%=logined.getMemberName()%>">
										<span><%=logined.getMemberName() %></span>
										<button onclick="fn_deleteMember();" type="button" class="btn btn-primary" style="float : right;">회원탈퇴</button>
									</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td>
										<input type="hidden" name="memberId" value="<%=logined.getMemberId()%>">
										<%=logined.getMemberId()%>
									</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td>
										<input type="hidden" name="birth" value="<%=logined.getBirth()%>">
										<%=logined.getBirth() %>
									</td>
								</tr>
								<tr>
									<th>휴대폰</th>
									<td>
										<div>
											<input type="text" class="form-control" id="phone" name="phone" value ="<%=logined.getPhone()%>"><div id="phoneMsg" class="msg"></div>
										</div>
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
										<div>
											<input type="text" class="form-control" id="email" name="email" value ="<%=logined.getEmail()%>"><div id="emailMsg" class="msg"></div>
										</div>
									</td>
								</tr>
								<tr>
									<th>비밀번호 변경</th>
									<td>
										<input type="password" id="pw" name="memberPwNew" class="form-control" placeholder="새 비밀번호"/><div id="pwMsg" class="msg"></div>
										<br/><br/>
										<input type="password" id="pw_ck" class="form-control" placeholder="새 비밀번호 확인"/><div id="pwckMsg" class="msg"></div>
										<br>
										<h4><b>비밀변호 변경시 주의사항</b></h4>
										<p>1.비밀번호는 6글자 이상</p>
										<p>2.비밀번호는 영문자 숫자 특수기호를 조합하여 구성</p>
									</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>
										<input type="text" class="form-control" id="sample6_address" name="address" value="<%=logined.getAddress()%>">
										<input type="button" id="addrBtn" class="btn btn-default" onclick="addressPopup();" value="주소 찾기" >
									</td>
								</tr>
							</table><br>
							<button class="btn-update btn btn-primary" type="button" onclick="fn_updateInfo();">변경 완료</button>
						</form>
						<script>
						
						// 회원 탈퇴 메소드
						function fn_deleteMember() {
							if(!confirm('정말로 탈퇴하시겠습니까?'))
							{
								return;	
							}
							location.href = "<%=request.getContextPath()%>/member/deleteMember?no=<%=member.getMemberNum()%>";
						}
						
						
						//데이터 발송전 데이터 체크 함수
							function fn_updateInfo(){
								//휴대폰 체크
								if($("#phone").val().length!=11){
					    			$('#phoneMsg').html("다시 입력하세요");
					    			$('#phoneMsg').css("color","red");
					    			return;
					    		}
					             $('#phoneMsg').html("");
					             
					             //email 체크
					             /* var email = $('#sample6_address').val();
					             var emailck= /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
					             if(!emailck.test(email)){					               
					                 $('#emailMsg').html("다시 입력하세요");
					                 $('#emailMsg').css("color","red");
					                 return;
					             }					           
					             $('#emailMsg').html(""); */
					             
								
								//비밀번호 조건에 부합하는지 확인
								var pw = $('#pw').val();
					            if(pw.length>0){
					            var pwck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}/;
					            if(!pwck.test(pw)){
					                $('#pwMsg').html("다시 입력하세요");
					                $('#pwMsg').css("color","red");
					                return;
					            }
					            $('#pwMsg').html("");
					            }
					            
					            //비밀번호 같은지 체크
					            var pw = $('#pw').val();
					            var pw_ck = $('#pw_ck').val();
					            if(pw!=pw_ck){	
					                $('#pwckMsg').html("비밀번호가 일치하지 않습니다.");
					                $('#pwckMsg').css("color","red");
					                return;
					            }	
					            $('#pwckMsg').html("");
					            
					            //주소가 있는지 없는지 체크
					            var addr = $('#sample6_address').val().trim();
					            if(addr.length<1){
					            	$('#sample6_address').css("border","1px solid red");
					            	return;
					            }
					            document.updateFrm.action="<%=request.getContextPath()%>/member/updateInfoEnd"
					            document.updateFrm.method="post"
					            document.updateFrm.submit();
							            
      
							} 
							
							//다음 주소 api 
							function addressPopup() {
					            new daum.Postcode({
					                oncomplete: function (data) {
					                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
					                    // 예제를 참고하여 다양한 활용법을 확인해 보세요.
					                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
					                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					                    var addr = ''; // 주소 변수
					                    var extraAddr = ''; // 참고항목 변수

					                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					                        addr = data.roadAddress;
					                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
					                        addr = data.jibunAddress;
					                    }

					                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					                    if (data.userSelectedType === 'R') {
					                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
					                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					                            extraAddr += data.bname;
					                        }
					                        // 건물명이 있고, 공동주택일 경우 추가한다.
					                        if (data.buildingName !== '' && data.apartment === 'Y') {
					                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					                        }
					                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					                        if (extraAddr !== '') {
					                            extraAddr = ' (' + extraAddr + ')';
					                        }

					                    } else {
					                        document.getElementById("sample6_extraAddress").value = '';
					                    }

					                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
					                   // document.getElementById('sample6_postcode').value = data.zonecode;
					                    document.getElementById("sample6_address").value = addr;
					                    // 커서를 상세주소 필드로 이동한다.
					                   // document.getElementById("sample6_detailAddress").focus();

					                }
					            }).open();
					        }
						</script>
					</div>
				</article>
			</section>	
		</div>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>