<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/appendBookForm.css">


<title>희망도서신청 -KH북스</title>

	<div class="container">
		<h1>희망 도서 신청</h1>
		<h3>도서검색</h3>
		<p> &nbsp; 한 항목만 입력하셔도 됩니다. 두 항목 이상 입력하시면 두 항목을 동시에 만족하는 상품을 찾습니다. </br>
		복합명사는 띄어쓰기를 하면 더 많은 검색 결과를 얻으실 수 있습니다.</p>
		
		<table>
		
		<form class="form-horizontal" action="<%=request.getContextPath()%>/appendBook/appendBookFormEnd" method="post">
		
			
		
			<div class="form-group  col-md-offset-2 col-md-8">
				<label class="control-label col-sm-2" for="bookName">도서명 *</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="bookName"
						placeholder="도서명" name="bookName" required="required">
				</div>
			</div>



			<div class="form-group col-md-offset-2 col-md-8">
				<label class="control-label col-sm-2" for="authorName">저자 *</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="authorName"
						placeholder="저자" name="authorName" required="required">
				</div>
			</div>
			
			
			

			<div class="form-group col-md-offset-2 col-md-8">
				<label class="control-label col-sm-2" for="publisher">발행처 </label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="publisher"
						placeholder="출판사" name="publisher">
				</div>
			</div>
			
			

			<div class="form-group col-md-offset-2 col-md-8">
				<label class="control-label col-sm-2" for="">발행년도 </label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="bookDate"
						placeholder="발행년도" name="bookDate">
				</div>
			</div>
			
			


		
			<div class="form-group col-md-offset-2 col-md-8">
				<label class="control-label col-sm-2" for="isbn" >ISBN *</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="isbn"
						placeholder="ISBN" name="isbn" required="required">
				</div>
			</div>
		
			<div class="form-group col-md-offset-2 col-md-8">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default" onclick="return validate();">Submit</button>
				</div>
			</div>
		</form>
		
		</table>
	</div>


<!-- <script>


	function validate() {

		var content = $('[name=content]').val();
		if (content.trim().length == 0) {
			alert("내용을 입력하세요!");
		}
		return true;
	}
</script> -->

<%@ include file="/views/common/footer.jsp"%>