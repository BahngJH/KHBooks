<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/myHeader.jsp"%>
<%@ page import="java.util.*, com.kh.review.model.vo.Review" %>
<% 
	List<Review> list = (List)request.getAttribute("list");
%>

<style>
	article.review-container ul {
		list-style: none;
	}

	article.review-container div.reviewList{
		margin: 20px;
		padding: 30px;
		width: 95%;
		min-height: 170px;
		border: 1px solid black;
		overflow: auto;
	}
	
	article.review-container div.review-options{
		float: right;
	}
	article.review-container div#selectList {
		float: right;
		margin-right: 30px;
		margin-bottom: 20px;
	}
	div.modal-body{
		width: 400px;
	}
</style>


		<div class="col-sm-10">
			<section>
				<article class="review-container">
					<div id="buyList-title">
						<h3>내 리뷰 관리</h3>
					</div>
					<hr/>
					<div id="selectList">
						<input type="checkbox" id="checkAll" onclick="checkAll();"/> <label for="checkAll">전체선택</label>
						&nbsp;
						<button type="button" class="btn btn-primary" onclick="deleteSelectReview();">선택 삭제</button>
					</div>
					<ul>
						<%for(Review r : list) { %>
							<li>
								<div class="reviewList">
									<h5 style="display: inline"><b><%=r.getBookId() %></b></h5>
									<input type="checkbox" name="check" id="c<%=r.getReviewNum()%>" value="<%=r.getReviewNum()%>" style="float: right;" required>
									<h6>
										<%for(int i = 0; i <r.getGrade(); i++) { %>
										<span class="glyphicon glyphicon-star" aria-hidden="true"></span> 
										<%} %>
										<%=r.getWriteDate() %>
									</h6>
									<br/>
									<p id="reviewContext">
										<%=r.getReviewContext()%>
									</p>
									<div class="review-options">
										<button class="btn btn-primary" onclick="updateReview<%=r.getReviewNum()%>();">수정</button>
										<button class="btn btn-primary" onclick="deleteReview<%=r.getReviewNum()%>();">삭제</button>
									</div>
								</div>
							</li>
							<script>
								/* 선택 삭제 메소드 */
								function deleteSelectReview() {
									if(!confirm("정말 삭제하시겠습니까?")){
										return;
									}	
									var chkbox = document.getElementsByName("check");
									var checked = [];
									for(var i=0; i<chkbox.length; i++) {
										if(chkbox[i].checked){
											checked.push(chkbox[i].value);		/* 체크된 리뷰들의 값을 배열에 담는다 */											
										}
									}
									
									if(checked.length < 1) {
										alert("선택한 리뷰가 없습니다.");
										return;
									}
									/* 체크된 리뷰 값을 배열에 담아 서블릿으로 전송 */
									location.href="<%=request.getContextPath()%>/review/deleteSelectReview?nums="+checked;									
								}
								
								/* 전체선택 메소드 */
								function checkAll() {
								    if ($("#checkAll").is(':checked')) {
								        $("input[type=checkbox]").prop("checked", true);
								    } else {
								        $("input[type=checkbox]").prop("checked", false);
									}
								}
								/* 리뷰 수정 메소드 */
								function updateReview<%=r.getReviewNum()%>() {
									$('.modal').modal();
								}							
								/* 리뷰 삭제 메소드 */
								function deleteReview<%=r.getReviewNum()%>() {
									if(!confirm("정말 삭제하시겠습니까?")){
										return;
									}
									location.href="<%=request.getContextPath()%>/review/deleteReview?no=<%=r.getReviewNum()%>";
								}
							</script>
						<%} %>
					</ul>
				</article>
			</section>
		</div>
		
		
		<style>
			.star{
				background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
				background-size: auto 100%;
				width:30px;
				height: 30px;
				display: inline-block;
  				text-indent: -9999px;
  				cursor: pointer;
			}		
			.star.on{background-position: 0 0;}
		</style>		
		<!-- 리뷰 수정 모달창 -->
		<div class="modal" id="testModal" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						리뷰 수정
					</div>
					<div class="modal-body">
						<form action="" method="post">
							<table>
								<tr>
									<th><label>평점</label></th>
									<td>
										<div class="starRev">
											<span class="star on"></span>
											<span class="star"></span>
											<span class="star"></span>
											<span class="star"></span>
											<span class="star"></span>
										</div>
									</td>
									<script>
									$('.starRev span').click(function(){
										  $(this).parent().children('span').removeClass('on');
										  $(this).addClass('on').prevAll('span').addClass('on');
										  return false;
										});
									</script>
								</tr>
								<th><label for="updateContext">내용</label></th>
								<td><textarea name="updateContext" id="updateContext" class="form-control"></textarea></td>
							</table>
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">수정</button>
						<button type="button" class="btn" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>