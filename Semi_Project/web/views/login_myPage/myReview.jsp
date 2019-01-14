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
	div.modal-body{
		width: 400px;
	}
</style>

<script>
	function updateReview() {
		$('.modal').modal();
	}
</script>

		<div class="col-sm-10">
			<section>
				<article class="review-container">
					<div id="buyList-title">
						<h3>내 리뷰 관리</h3>
					</div>
					<hr/>
					
					<ul>
						<%for(Review r : list) { %>
							<li> 
								<div class="reviewList">
									<h5><b><%=r.getBookId() %></b></h5>
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
										<button class="btn btn-primary" id="update-<%=r.getReviewNum() %>" onclick="updateReview();">수정</button>
										<button class="btn btn-primary" id="delete-<%=r.getReviewNum() %>" onclick="deleteReview();">삭제</button>
									</div>
								</div>
							</li>
						<%} %>
					</ul>
				</article>
			</section>
		</div>
		
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
									<td><span class="glyphicon glyphicon-star-empty"></span></td>
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