<%@page import="com.kh.absence.model.vo.Absence"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.kh.notice.model.vo.*, com.kh.reply.model.vo.*"%>
<%
	Absence ab = (Absence) request.getAttribute("ab");
	List<Reply> rlist=(List)request.getAttribute("reply");
	Member m = (Member) request.getSession().getAttribute("logined");
%>
<%@ include file="/views/common/noticeHeader.jsp"%>
<style>

body { padding-top:30px; }
.widget .panel-body { padding:0px; }
.widget .list-group { margin-bottom: 0; }
.widget .panel-title { display:inline }
.widget .label-info { float: right; }
.widget li.list-group-item {border-radius: 0;border: 0;border-top: 1px solid #ddd;}
.widget li.list-group-item:hover { background-color: rgba(86,61,124,.1); }
.widget .mic-info { color: #666666;font-size: 11px; }
.widget .action { margin-top:5px; }
.widget .comment-text { font-size: 12px; }
.widget .btn-block { border-top-left-radius:0px;border-top-right-radius:0px; }
.ui-group-buttons .or{position:relative;float:left;width:.3em;height:1.3em;z-index:3;font-size:12px}
.ui-group-buttons .or:before{position:absolute;top:50%;left:50%;content:'';background-color:#5a5a5a;margin-top:-.1em;margin-left:-.9em;width:1.8em;height:1.8em;line-height:1.55;color:#fff;font-style:normal;font-weight:400;text-align:center;border-radius:500px;-webkit-box-shadow:0 0 0 1px rgba(0,0,0,0.1);box-shadow:0 0 0 1px rgba(0,0,0,0.1);-webkit-box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;box-sizing:border-box}
.ui-group-buttons .or:after{position:absolute;top:0;left:0;content:' ';width:.3em;height:2.84em;background-color:rgba(0,0,0,0);border-top:.6em solid #5a5a5a;border-bottom:.6em solid #5a5a5a}
.ui-group-buttons .or.or-lg{height:1.3em;font-size:16px}
.ui-group-buttons .or.or-lg:after{height:2.85em}
.ui-group-buttons .or.or-sm{height:1em}
.ui-group-buttons .or.or-sm:after{height:2.5em}
.ui-group-buttons .or.or-xs{height:.25em}
.ui-group-buttons .or.or-xs:after{height:1.84em;z-index:-1000}
.ui-group-buttons{display:inline-block;}
.ui-group-buttons:after{content:".";display:block;height:0;clear:both;visibility:hidden}
.ui-group-buttons .btn{float:left;border-radius:0}
.ui-group-buttons .btn:first-child{margin-left:0;border-top-left-radius:.25em;border-bottom-left-radius:.25em;padding-right:15px}
.ui-group-buttons .btn:last-child{border-top-right-radius:.25em;border-bottom-right-radius:.25em;padding-left:15px}
#replyContent{resize: none; margin-bottom: 15px;}


hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #FFFFFF;
}
a {
    color: #82b440;
    text-decoration: none;
}
.blog-comment::before,
.blog-comment::after,
.blog-comment-form::before,
.blog-comment-form::after{
    content: "";
	display: table;
	clear: both;
}

.blog-comment{
  padding-right:53%;
}

.blog-comment ul{
	list-style-type: none;
	padding: 0;
}

.blog-comment img{
	opacity: 1;
	filter: Alpha(opacity=100);
	-webkit-border-radius: 4px;
	   -moz-border-radius: 4px;
	  	 -o-border-radius: 4px;
			border-radius: 4px;
}

.blog-comment img.avatar {
	position: relative;
	float: left;
	margin-top: 0;
	width: 35px;
	height: 35px;
	margin-top: 25px;
}

.blog-comment .post-comments{
	border: 1px solid #eee;
    margin-bottom: 20px;
	margin-left: 50px;

	margin-right: 0px;
    padding: 10px 20px;
    position: relative;
    -webkit-border-radius: 4px;
       -moz-border-radius: 4px;
       	 -o-border-radius: 4px;
    		border-radius: 4px;
	background: #fff;
	color: #6b6e80;
	position: relative;
	
}

.blog-comment .meta {
	font-size: 13px;
	color: #aaaaaa;
	padding-bottom: 8px;
	margin-bottom: 10px !important;
	border-bottom: 1px solid #eee;
}

.blog-comment ul.comments ul{
	list-style-type: none;
	padding: 0;
	margin-left: 85px;
}

.blog-comment-form{
	padding-left: 15%;
	padding-right: 15%;
	padding-top: 40px;
}

.blog-comment h5,
.blog-comment-form h5{
	margin-bottom: 15px;
	font-size: 20px;
	line-height: 30px;
	font-weight: 800;
}



.form-group{
padding: 0 20px 0 10px;
}

#addBook{

margin-left:120px;
margin-top: 5px;
}


#return {
	background-color: #555555;
	color: white;
	border: none;
	padding: 8px 20px;
	margin-top: 10px;
	margin-left: 55px;
	text-align: center;
}

fieldset a {
	float: right;
}

#content {
	margin: 100px 0 0 0;
	text-align: center;
}

table.type10 {
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	/* margin: 40px 10px 0px 180px; */
	/* width:0px; */ height:30px;
}

table.type10 thead th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	background: #8C8C8C;
	margin: 20px 10px;
	text-align: center;
}

table.type10 tbody th {
	width: 150px;
	padding: 10px;
	text-align: center;
}

table.type10 td {
	width: 350px;
	padding: 10px;
	vertical-align: center;
}

table.type10 .even {
	background: #EAEAEA;
}

input[value='삭제하기'] {
	background-color: skyblue;
	border: none;
	color: white;
	padding: 8px 20px;
	margin:30px 0px 0px 30px;
	text-decoration: none;
	float: right;
	cursor: pointer;
}

.hello{
margin-right:440px;

}

</style>
<section>
	<div class=" col-sm-8">
		<br/><br/>
	<div class=" col-sm-12 col-md-9">
<br/><br/>
		
			<%if(ab.getMemberNum()==logined.getMemberNum()||logined.getMemberId().equals("admin")){ %>
			<input type="button" value="삭제하기" id="deleted" onclick="deleted();" />
			<%} %>
			<h2>도서신청 VIEW</h2>
			<hr />


			<br />
			<br />
			<br />
			<%if(logined!=null||logined.getMemberId().equals("admin")){ %>		
			<table class="type10 table">
				<thead>

					<tr>
						<th scope="cols">타이틀</th>
						<th scope="cols">내용</th>
					</tr>

				</thead>
				<tbody>
					<tr>
						<th scope="row"><h4>책제목</h4></th>
						<td><%=ab.getBookName() %></td>
					</tr>
					<tr>
						<th scope="row" class="even"><h4>저자</h4></th>
						<td class="even"><%=ab.getAuthor() %></td>
					</tr>
					<tr>
						<th scope="row"><h4>발행연도</h4></th>
						<td><%=ab.getBookDate() %></td>

					</tr>
					<tr>
						<th scope="row" class="even"><h4>출판사</h4></th>
						<td class="even"><%=ab.getPublisher() %></td>
					</tr>
					<tr>
						<th scope="row"><h4>신청번호</h4></th>
						<td><%=ab.getAppNum()%></td>
					</tr>
					<tr>
						<th scope="row" class="even"><h4>등록일</h4></th>
						<td class="even"><%=ab.getAppDate() %></td>
					</tr>
					<tr>
						<th scope="row" ><h4>ISBN</h4></th>
						<td><%=ab.getISBN() %></td>
					</tr>												
					<br />
					<br />																
				</tbody>
				<%}%>
			</table>
			<script>
			function deleted(){
				if(!confirm('정말 삭제하시겠습니까?')){
					return;
				}
				location.href="<%=request.getContextPath()%>/absence/deleted?no3=<%=ab.getAppNum()%>";
				
			}
					
			function main_absence(){
				location.href="<%=request.getContextPath()%>/absence/page";
			}
			</script>
					
    <div class="row">
		<div class="col-md-12">				
				<span><button class="btn" id="return" onclick="main_absence();">목록으로</button></span>
				<%if(logined.getMemberId().equals("admin")){ %>
				<span><button class="btn" id="addBook" onclick="appendBook();">책 추가하기</button></span>
				<%} %>
		</div>
	</div>
				
			<br>
			<%if(logined.getMemberId().equals("admin")||ab.getMemberNum() == logined.getMemberNum()){ %>	
		    <div class="row">  
		        <div class="panel panel-default widget">
		            <div class="panel-heading">
		                <span class="glyphicon glyphicon-comment"></span>
		                <h3 class="panel-title">댓글입력</h3>	      		         
		            </div>
		            <div class="panel-body">
		                <ul class="list-group">
		                    <li class="list-group-item">
		                        <div class="row">
		                            <div class="col-xs-2 col-md-1">
		                                <img src="<%=request.getContextPath()%>/images/icons/user_icon.png" class="img-circle img-responsive" alt="" />
		                            </div>
		                            <div class="col-xs-10 col-md-11">
		                                <div>
		                                	<span class="hello">안녕하세요 <%=logined.getMemberId() %> 님 </span>	                                	
                               			</div>  		                                                                                  
		                            </div>
		                        </div>
		                    </li>                                  
		                </ul>               
		            </div>		            
		            <!--댓글 입력 부분 -->	 			
		            <div class="col">
		                  <div class="panel-body">
		                        <form role="form" action="<%=request.getContextPath()%>/reply/enrollReply">
		                            <fieldset>
		                                <div class="form-group">
		    								<textarea class="form-control" rows="3" id="replyContent" name="orderReContent" placeholder="댓글을 입력하세요." required></textarea>
		                                    <input type="hidden" name="memberNum" value="<%=logined.getMemberNum()%>"/>
		                                    <input type="hidden" name="orderBookNum" value="<%=ab.getAppNum() %>"/>
	                               			<span><button type="submit" class="[ btn btn-success ]" data-loading-text="Loading...">댓글등록</button></span>
		                                </div>                                                           		                       					                       			 
		                            </fieldset>
		                        </form>
		               	  </div>
		            </div> <%} %>           		           
		     	 </div>
		   </div>
   	 </div>
	
<div class="container bootstrap snippet">
    <div class="row">
		<div class="col-md-12">
		    <div class="blog-comment">
				<h5 class="text-success">댓글목록</h5>
                <hr/>				
				<%for(Reply r : rlist) { %>
					<%if(r.getOrderReContent()!=null&&logined!=null){ %> 
					<ul class="comments">								
						<li class="clearfix">
						  <img src="<%=request.getContextPath()%>/images/icons/user_icon.png" class="avatar"  alt="">
						  <div class="post-comments">				
						      <p class="meta"><%=r.getOrderReDate()%> 
						      	<strong><%=r.getMemberId() %></strong> says :
						      	<%if(r.getMemberNum()==logined.getMemberNum()){ %>
						      		<i class="pull-right">
						      			<!-- <a onclick="fn_updateReply(this);"><small>수정</small></a>&nbsp;&nbsp;&nbsp; -->
						      			<a onclick="fn_deleteReply( '<%=r.getOrderReCoNum() %>');"><small>삭제</small></a>&nbsp;	<%} %>						      			
					      			</i>
		     				  </p>
		     				  <!--댓글 내용부분-->
		     				<%--   <form action='<%=request.getContextPath()%>/reply/updateReply' method="post" >	 --%>			      
						      <p id="repContent"><%=r.getOrderReContent() %></p>
						      <input type="hidden" name="orderreconum" value="<%=r.getOrderReCoNum() %>">
						      <input type="hidden" name="memberNum" value="<%=r.getMemberNum()%>"> 
						      <input type="hidden" name="orderbooknum" value="<%=r.getOrderBookNum() %>">
						      <input type="hidden" name="orderreconum" value="<%=r.getOrderReCoNum() %>">						      						      
						  <!--     </form> -->
						  </div> 										  								 			 
						</li>
									
					</ul>
					<%} 
				 } %>
			</div>			 
		</div>			 
	</div>
</div>
						     
		<script>
		
		function appendBook(){
			location.href="<%=request.getContextPath()%>/admin/bookappend?isbn=<%=ab.getISBN()%>&no=<%=ab.getAppNum()%>";
		}
		
		
		
	

	 	function fn_deleteReply(no){
			if(!confirm('정말로 삭제하시겠습니까?'))
			{
				return;	
			}
			location.href="<%=request.getContextPath()%>/reply/deleteReply?no="+no+"&no1="+<%=ab.getAppNum()%>;
		}
	 	//수정 구현중...
		/* function fn_updateReply(btn){
			console.log(btn);
			$(btn).parent().parent().next().hide();
			var content=$(btn).parent().parent().next().find('p').html();
			var txt1="<textArea class='form-control' name='orderrecontent' required></textArea><input type='submit' value='취소'/>";				
			$(btn).parent().parent().parent().append(txt1);
		/* $('#repContent').hide(); */
		} */
				
		
			
			
			
			
			<%--  location.href="<%=request.getContextPath()%>/reply/updateReply?no="+no+"&no1="+<%=ab.getAppNum()%>; 						 --%>
			<%-- location.href="<%=request.getContextPath()%>/reply/updateReply?no="+no+"&no1="+<%=ab.getAppNum()%>; --%>
			
	

		</script>
</section>
</div>

<%@include file="/views/common/footer.jsp"%>