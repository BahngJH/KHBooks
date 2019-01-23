<%@page import="com.kh.absence.model.vo.Absence"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.kh.notice.model.vo.*"%>
<%
	Absence ab = (Absence) request.getAttribute("ab");
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
#replyContent{resize: none;}

#return {
	background-color: #555555;
	color: white;
	border: none;
	padding: 8px 20px;
	margin-top: 100px;
	margin-left: 370px;
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
	margin: 40px 10px 0px 180px;
	width:0px; height:30px;
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


</style>
<section>
	<div class=" col-sm-8">
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
				</tbody>

				<%}%>
			</table>
			
			<br>	
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
		                                    <a href="#">안녕하세요 <%=logined.getMemberId() %> 님</a>                                  
		                                </div>                                                    
		                            </div>
		                        </div>
		                    </li>                                  
		                </ul>               
		            </div>
		            <div class="col">
		                  <div class="panel-body">
		                        <form role="form" action="<%=request.getContextPath()%>/reply/enrollReply">
		                            <fieldset>
		                                <div class="form-group">
		    								<textarea class="form-control" rows="3" id="replyContent" name="orderReContent" placeholder="댓글을 입력하세요." required></textarea>
		                                    <input type="hidden" name="memberNum" value="<%=logined.getMemberNum()%>"/>
		                                    <input type="hidden" name="orderBookNum" value="<%=ab.getAppNum() %>"/>
		                                </div>                                                           
		                       			 <button type="submit" class="[ btn btn-success ]" data-loading-text="Loading...">댓글등록</button>
		                            </fieldset>
		                        </form>
		               	  </div>
		            </div>
		     	 </div>
		   </div>
    








		<br />
		<br />

		<button id="return" onclick="main_absence();">목록으로</button>
		<%if(logined.getMemberId().equals("admin")){ %>
		<button class="btn" onclick="appendBook();">책 추가하기</button>
		<%} %>
		<br />
		<br />
		<br />
		<br />
		<script>
		
		function appendBook(){
			location.href="<%=request.getContextPath()%>/admin/bookappend?isbn=<%=ab.getISBN()%>";
		}
		
		function deleted(){
			if(!confirm('정말 삭제하시겠습니까?')){
				return;
			}
			location.href="<%=request.getContextPath()%>/absence/deleted?no3=<%=ab.getAppNum()%>";
			
		}
		
		
		function main_absence(){
			location.href="<%=request.getContextPath()%>/absence/page";
		}
		
	
			<%-- function main_Notice(){
				location.href="<%=request.getContextPath()%>/notice/noticemain";
			}
			function deleteNotice(){
				if(!confirm('정말로 삭제하시겠습니까?'))
				{
					return;	
				}
				location.href="<%=request.getContextPath()%>/notice/noticedelete?no=<%=n.getNoticeNo()%>";
			}
			function updateNotice(){
				location.href="<%=request.getContextPath()%>/notice/noticeupdate?no1=<%=n.getNoticeNo()%>";
				
			} --%>
		</script>
</section>
</div>

<%@include file="/views/common/footer.jsp"%>