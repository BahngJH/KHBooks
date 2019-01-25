<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%String isbn = (String)request.getAttribute("isbn"); 
	String no = (String)request.getAttribute("no");
%>
<section class='container'>
<h4>도서 정보 입력 </h4>
	<form action="<%=request.getContextPath() %>/book/insertbook" method="post" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<th>책 제목</th>
				<td> <input type="text" name="title" id="title" class="form-control" required/> </td>
				<th>저자 명</th>
				<td> <input type="text" name="author" id="author" class="form-control" required/> </td>
			</tr>
			<tr>
				<th>출판사</th>
				<td><input type="text" name="pub" id="pub" class="form-control" required/></td>
				<th>가격</th>
				<td><input type="number" name="price" id="price" class="form-control" required/></td>
			</tr>
			<tr>
				<th>장르</th>
				<td><select name="genre" id="genre" required>
					<%for(String g: genres){%>
						<option value="<%=g%>"><%=g%></option>
					<%} %>
				</select></td>
				<th>ISBN</th>
				<td>
					<div class="input-group">
						<input type="text" name="isbn" id="isbn" value="<%=isbn%>"class="form-control" required/>
						<span class="input-group-btn"><button class="btn btn-default" onclick="searchISBN($('#isbn').val());" >검색</button></span>
					</div>
				</td>
			</tr>
			<tr>
				<th>책 표지</th>
				<td><input type="file" name="image" id="image" class="form-control" required/></td>
				<th>페이지 수</th>
				<td><input type="number" name="page" id="page" class="form-control" required/></td>
			</tr>
			<tr>
				<th>책 소개</th>
				<td colspan="3"><textarea name="info" id="info" cols="80" rows="7" class="form-control"></textarea></td>
			</tr>
			<tr>
				<th>줄거리</th>
				<td colspan="3"><textarea name="content" id="content" cols="80" rows="7" class="form-control"></textarea></td>
			</tr>
			<tr>
				<th>목차</th>
				<td colspan="3"><textarea name="index" id="index" cols="80" rows="7" class="form-control"></textarea></td>
			</tr>
			<tr>
				<th>엮은이</th>
				<td><input type="text" name="editor" id="editor" value =" " class="form-control"/></td>
				<th>번역가</th>
				<td><input type="text" name="translator" id="translator" class="form-control"/></td>
			</tr>
			<tr>
				<th>수량</th>
				<td><input type="number" name="count" id="count" class="form-control" required/></td>
				<th>출간일</th>
				<td> <input type="date" name="date" id="date" required/> </td>
			</tr>
			<tr>
				<td><input type="reset" class="form-control btn btn-danger"/></td>
				<td><input type="submit" value="완료" class="form-control btn btn-primary" /></td>
			</tr>
		</table>
		<%
			if(no!=null){%>
			<input type="hidden" name="no" value="<%=no%>"/>				
		<%
		}
		%>
	</form>
</section>
<script>
	var key;

	$(function(){
		$.ajax({
			url: "<%=request.getContextPath()%>/file/kakaoApi.txt",
			type: "get",
			dataType:"text",
			success: function(result){
				key = result;
				searchISBN(<%=isbn%>);
			}
		})
	});
	
	function searchISBN(isbn){
		if(isbn !== undefined && isbn !== ""){
			$.ajax({
	   			url: "https://dapi.kakao.com/v3/search/book",
	   			headers: {'Authorization': 'KakaoAK '+ key},
	   			type : "get",
	   			data:{
	   				query: isbn,
	    			target:'isbn'
	   			},
	   			success : function(result){
	   				let data = result.documents[0];
	   				$("#title").val(data.title);
	   				$('#author').val(data.authors);
	   				$('#pub').val(data.publisher);
	   				$('#price').val(data.price);
	   				$('#info').val(data.contents+"...");
	   				let date = data.datetime.split('T')[0];
	   				$('#date').val(date);
	   				$('#translator').val(data.translators);
	   			}
	   		});
		}
		
		return false;
	}

</script>
<%@include file="/views/common/adminfooter.jsp"%>