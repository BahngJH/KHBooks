<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="/views/common/header.jsp"%>

<title>희망도서신청 -KH북스</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!DOCTYPE title PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/appendBookForm.css">

</head>
<body>


	<div class="container">
		<h1>희망 도서 신청</h1>
		<h3>도서검색</h3>
		<p> &nbsp; 한 항목만 입력하셔도 됩니다. 두 항목 이상 입력하시면 두 항목을 동시에 만족하는 상품을 찾습니다. </br>
		복합명사는 띄어쓰기를 하면 더 많은 검색 결과를 얻으실 수 있습니다.</p>
		
		<table>
		
		<form class="form-horizontal" action="/action_page.php">
			<div class="form-group col-md-7">
				<label class="control-label col-sm-2" for="country">지역구분</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="country"
						placeholder="지역" name="country">
				</div>
			</div>
			
			
			<div class="form-group  col-md-7">
				<label class="control-label col-sm-2" for="bookName">도서명 *</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="bookName"
						placeholder="도서명" name="bookName">
				</div>
			</div>



			<div class="form-group col-md-7">
				<label class="control-label col-sm-2" for="author">저자 *</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="author"
						placeholder="저자" name="author">
				</div>
			</div>
			
			
			

			<div class="form-group col-md-7">
				<label class="control-label col-sm-2" for="publisher">발행처 </label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="publisher"
						placeholder="출판사" name="publisher">
				</div>
			</div>
			
			

			<div class="form-group col-md-7">
				<label class="control-label col-sm-2" for="">발행년도 </label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="issueDate"
						placeholder="발행년도" name="issueDate">
				</div>
			</div>
			
			

			<div class="form-group col-md-7">
				<label class="control-label col-sm-2" for="email">통화 </label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="currency"
						placeholder="통화" name="currency">
				</div>
			</div>

		
			<div class="form-group col-md-7">
				<label class="control-label col-sm-2" for="isbn">ISBN *</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="isbn"
						placeholder="ISBN" name="isbn">
				</div>
			</div>
		
			<div class="form-group col-md-7">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Submit</button>
				</div>
			</div>
		</form>
		
		</table>
	</div>




</body>
</html>


<%@ include file="/views/common/footer.jsp"%>