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
        <div id="logo"><a href="<%=request.getContextPath()%>/views/main/main.jsp">KH BOOKS</a></div>
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
            <input type="button" id="addrBtn" class="btn btn-default" onclick="addressPopup();" value="주소 찾기" ><br>
            <input type="text" id="sample6_address" placeholder="주소" name="address1" required="required"><br>
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
                        <!-- <input type="checkbox" id="c4"><label for="c4">이벤트혜택 알림 수신동의(선택)</label> --></th>
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
    		var img = $('<img></img>').attr("src","/Semi_Project/images/icons/blueCheck2.png");
    		var blue = 0;
    		var name = $('#name').val();
            var nameck = /^[가-힣]{2,5}$/g;
            if(!nameck.test(name)){
            	$('#nameMsg').html("한글만 입력해주세요");
                $('#name').css("border","4px solid #F15F5F");
                blue=0;
                return;
            }
            $('#name').css("border","4px solid #6799FF");
            $('#nameValid').val(1);
            if(blue==0){
            $('#nameMsg').html(" ");
            $('#nameMsg').append(img);
            blue=1;
            }
    	});
    	
    	//아이디 체크
    	//먼저 아이디 조합 조건을 체크 후 조건에 부합하면 ajax로 중복여부 확인
    	$('#id').blur(function(){
    		var img = $('<img></img>').attr("src","/Semi_Project/images/icons/blueCheck2.png");
    		var blue=0;
    		var id = $('#id').val().trim();
            var idck = /^[a-z]+[a-z0-9]{5,19}$/g;
            if(!idck.test(id)){
            	$('#idMsg').html("다시 입력하세요");
                $('#id').css("border","4px solid #F15F5F");
                blue=0;
                return;
            }
            
            //AJAX로 아이디 중복 구현
            $.ajax({
            	url:"<%=request.getContextPath()%>/member/overlapCheck",
            	data:{"searchId":id},
            	Type:"get",
            	success:function(data){
            		var id = data;
            		console.log("ajax반환값 : "+data);
            		if(id.length>1){
            			$('#idMsg').html("중복된 아이디가 존재합니다.");
                        $('#id').css("border","4px solid #F15F5F");
                        $('#idMsg').css("color","red");
                        blue=0;
                        return;
            		}else{
            			$('#id').css("border","4px solid #6799FF");
            			
                        $('#idMsg').html("");
                        $('#idValid').val(1);
                        blue=1;
            		}
            	}
            });
            
            
            
    	});
    	
    	//패스워드 체크
    	$('#pw').blur(function(){
    		var img = $('<img></img>').attr("src","/Semi_Project/images/icons/blueCheck2.png");
    		var blue=0;
    		var pw = $('#pw').val();
            var pwck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}/;
            if(!pwck.test(pw)){
                $('#pwMsg').html("다시 입력하세요");
                $('#pw').css("border","4px solid #F15F5F");
                blue=0;
                return;
            }
            $('#pw').css("border","4px solid #6799FF");
            $('#pwValid').val(1);
            if(blue==0){
            	$('#pwMsg').html(" ");
                $('#pwMsg').append(img);
                blue=1;
            }
    	});
    	
    	//패스워크 확인 체크
    	$('#pw_ck').blur(function(){
    		var img = $('<img></img>').attr("src","/Semi_Project/images/icons/blueCheck2.png");
    		var blue=0;
    		var pw = $('#pw').val();
            var pw_ck = $('#pw_ck').val();
            if(pw!=pw_ck){
                $('#pwckMsg').html("다시 입력하세요");
                $('#pw_ck').css("border","4px solid #F15F5F");
                blue=0;
                return;
            }
            $('#pw_ck').css("border","4px solid #6799FF");	
            if(blue==0){
            	$('#pwckMsg').html(" ");
                $('#pwckMsg').append(img);
                blue=1;
            }
    	});
    	
    	//생년월일 체크
    	$('#birth').blur(function () {
    		var img = $('<img></img>').attr("src","/Semi_Project/images/icons/blueCheck2.png");
    		var blue=0;
            if ($("#birth").val().length != 8 ) {
	                $('#bthMsg').html("다시 입력하세요");
	                $('#birth').css("border","4px solid #F15F5F");
	                blue=0;
	                return;
            }
            $('#birth').css("border","4px solid #6799FF");	
            $('#birthValid').val(1);
            if(blue==0){
            	$('#birthMsg').html(" ");
                $('#birthMsg').append(img);
                blue=1;
            }
        });
    	
    	//연락처 체크
    	$('#phone').blur(function(){
    		var img = $('<img></img>').attr("src","/Semi_Project/images/icons/blueCheck2.png");
    		var blue=0;
    		if($("#phone").val().length!=11){
    			$('#phoneMsg').html("다시 입력하세요");
    			$('#phone').css("border","4px solid #F15F5F");
    			blue=0;
    			return;
    		}
    		 $('#phone').css("border","4px solid #6799FF");	
             $('#phoneValid').val(1);
             if(blue==0){
             	$('#phoneMsg').html(" ");
                $('#phoneMsg').append(img);
                blue=1;
             }
    	});
    	
    	//이메일 체크
    	$('#email').blur(function(){
    		var img = $('<img></img>').attr("src","/Semi_Project/images/icons/blueCheck2.png");
    		var blue=0;
    		var email = $('#email').val();
            var emailck= /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if(!emailck.test(email)){
                $('#emailMsg').html("다시 입력하세요");
                $('#email').css("border","4px solid #F15F5F");
                blue=0;
                return;
            }
            $('#email').css("border","4px solid #6799FF");
            $('#emailValid').val(1);
            if(blue==0){
            	$('#emailMsg').html(" ");
                $('#emailMsg').append(img);
                blue=1;
            }
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
    		var count =1;
            $('input[type=hidden]').each(function(index,item){
            	if(item.value==0){
            		/* alert("정상값을 넣고 회원가입해 주세요");
            		return false; */
            		count=0;
            	}
            });
            //밖에다 조건을 걸어줘야지 each문안에 조건을 걸어주면 제대로 안먹힌다.
        	if(count==0){
        		alert("정상값을 넣고 회원가입해 주세요");
        		return false;
        	}else{
        		return true;
        	}
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