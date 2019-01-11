<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/myHeader.jsp"%>

<style>
	div#buyList-options div.input-group{width: 30%; float: left;}
	div.btn-group{float: right;}
</style>


		<div class="col-sm-10">
			<section>
				<article class="buyList-container">
					<div id="buyList-title">
						<h3>구매 목록</h3>
					</div>
					<div id="buyList-options">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="책 또는 저자명" name="btn-search" aria-describedby="basic-addon2"/>
							<span class="input-group-addon" id="basic-addon2">검색</span>
						</div>
						<div class="btn-group">
							<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">최근 구매순 <span class="caret"></span></button>
							<ul class="dropdown-menu" role="menu">
							    <li><a href="#">최근 구매순</a></li>
							    <li><a href="#">제목순</a></li>
							    <li><a href="#">저자순</a></li>
						 	</ul>
						</div>
					</div>	
					<hr style='margin-top: 60px; border: 1px solid lightgray;'/>
					<div id="buyList-actions">
          				
					</div>
				</article>
			</section>
		</div>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>