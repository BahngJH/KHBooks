<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/noticeHeader.jsp"%> 



<style>

 hr {
    border: 0;
    height: 2px;
    background: #ccc;
  }



.control-label{
	font-size: 1.2em;
	position: relative;
	top: 5px;

}


.form-control{
	position: relative;
	top: -1.5px;
	
}

 h3{
	text-font: 1em;
}

#map{
width: 50px;
}



</style>


<script>
function fn_enroll_validate(){
	
	var isbn=$("#isbn");
	if(isbn.val().length!=13){
		alert("잘못 입력하셨습니다. 13 숫자를 입력하세요.");
		isbn.focus();
		return false;
	}return true;
};

<%-- 
$(function(){
	$("#password_2").blur(function(){
		var p1=$("#password_").val(), p2=$("#password_2").val();
		
		if(p1!=p2){
			alert("패스워드가 일치하지 않습니다.");
			$('#password_2').val('');
			$('#password_').val('');
			$("password_").focus();
		}
	});
});




//아이디 중복겁사하기: 팝업창을 띄워서!


	function fn_checkeduplicate(){
		var userId=$("#is").val().trim();
		console.log(userId);
		
		if(!userId || userId.length<4)
		{
			alert("아이디를 4글자 이상 입력하세요~!");
			return;	
		}
		//팝업창에 대한 설정해주기!@
		var url="<%=request.getContextPath()%>/checkIdDuplicate";
		var title="checkIdDuplicate";
		var shape="left=200px, top=100px, width=300px, height=200px";
		
		var popup=open("",title,shape);
		
		//현재페이지에 있는값을 새창으로 옮기는 작업~!
		checkIdDuplicateFrm.userId.value=userId;
		//target은 내가 원하는 창을 뜻한다. pop 페이지에서 이 폼을 작동시키게 하는 구문. 
		//popup창에서 이 폼을 작동시키게 하는 구문!
		checkIdDuplicateFrm.target=title;
		checkIdDuplicateFrm.action=url;
		checkIdDuplicateFrm.method="post";
		checkIdDuplicateFrm.submit();		
		
		
		//window.open(url,"명칭/여는방식",shape)
}
 --%>
</script>






		<title>희망도서신청 -KH북스</title>
			<section id='enroll-container'>
				<div class="container col-md-offset-4 col-md-5">
					<div class="row">
						<h1>희망 도서 신청</h1>
						<hr/>
						<h3>도서검색</h3></br>
						<p> &nbsp; 한 항목만 입력하셔도 됩니다. </br>
						두 항목 이상 입력하시면 두 항목을 동시에 만족하는 상품을 찾습니다. </br>
						복합명사는 띄어쓰기를 하면 더 많은 검색 결과를 얻으실 수 있습니다.</p>
		            </div>
		         	<div class="row" >
						<form name="appendBookFrm" class="form-horizontal" action="<%=request.getContextPath()%>/appendBook/appendBookFormEnd" method="post" onsubmit="return fn_enroll_validate();">
							<table>
								<div class="form-group">
									<div class="col-sm-10">
										<input type="text" class="form-control" id="bookName" maxlength="20" placeholder="* 도서명" name="bookName" required="required">
									</div>
								</div>
								<div class="form-group">								
									<div class="col-sm-10">
										<input type="text" class="form-control" id="authorName" placeholder="* 저자" name="authorName"  maxlength="15" required="required">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-10">
										<input type="text" class="form-control" id="publisher" placeholder="출판사" name="publisher">
									</div>
								</div>
								<div class="form-group">							
									<div class="col-sm-10">								
										<select class="form-control" id="bookDate" name="bookDate">
											  <option selected>발행년도 선택</option>
											  <%for(int i=2019; i>=2000; i--){ %>
											  <option value="<%=i%>"><%=i+"년" %></option>
											  <%} %>													
										</select>													
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-10">
										<input type="number" class="form-control" id="isbn" placeholder="* ISBN 13자리 숫자만 입력하세요." name="isbn" maxlength="13" required="required">
									</div>
								</div>
								
								</br>
								<div class="form-group">
								
									<div class="bBtn col-sm-offset-2 col-sm-10" >
										<button type="submit" class="btn btn-default" onclick="return validate();">신청</button>
										<button type="reset" class="btn btn-default" onclick="return validate();">취소</button>
									</div>
								</div>
							</table>
						</form>					
			    	</div>
				</div>
			</section>
		</div>
		
<%-- <script>

function validate() {

		var content = $('[name=content]').val();
		if (content.trim().length == 0) {
			alert("내용을 입력하세요!");
		}
		return true;
	}
</script> --%>

<%@ include file="/views/common/footer.jsp"%>