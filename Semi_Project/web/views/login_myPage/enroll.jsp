<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/enroll.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
	.msg{
		position:absolute;
		margin-left:20px;
		margin-top:9px;
		display:inline;
	}
</style>
</head>
<body>
 <div id="container">
        <div id="logo"><a href="#">KH BOOKS</a></div>
        <hr>

        <form method="POST" action="<%=request.getContextPath() %>/member/enrollEnd" name="enrollMember" onsubmit="return fn_enroll_validate();">
            <div id="inputId">
                <input type="text" id="id" name="memberId" placeholder="아이디 (소문자와 숫자로 6글자이상)" required><div id="idMsg" class="msg"></div>
               </div><br>
            <div id="inputPasswod"><input type="password" id="pw" name="memberPw" required placeholder="비밀번호 (6글자이상, 영문 숫자 특수문자 조합)"><div id="pwMsg" class="msg"></div><br>
                <input type="password" id="pw_ck" placeholder="비밀번호 확인"  required><div id="pwckMsg" class="msg"></div></div><br>
            <div id="inputName"><input type="text" id="name" required name="memberName" placeholder="이름"><div class="msg" id="nameMsg"></div></div>
            <input type="text" id="birth" name="birth" required placeholder="생년월일 ex)19830324"><div id="bthMsg" class="msg"></div><br>
            <input type="text" id="phone" name="phone" required placeholder="연락처 ('-'없이 입력)"><div id="phoneMsg" class="msg"></div><br>
            <div id="inputEmail"><input type="text" id="email" name="email" required name="createEmail" placeholder="이메일주소"><div id="emailMsg" class="msg"></div></div><br>

            <div id="checkGender">
                <input type="radio" name="gender" value="남" id="man" checked>
                <input type="radio" name="gender" value="여" id="woman">
                <label for="man">남자</label>
                <label for="woman">여자</label>
            </div><br>
            <input type="text" id="sample6_postcode" placeholder="우편번호" required="required">
            <input type="button" id="addrBtn" class="btn btn-default" onclick="addressPopup();" value="우편번호 찾기" ><br>
            <input type="text" id="sample6_address" placeholder="주소" name="address1" required="required"><br>
            <input type="text" id="sample6_extraAddress" placeholder="참고항목" required="required"><br>
            <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="address2" required="required">
            <br><br>
			<input type="hidden" value="0" id="idValid">
			<input type="hidden" value="0" id="pwValid">
			<input type="hidden" value="0" id="nameValid">
			<input type="hidden" value="0" id="birthValid">
			<input type="hidden" value="0" id="phoneValid">
			<input type="hidden" value="0" id="emailValid">
			
            <!-- <input type="button" onclick="addressPopup();" value="주소입력">
            <input type="text" id="address" name="createAddress" required placeholder="주소"><br><br> -->

            <table border="1" align="center">
                <tr>
                    <th><input type="checkbox" id="checkAll" onclick="cAll();"><label for="c0">전체 약관 동의</label></th>
                </tr>
                <tr>
                    <th><input type="checkbox" id="c1" required><label for="c1">이용약관(필수)</label><a href="https://ridibooks.com/legal/terms"
                            target="_blank">약관정보</a><br>
                        <input type="checkbox" id="c2" required><label for="c2">개인정보처리 동의(필수)</label><a href='https://ridibooks.com/legal/privacy'
                            target="_blank">약관정보</a><br>
                        <input type="checkbox" id="c3" required><label for="c3">개인정보 제3자 제공 동의(필수)</label><a href="https://ridibooks.com/legal/privacy"
                            target="_blank">약관정보</a><br>
                        <input type="checkbox" id="c4"><label for="c4">이벤트혜택 알림 수신동의(선택)</label></th>
                </tr>
            </table><br>
            <input type="button" class="btn btn-default" onclick="bReset();" value="취소">
            <input type="submit" id="complete" class="btn btn-primary" value="가입">
        </form>
    </div>
    <script>
    $(function(){
    	//blur로 이름 체크
    	$('#name').blur(function(){
    		var name = $('#name').val();
            var nameck = /^[가-힣]{2,5}$/g;
            if(!nameck.test(name)){
            	$('#nameMsg').html("한글만 입력해주세요");
                //alert("한글만 입력해 주세요");
                $('#name').css("border","4px solid red");
                return;
            }
            $('#name').css("border","4px solid blue");
            $('#nameMsg').html("좋습니다!");
            $('#nameValid').val(1);
    	});
    	
    	//아이디 체크
    	$('#id').blur(function(){
    		var id = $('#id').val();
            var idck = /^[a-z]+[a-z0-9]{5,19}$/g;
            if(!idck.test(id)){
            	$('#idMsg').html("다시 입력하세요");
                //alert("소문자로 시작, 5글자 이상해주세요");
                $('#id').css("border","4px solid red");
                return;
            }
            $('#id').css("border","4px solid blue");	
            $('#idMsg').html("좋습니다!");
            $('#idValid').val(1);
    	});
    	
    	//패스워드 체크
    	$('#pw').blur(function(){
    		var pw = $('#pw').val();
            var pwck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}/;
            if(!pwck.test(pw)){
                //alert("6글자 이상, 영문,숫자,특수문자를 조합해주세요");
                $('#pwMsg').html("다시 입력하세요");
                $('#pw').css("border","4px solid red");
                return;
            }
            $('#pw').css("border","4px solid blue");
            $('#pwMsg').html("좋습니다!");
            $('#pwValid').val(1);
    	});
    	
    	//패스워크 확인 체크
    	$('#pw_ck').blur(function(){
    		var pw = $('#pw').val();
            var pw_ck = $('#pw_ck').val();
            if(pw!=pw_ck){
                //alert("비밀번호가 서로 다릅니다");
                $('#pwckMsg').html("다시 입력하세요");
                $('#pw_ck').css("border","4px solid red");
                return;
            }
            $('#pw_ck').css("border","4px solid blue");	
            $('#pwckMsg').html("일치합니다!");
    	});
    	
    	//생년월일 체크
    	$('#birth').blur(function () {
            if ($("#birth").val().length != 8 ) {
                //alert("생년월일을 다시 입력하세요");
	                $('#bthMsg').html("다시 입력하세요");
	                $("#birth").val('');
	                $('#birth').css("border","4px solid red");
	                return;
            }
            $('#birth').css("border","4px solid blue");	
            $('#bthMsg').html("좋습니다!");
            $('#birthValid').val(1);
        });
    	
    	//연락처 체크
    	$('#phone').blur(function(){
    		if($("#phone").val().length!=11){
    			$('#phoneMsg').html("다시 입력하세요");
    			$('#phone').css("border","4px solid red");
    			return;
    		}
    		 $('#phone').css("border","4px solid blue");	
             $('#phoneMsg').html("좋습니다!");
             $('#phoneValid').val(1);
    	});
    	
    	//이메일 체크
    	$('#email').blur(function(){
    		var email = $('#email').val();
            var emailck= /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if(!emailck.test(email)){
                //alert("6글자 이상, 영문,숫자,특수문자를 조합해주세요");
                $('#emailMsg').html("다시 입력하세요");
                $('#email').css("border","4px solid red");
                return;
            }
            $('#email').css("border","4px solid blue");
            $('#emailMsg').html("좋습니다!");
            $('#emailValid').val(1);
    	});
    	
    });
    
    //전체 약관 동의로직
        function cAll() {
            if ($("#checkAll").is(':checked')) {
                $("input[type=checkbox]").prop("checked", true);
            } else {
                $("input[type=checkbox]").prop("checked", false);
            }
        }

    	//히든값들이 전부 1로 체크되었는지 확인
        function fn_enroll_validate() {
            $('input[type=hidden]').each(function(index,item){
            	if(item.value==0){
            		alert("정상값을 넣고 회원가입해 주세요");
            		return false;
            	}
            	return true;
            });
        }
		function bReset(){
			$('input[type=text]').val("");
			$('input[type=password]').val("");
			
		}
    	
    </script>

    <!-- 다음 주소api 적용 -->
    <script>
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
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;

                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();

                }
            }).open();
        }
    </script>
</body>
</html>