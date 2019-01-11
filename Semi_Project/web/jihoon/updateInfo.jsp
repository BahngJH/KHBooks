<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/myHeader.jsp"%>

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
</style>

		<div class="col-sm-10">
			<section>
				<h4>정보 변경</h4>
				<article class="checkAccount">
					<h6>보안을 위해 비밀번호를 한번 더 입력해주세요</h6>
					<div class="input-group">
						<input type="text" class="form-control" name="btn-search" aria-describedby="basic-addon2"/>
						<span class="input-group-addon" id="basic-addon2">비밀번호 입력</span>
					</div>
				</article>
				
				<article class="updateInfo-container">
					<div class="updateInfo">
						<form class="form-inline" role="form">
							<table class="tbl-updateInfo table-bordered">
								<tr>
									<th>이름</th>
									<td>
										<span>주홍범</span>
										<a class="btn btn-primary" style="float : right;">회원탈퇴</a>
									</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td>user01</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
										<div>
											<p>wowow</p>
											<button>이메일 변경</button>
										</div>
									</td>
								</tr>
								<tr>
									<th>비밀번호 변경</th>
									<td>
										<input type="text" class="form-control" placeholder="새 비밀번호"/>
										<br/><br/>
										<input type="text" class="form-control" placeholder="새 비밀번호 확인"/>
									</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>123213123123123123123213</td>
								</tr>
							</table>
							<button type="submit">변경 완료</button>
						</form>
					</div>
				</article>
			</section>	
		</div>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>