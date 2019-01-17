<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/myHeader.jsp"%>
<%@ page import="java.util.*, com.kh.review.model.vo.Review" %>
<% 
	List<Review> list = (List)request.getAttribute("list");
	int cnt = (int)request.getAttribute("cnt");
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
		float: left;
	}
	article.review-container div#selectList {
		float: right;
		margin-right: 30px;
		margin-bottom: 20px;
	}
	article.review-container div#selectList p {
		display: inline;
		text-align: left;
	}
	article.review-container div#selectDelete {
		margin-left: 60px;
	}
	
	article.review-container p#count{
		margin-left: 60px;
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
					<p id="count">총 <%=cnt %>개의 리뷰가 있습니다.</p>
					<div id="selectList">
						<input type="checkbox" id="checkAll" onclick="checkAll();"/> 
						<label for="checkAll">전체선택</label>
					</div>
					<div id="selectDelete">
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
									$('#renum').val(<%=r.getReviewNum()%>);
									$('#updateContext').val("<%=r.getReviewContext()%>");
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
			.star_rating {font-size:0; letter-spacing:-4px;}
			.star_rating a {
			    font-size:22px;
			    letter-spacing:0;
			    display:inline-block;
			    margin-left:5px;
			    color:#ccc;
			    text-decoration:none;
			}
			.star_rating a:first-child {margin-left:0;}
			.star_rating a.on {color:#777;}
		</style>		
		
		<!-- 리뷰 수정 모달창 -->
		<div class="modal" id="updateModal" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						리뷰 수정
					</div>
					<div class="modal-body">
						<table class="tbl-modal">
							<tr>
								<th><label>평점</label></th>
								<td>
									<p class="star_rating">
									    <a href="#" class="on">★</a>
									    <a href="#">★</a>
										<a href="#">★</a>
										<a href="#">★</a>
										<a href="#">★</a>
									</p>								
								</td>
							</tr>
							<tr>
								<form action="<%=request.getContextPath()%>/review/updateReview" method="POST" id="updateReviewFrm">
								<th><label for="updateContext">내용</label></th>
								<td>									
									<textarea cols="40" rows="5" name="updateContext" id="updateContext" class="form-control" value="" required></textarea>
									<input type="hidden" id="star_grade" name="star_grade" value="">
									<input type="hidden" id="renum" name="renum" value="">										
								</form>
								</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="updateRe();">수정</button>
						<button type="button" class="btn" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 여기 까지 리뷰 수정 모달 -->
		
		<style>
			.tbl-modal{
				border-collapse: separate;
				border-spacing: 5px 10px;
				padding: 8px;			
			}

			.tbl-modal th{
				width: 30px;
			}

			.modal {
		        text-align: center;
			}
 
			@media screen and (min-width: 768px) { 
       			.modal:before {
	                display: inline-block;
	                vertical-align: middle;
	                content: " ";
	                height: 100%;
	    	    }
			}	
 
			.modal-dialog {
		        display: inline-block;
		        text-align: left;
		        vertical-align: middle;
			}
		
			div.modal-content{
				width: 400px;
			}
			textarea#updateContext{
				resize: none;
			}
		</style>
		
		
		<script>
			// 별점 스크립트
			$(".star_rating a").click(function() {
				$(this).parent().children("a").removeClass("on");
				$(this).addClass("on").prevAll("a").addClass("on");
				return false;
			});
			
			// 수정 버튼 메소드
			function updateRe() {
				var grade = $('.on').length;
				$('#star_grade').val(grade);
				$('#updateReviewFrm').submit();
			}
			
				
		</script>
		
		
		
	</div>
</div>