<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/myHeader.jsp"%>
<%@ page import="java.util.*, com.kh.review.model.vo.Review" %>
<% List<Review> list = (List)request.getAttribute("list");%>

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
</style>

		<div class="col-sm-10">
			<section>
				<article class="review-container">
					<div id="buyList-title">
						<h3>내 리뷰 관리</h3>
					</div>
					<hr/>
					
					<ul>
						<%for(Review r : list) {%>
							<li> 
								<div class="reviewList">
									<h5><b><%=r.getBookId() %></b></h5>
									<h6><%=r.getWriteDate() %></h6>
									<br/>
									<p>
										<%=r.getReviewContext()%>
									</p>
									<div class="review-options">
										<button class="btn btn-primary">수정</button>
										<button class="btn btn-primary">삭제</button>
									</div>
								</div>
							</li>
						<%} %>
					</ul>
				</article>
			</section>
		</div>
	</div>
</div>