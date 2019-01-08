<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="/views/common/header.jsp"%>

<title>희망도서신청 -KH북스</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>


	<div class="container">
		<h1>희망 도서 신청</h1>
		<h3>도서검색</h3>
		<p> &nbsp; 한 항목만 입력하셔도 됩니다. 두 항목 이상 입력하시면 두 항목을 동시에 만족하는 상품을 찾습니다. </br>
		복합명사는 띄어쓰기를 하면 더 많은 검색 결과를 얻으실 수 있습니다.</p>
		<table>
		<form class="form-horizontal" action="/action_page.php">
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">지역구분 *</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="email"
						placeholder="지역" name="email">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">도서명 *</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="pwd"
						placeholder="도서명" name="pwd">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="email">저자 *</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="email"
						placeholder="지역" name="email">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="email">발행처 </label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="email"
						placeholder="지역" name="email">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="email">발행년도 </label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="email"
						placeholder="지역" name="email">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="email">통화 </label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="email"
						placeholder="지역" name="email">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="email">가격 </label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="email"
						placeholder="지역" name="email">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="email">ISBN *</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="email"
						placeholder="지역" name="email">
				</div>
			</div>




			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label><input type="checkbox" name="remember">
							Remember me</label>
					</div>
				</div>
			</div>
			
			<div class="form-group">
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