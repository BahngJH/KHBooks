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
</head>
<body>
 <div id="container">
        <div id="logo"><a href="#">KH BOOKS</a></div>
        <hr>

        <form method="POST" action="login.html" name="createMember" onsubmit="return fn_enroll_validate();">
            <div id="inputId">
                <input type="text" id="id" name="createId" placeholder="아이디" required>
                <input type="hidden" value="0" name="idValid"></div><br>
            <div id="inputPasswod"><input type="password" id="password" name="createPassword" required placeholder="비밀번호"><br>
                <input type="password" id="password_ck" required placeholder="비밀번호 확인"></div><br>
            <div id="inputEmail"><input type="email" id="email" required name="createEmail" placeholder="이메일주소"></div><br>
            <div id="inputName"><input type="text" id="name" required name="createName" placeholder="이름"></div>
            <input type="text" id="birth" name="createBirth" required placeholder="생년월일 ex)19830324">
            <br><br>
            <div id="checkGender">
                <input type="radio" name="gender" id="man" checked>
                <input type="radio" name="gender" id="woman">
                <label for="man">남자</label>
                <label for="woman">여자</label>
            </div>
            <br>
            <input type="text" id="phone" name="createPhone" required placeholder="연락처 ('-'없이 입력)"><br>
            <br>
            <input type="text" id="sample6_postcode" placeholder="우편번호">
            <input type="button" id="addrBtn" class="btn btn-default" onclick="addressPopup();" value="우편번호 찾기"><br>
            <input type="text" id="sample6_address" placeholder="주소"><br>
            <input type="text" id="sample6_extraAddress" placeholder="참고항목"><br>
            <input type="text" id="sample6_detailAddress" placeholder="상세주소">
            <br><br>

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
            <input type="button" class="btn btn-default" onclick="" value="뒤로가기">
            <input type="submit" id="complete" class="btn btn-primary" value="가입완료">
        </form>
    </div>
    <script>
        function cAll() {
            if ($("#checkAll").is(':checked')) {
                $("input[type=checkbox]").prop("checked", true);
            } else {
                $("input[type=checkbox]").prop("checked", false);
            }
        }

        function fn_enroll_validate() {
            if ($('#idValid').val() == 0) {
                alert("아이디 중복검사를 해주세요.");
                return false;
            }
            //id값을 이용하여 입력된 id를 받아오는데 양쪽 공백을 제거한 상태로 가져옴.
            var id = $('#id').val().trim();
            if (!id || id.length < 4) {
                alert("아이디를 4글자이상 사용해주세요");
                return false;
            }
            return true;
        }

        $(function () {
            $("#password_ck").blur(function () {
                var pw = $('#password').val();
                var pw2 = $('#password_ck').val();
                if (pw != pw2) {
                    alert('비밀번호가 일치하지 않습니다');
                    $('#password_ck').val('');
                }
            });
        });
        $(function () {
            $('#birth').blur(function () {
                if ($("#birth").val().length != 8) {
                    alert("생년월일을 다시 입력하세요");
                    $("#birth").val('');
                }
            });
        });

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