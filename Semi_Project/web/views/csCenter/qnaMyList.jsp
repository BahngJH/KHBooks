<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kh.csCenter.model.vo.Qna, com.kh.csCenter.model.vo.QnaRe"%>
	<%@ include file="/views/common/noticeHeader.jsp"%>

 <%
	List<Qna> list = (List) request.getAttribute("list");
	int cnt = (int) request.getAttribute("cnt");
	String pageBar = (String) request.getAttribute("pageBar");
	List<QnaRe> qrList = (List)request.getAttribute("qrList");
		/* Member m = (Member) request.getSession().getAttribute("logined");  */
%>

<style>
.askLi {
	padding: 11px 0 2px 0;
	list-style: none;
}

ul {
	display: block;
	list-style-type: disc;
	padding-inline-start: 40px;
}

em {
	font-size: 17px;
}

.cs_title {
	font-size: 2em;
	float: left;
	padding-top: 35px;
	margin: 40px 0 0 40px;
}

#askBtn {
	width: 120px;
	height: 30px;
	font-size: 15px;
	/* 	padding: 0 0 1px 0; */
	float: right;
	text-align: center;
	margin: 90px 0 0 0;
}

.row hr {
	border: 0;
	height: 2px;
	background: #ccc;
}

.qna-paging {
	text-align: center;
}

.searchDate {
	text-align: left;
	padding-left: 70px;
	padding-bottom: 20px;
}

#askTitle_tg {
	width: 100%;
	text-aglign: center;
	outline:none;
}

.sch-lcont {
	padding: 0 50px 50px 20px;
}

.cal {
	padding: 0 15px 10px 15px;
}

.search_btn {
	padding-top: 15px;
}

.searchDate {
	padding-bottom: 40px;
}

.answer_tg {
	
	width: 100%;
	
}
element {
    outline: none;
}

.Answer {
	margin-left: 70px;
}
.pageBar{

padding-top: 30px;
}

.cho_b{

width:20px;height:20px;
}
.myAsk{
margin-right:100px;
}

.answer{
margin-left:100px;

}
</style>

<script>
	function fn_addQna() {
		location.href = "<%=request.getContextPath()%>/qna/qnaInput";}
</script>


<section class="board-container col-sm-12 col-md-9">	
 <!-- 타이틀 -->
 	<div class="row">
		<div class="csCenter col-md-10">			
				<strong><h3 class="cs_title">1:1 문의내역</h3></strong>										
			 <%if(logined!=null){%> 
				<button class="btn btn-primary" id="askBtn" onclick="fn_addQna()">1:1 문의하기</buton>
			<% } %> 
		</div>	  												
	</div>
	<div class="row">
		<div class="csCenter col-md-12">			
			<hr>
		</div>	  												
	</div>
    <!-- 문의리스트 -->
    <div class="row">
		<div class="csCenter col-md-12">  				
			<div class="askTitle">
				<ul class="askList">						
			 	  <%for(Qna q : list){%>									 	   		   					   
	                <li class="askLi">	               
		               	 <button class="btn btn-primary" id="askTitle_tg" type="button" onclick="fn_Content()" data-toggle="collapse" data-target="#Qnum<%=q.getQnaNum() %>" aria-expanded="false" aria-controls="collapseExample">				       		 			       							    					     						       							    							    						     							     						        
		               	 	<div class="row">
		               	 		<div class="col-xs-3">
							        <span class="">답변 상태: <%=q.getReCheck() %></span> 			   						     		               	 		
		               	 		</div>
		               	 		<div class="col-xs-6">
							        <em class="askInfo"><b><%=q.getQnaTitle() %></b></em>	               	 		
		               	 		</div>
		               	 		<div class="col-xs-3">
							        <span class=""><%=q.getQnaDate() %></span>		               	 		
		               	 		</div>
		               	 	</div>
						</button>					
					</li> 							 						
					<!--문의글 확인 및 재문의 -->			
					<div class="answer_tg collapse" id="Qnum<%=q.getQnaNum()%>">
	                     <div class="well" value="">
	                     	 <div class="myAsk alert alert-info">
	  								<strong><h4>내질문 :<%=q.getQnaContent() %></h4></strong>
							 </div>							
							  <div class="Answer alert alert-warning">
	  								<%if(q.getReContent()!=null){%>
	  								<strong><h4>답변 : <%=q.getReContent() %></h4></strong>   								
	  								<% }else{%>
	  								<strong>답변 : 답변대기중입니다.</strong><%} %>
							 </div>			                     	                    	                       																			                        						                                              
						 	<!-- <button >삭제하기</button> -->
	                      </div>                       
	                 </div>
 	                 <%} %> 	                                           							
				</ul>
			</div>									 	  
		</div>
	</div>
				<!--페이징처리 -->
	<div class="row">		                
   		<div class="qna-paging col-md-12" >
   			<div id='pageBar'>
	 			<nav>
	 				<ul class="pageBar pagination">			  		
						<li><%=pageBar %></li>				
					</ul>
   	  		 	</nav>
  	  		 </div>		 	
   		</div>
	</div>
</section>
</div>


<%-- 
<th colspan="2">
<input type="button" value="수정하기" onclick="fn_updateBoard()"/>
<input type="button" value="삭제하기" onclick="fn_deleteBoard()"/>
</th> 


	    <input type="hidden" name="htxtDateFrom" id="htxtDateFrom">
	    <input type="hidden" name="htxtDateTo" id="htxtDateTo">
	    <input type="hidden" name="htxtSearchType" id="htxtSearchType">

	    <input type="hidden" name="htxtAnswerType" id="htxtAnswerType">
	    <input type="hidden" name="htxtReadType" id="htxtReadType">
	    <input type="hidden" name="htxtSearch" id="htxtSearch">
	    <input type="hidden" name="htxtSelectNo" id="htxtSelectNo">
	
	    <input type="hidden" name="htxtSeqNo" id="htxtSeqNo" value="0">
	    <input type="hidden" name="htxtQuestionNo" id="htxtQuestionNo">
    

				<script language=JavaScript>
				var datePickerDivID = 'datepicker';
				var iFrameDivID			= 'datepickeriframe';
				var dayArrayShort		= new Array('일', '월', '화', '수', '목', '금', '토');
				var dayArrayMed			= new Array('일', '월', '화', '수', '목', '금', '토');
				var dayArrayLong		= new Array('일', '월', '화', '수', '목', '금', '토');
				var monthArrayShort = new Array('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');
				var monthArrayMed		= new Array('Jan', 'Feb', 'Mar', 'Apr', 'May', 'June', 'July', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec');
				//var monthArrayLong	= new Array('1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월');
				var monthArrayLong	= new Array('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12');

 
				var defaultDateSeparator = '-';        // common values would be '/' or '.'
				var defaultDateFormat = 'ymd'    // valid values are 'mdy', 'dmy', and 'ymd'
				var dateSeparator = defaultDateSeparator;
				var dateFormat = defaultDateFormat;
				
				function displayDatePicker(dateFieldName, displayBelowThisObject, dtFormat, dtSep, e)
				{
					var event = window.event || e;	//firefox 지원위해 수정
				
					//var targetDateField = document.getElementsByName(dateFieldName).item(0);	
					var targetDateField = document.getElementById(dateFieldName);									

					// if we weren't told what node to display the datepicker beneath, just display it
					// beneath the date field we're updating
					
					if (!displayBelowThisObject) 
						displayBelowThisObject = targetDateField;					
					
					// if a date separator character was given, update the dateSeparator variable
					if (dtSep)
						dateSeparator = dtSep;
					else
						dateSeparator = defaultDateSeparator;
					
					// if a date format was given, update the dateFormat variable
					if (dtFormat)
						dateFormat = dtFormat;
					else
						dateFormat = defaultDateFormat;		


					/*********** 달력 위치 계산 ************************/
					var calendarIconWidth = 3; // 현재 클릭한 위치에서 달력 Icon의 넓이만큼 오른쪽으로 shift
					var calendarIconHeight = 50; // 현재 클릭한 위치에서 달력 Icon의 높이만큼 아래로 shift
					var calendarWidth = 113;   // 달력 DIV의 넓이
					var calendarHeight = 150;  // 달력 DIV의 높이 (한달이 6주인 달을 기준으로 150으로 설정 - ex)2008-03)
					var iexplorerWidth = document.body.clientWidth  // 익스플로어의 창 넓이
					var iexplorerHeight = document.body.clientHeight  // 익스플로어의 창 높이
					
					//var posX = event.clientX - event.offsetX - 2; // - calendarIconWidth;
					//var posY = event.clientY - event.offsetY - 2;// - calendarIconHeight;					
					//firefox지원위해 수정 (offset이 firefox에서 동작하지 않음)
					var posX = event.clientX + document.body.scrollLeft	+ document.documentElement.scrollLeft;
					var posY = event.clientY + document.body.scrollTop	+ document.documentElement.scrollTop;
					
					var shiftOffX = iexplorerWidth - calendarWidth - posX - 12;
					var shiftOffY = iexplorerHeight - calendarHeight - posY - 5;
					
					var displayX = posX;
					var displayY = posY;
					
					// shiftOffX이 0보다 작다는뜻은 현재대로 달력을 보여주면 달력의 오른쪽이 shiftOffX만큼 잘려서 보인다는 뜻
					// shiftOffX만큼 왼쪽으로 옮겨준다
					if(shiftOffX < 0)
					{
						displayX = displayX - (-1 * shiftOffX);
					}
					
					// shiftOffY이 0보다 작다는뜻은 현재대로 달력을 보여주면 달력의 아래쪽이 shiftOffY만큼 잘려서 보인다는 뜻
					// shiftOffY만큼 윗쪽으로 옮겨준다
//2013.03일 아래 소스 때문에 전체창이 아닐경우와 Y값을 주어도 먹히지가 않아 주석처리함
//					if(shiftOffY < 0)
//					{
//						displayY = displayY - (-1 * shiftOffY);
//					}

					drawDatePicker(targetDateField, displayX, displayY); 
				}

				function drawDatePicker(targetDateField, x, y)
				{
					
					var dt = getFieldDate(targetDateField.value );
					
					if (!document.getElementById(datePickerDivID)) {
						var newNode = document.createElement('div');
						newNode.setAttribute('id', datePickerDivID);
						newNode.setAttribute('class', 'dpDiv');
						newNode.setAttribute('style', 'visibility: hidden;');
						document.body.appendChild(newNode);
					}										

					// move the datepicker div to the proper x,y coordinate and toggle the visiblity
					var pickerDiv = document.getElementById(datePickerDivID);
					pickerDiv.style.position = 'absolute';
					pickerDiv.style.left = x + 'px';
					pickerDiv.style.top = y + 'px';
					pickerDiv.style.visibility = (pickerDiv.style.visibility == 'visible' ? 'hidden' : 'visible');
					pickerDiv.style.display = (pickerDiv.style.display == 'block' ? 'none' : 'block');
					pickerDiv.style.zIndex = 10000;
					
					// draw the datepicker table
					refreshDatePicker(targetDateField.id, dt.getFullYear(), dt.getMonth(), dt.getDate());
					
				}


				/**
				This is the function that actually draws the datepicker CalendarV2.
				*/
				function refreshDatePicker(dateFieldName, year, month, day)
				{
					
					// if no arguments are passed, use today's date; otherwise, month and year
					// are required (if a day is passed, it will be highlighted later)
					var thisDay = new Date();
					 
					if ((month >= 0) && (year > 0)) {
						thisDay = new Date(year, month, 1);
					} else {
						day = thisDay.getDate();
						thisDay.setDate(1);
					}

					var lastDate = new Date();					
					lastDate = new Date(thisDay.getFullYear() , monthArrayLong[thisDay.getMonth()], 0);                        										
					
					// the CalendarV2 will be drawn as a table
					// you can customize the table elements with a global CSS style sheet,
					// or by hardcoding style and formatting elements below
					
					var crlf = '\r\n';var TABLE = "<table cols=7 class='dpTable' cellspacing = '1'>"+ crlf;
					var xTABLE = '</table>' + crlf;var TR = "<tr class='dpTR'>";var TR_title = "<tr class='dpTitleTR'>";var TR_days = "<tr class='dpDayTR'>";var TR_todaybutton = "<tr class='dpTodayButtonTR'>";
					var xTR = '</tr>' + crlf;var TD ="<td style='width:16px;' bgcolor='#ffffff' onMouseOut='this.className=\"dpTD\";' onMouseOver=' this.className=\"dpTDHover\";' "; var TD_Sunday ="<td style='width:16px;color:#E5644B;' bgcolor='#ffffff' onMouseOut='this.className=\"dpTD\";' onMouseOver=' this.className=\"dpTDHover\";' "; var TD_title = "<td class = 'dpTitleText' colspan=7 align = 'center' style = 'vertical-align:middle' bgcolor='#ffffff'>";  var TD_buttons = "<td class='dpButtonTD' bgcolor='#ffffff'>";  var TD_todaybutton = "<td colspan=7 class='dpTodayButtonTD'>";  var TD_days = "<td class='dpDayTD'>";  var TD_selected = "<td class='dpDayHighlightTD' onMouseOut='this.className=\"dpDayHighlightTD\";' onMouseOver='this.className=\"dpTDHover\";' "; var xTD = '</td>' + crlf;var DIV_title = "<div class='dpTitleText'>";var DIV_selected = "<div class='dpDayHighlight'>";var xDIV = '</div>';var html = TABLE;
					// this is the title bar, which displays the month and the buttons to
					// go back to a previous month or forward to the next month
					html += TR_title;
					html += TD_title + getButtonCode(dateFieldName, thisDay, -1, 'http://pics.iacstatic.co.kr/button/pg_prev.gif') + '  ' + thisDay.getFullYear() +'. ' + monthArrayLong[thisDay.getMonth()] + '  ' + getButtonCode(dateFieldName, thisDay, 1, 'http://pics.iacstatic.co.kr/button/pg_next.gif') + xTD;
					html += xTR ;
 
					// this is the row that indicates which day of the week we're on
					html += TR_days;
					for(i = 0; i < dayArrayShort.length; i++)
						html += TD_days + dayArrayShort[i] + xTD;
					html += xTR;
					 
					// now we'll start populating the table with days of the month
					html += TR;
					 
					// first, the leading blanks
					for (i = 0; i < thisDay.getDay(); i++)
						html += TD + '&nbsp;' + xTD;
					 
					// now, the days of the month
					do {
						dayNum = thisDay.getDate(); TD_onclick = " onclick=\"updateDateField('" + dateFieldName + "','" + getDateString(thisDay) + "');\">";
						if (dayNum == day) {
							html += TD_selected + TD_onclick + DIV_selected + dayNum + xDIV + xTD;
						} else {
							if ( thisDay.getDay() == 0 ) {
								html += TD_Sunday + TD_onclick + dayNum + xTD;
							} else {
								html += TD + TD_onclick + dayNum + xTD;
							}
							
				    }
 
						// if this is a Saturday, start a new row
						if ( (thisDay.getDay() == 6) && (thisDay.getDate() != lastDate.getDate()) )
						html += xTR + TR;
					    
						// increment the day
						thisDay.setDate(thisDay.getDate() + 1);
					} while (thisDay.getDate() > 1)
 
  // fill in any trailing blanks
  if (thisDay.getDay() > 0) {
    for (i = thisDay.getDay(); i < 7; i++)
      html += TD + '&nbsp;' + xTD;
  }
  html += xTR;
 
  // add a button to allow the user to easily return to today, or close the CalendarV2
  var today = new Date();
var todayString = "Today is " + dayArrayMed[today.getDay()] + ", " + monthArrayMed[today.getMonth()] + " " + today.getDate();
  html += TR_todaybutton + TD_todaybutton;html += "<a href='javascript:updateDateField(\"" + dateFieldName + "\");'><img src='http://pics.iacstatic.co.kr/common/close_calendar.gif' border='0'></a>";
  html += xTD + xTR;
  html += xTABLE;
 
  document.getElementById(datePickerDivID).innerHTML = html;
  adjustiFrame();
}


/**
Convenience function for writing the code for the buttons that bring us back or forward
a month.
*/
function getButtonCode(dateFieldName, dateVal, adjust, label)
{
  var newMonth = (dateVal.getMonth () + adjust) % 12;
  var newYear = dateVal.getFullYear() + parseInt((dateVal.getMonth() + adjust) / 12);
  if (newMonth < 0) {
    newMonth += 12;
    newYear += -1;
  }
  
return "<img src='" + label + "' align = 'absmiddle' onClick='refreshDatePicker(\""+ dateFieldName + "\", " + newYear + ", " + newMonth + ");'>";

}


/**
Convert a JavaScript Date object to a string, based on the dateFormat and dateSeparator
variables at the beginning of this script library.
*/
function getDateString(dateVal)
{
  var dayString = '00' + dateVal.getDate();
  var monthString = '00' + (dateVal.getMonth()+1);
  dayString = dayString.substring(dayString.length - 2);
  monthString = monthString.substring(monthString.length - 2);
 
  switch (dateFormat) {
    case 'dmy' :
      return dayString + dateSeparator + monthString + dateSeparator + dateVal.getFullYear();
    case 'ymd' :
      return dateVal.getFullYear() + dateSeparator + monthString + dateSeparator + dayString;
    case 'mdy' :
    default :
      return monthString + dateSeparator + dayString + dateSeparator + dateVal.getFullYear();
  }
}


/**
Convert a string to a JavaScript Date object.
*/
function getFieldDate(dateString)
{
  var dateVal;
  var dArray;
  var d, m, y;
 
  try {
    dArray = splitDateString(dateString);
    if (dArray) {
      switch (dateFormat) {
        case 'dmy' :
          d = parseInt(dArray[0], 10);
          m = parseInt(dArray[1], 10) - 1;
          y = parseInt(dArray[2], 10);
          break;
        case 'ymd' :
          d = parseInt(dArray[2], 10);
          m = parseInt(dArray[1], 10) - 1;
          y = parseInt(dArray[0], 10);
          break;
        case 'mdy' :
        default :
          d = parseInt(dArray[1], 10);
          m = parseInt(dArray[0], 10) - 1;
          y = parseInt(dArray[2], 10);
          break;
      }
      dateVal = new Date(y, m, d);
    } else if (dateString) {
      dateVal = new Date(dateString);
    } else {
      dateVal = new Date();
    }
  } catch(e) {
    dateVal = new Date();
  }
 
  return dateVal;
}


/**
Try to split a date string into an array of elements, using common date separators.
If the date is split, an array is returned; otherwise, we just return false.
*/
function splitDateString(dateString)
{
  var dArray;
  if (dateString.indexOf('/') >= 0)
    dArray = dateString.split('/');
  else if (dateString.indexOf('.') >= 0)
    dArray = dateString.split('.');
  else if (dateString.indexOf('-') >= 0)
    dArray = dateString.split('-');
  else if (dateString.indexOf('\\') >= 0)
    dArray = dateString.split('\\');
  else
    dArray = false;
 
  return dArray;
}

/**
Update the field with the given dateFieldName with the dateString that has been passed,
and hide the datepicker. If no dateString is passed, just close the datepicker without
changing the field value.

Also, if the page developer has defined a function called datePickerClosed anywhere on
the page or in an imported library, we will attempt to run that function with the updated
field as a parameter. This can be used for such things as date validation, setting default
values for related fields, etc. For example, you might have a function like this to validate
a start date field:

function datePickerClosed(dateField)
{
  var dateObj = getFieldDate(dateField.value);
  var today = new Date();
  today = new Date(today.getFullYear(), today.getMonth(), today.getDate());
 
  if (dateField.name == 'StartDate') {
    if (dateObj < today) {
      // if the date is before today, alert the user and display the datepicker again
      alert('Please enter a date that is today or later');
      dateField.value = '';
      document.getElementById(datePickerDivID).style.visibility = 'visible';
      adjustiFrame();
    } else {
      // if the date is okay, set the EndDate field to 7 days after the StartDate
      dateObj.setTime(dateObj.getTime() + (7 * 24 * 60 * 60 * 1000));
      var endDateField = document.getElementsByName ('EndDate').item(0);
      endDateField.value = getDateString(dateObj);
    }
  }
}
*/
function updateDateField(dateFieldName, dateString)
{
  //var targetDateField = document.getElementsByName(dateFieldName).item(0);
  var targetDateField = document.getElementById(dateFieldName);
  
  if (dateString) {
    targetDateField.value = dateString;
 		
		if( dateFieldName.match(/from/g) != null ) {	
			select_combobox('datefrom_year_select', parseInt(dateString.substring(0,4),10)  - 2012);					
			select_combobox('datefrom_month_select', parseInt(dateString.substring(5,7),10) - 1);					
			select_combobox('datefrom_day_select', parseInt(dateString.substring(8,10),10) - 1);					
		} else if( dateFieldName.match(/to/g) != null ) {
			select_combobox('dateto_year_select',   parseInt(dateString.substring(0,4),10) - 2012);		
			select_combobox('dateto_month_select', parseInt(dateString.substring(5,7),10)  - 1);					
			select_combobox('dateto_day_select', parseInt(dateString.substring(8,10),10) - 1);					
		}
	}

  var pickerDiv = document.getElementById(datePickerDivID);
  pickerDiv.style.visibility = 'hidden';
  pickerDiv.style.display = 'none';
 
  adjustiFrame();
  //targetDateField.focus();
 
  // after the datepicker has closed, optionally run a user-defined function called
  // datePickerClosed, passing the field that was just updated as a parameter
  // (note that this will only run if the user actually selected a date from the datepicker)
  if ((dateString) && (typeof(datePickerClosed) == 'function'))
    datePickerClosed(targetDateField);
}


/**
Use an 'iFrame shim' to deal with problems where the datepicker shows up behind
selection list elements, if they're below the datepicker. The problem and solution are
described at:

http://dotnetjunkies.com/WebLog/jking/archive/2003/07/21/488.aspx
http://dotnetjunkies.com/WebLog/jking/archive/2003/10/30/2975.aspx
*/
function adjustiFrame(pickerDiv, iFrameDiv)
{
  // we know that Opera doesn't like something about this, so if we;
  // think we're using Opera, don't even try
  var is_opera = (navigator.userAgent.toLowerCase().indexOf('opera') != -1);
  if (is_opera)
    return;
  
  // put a try/catch block around the whole thing, just in case
  try {
    if (!document.getElementById(iFrameDivID)) {
      // don't use innerHTML to update the body, because it can cause global variables
      // that are currently pointing to objects on the page to have bad references
      //document.body.innerHTML += '<iframe id='' + iFrameDivID + '' src='javascript:false;' scrolling='no' frameborder='0'>';
      var newNode = document.createElement('iFrame');
      newNode.setAttribute('id', iFrameDivID);
      newNode.setAttribute('src', 'javascript:false;');
      newNode.setAttribute('scrolling', 'no');
      newNode.setAttribute ('frameborder', '0');
      document.body.appendChild(newNode);
    }
    
    if (!pickerDiv)
      pickerDiv = document.getElementById(datePickerDivID);
    if (!iFrameDiv)
      iFrameDiv = document.getElementById(iFrameDivID);
    
    try {
      iFrameDiv.style.position = 'absolute';
      iFrameDiv.style.width = pickerDiv.offsetWidth+'px';
      iFrameDiv.style.height = pickerDiv.offsetHeight+'px';
      iFrameDiv.style.top = pickerDiv.style.top;
      iFrameDiv.style.left = pickerDiv.style.left;
      iFrameDiv.style.zIndex = pickerDiv.style.zIndex - 1;
      iFrameDiv.style.visibility = pickerDiv.style.visibility ;
      iFrameDiv.style.display = pickerDiv.style.display;
    } catch(e) {
    }
 
  } catch (ee) {
  }
}
</script>

</form>

	<script type ="text/javascript" language ="javascript">
		$.extend({
			isVislble: function() {
				$("#htxtSeqNo").val($(this).attr("seqNo"));
				$("#htxtQuestionNo").val($(this).attr("questionNo"));
				///alert($("#htxtSeqNo").val());
				return true;
			},

			getParam: function(key) {
				var hu = window.location.search.substring(1);
				var gy = hu.split("&");
				for (i = 0; i < gy.length; i++) {
					var ft = gy[i].split("=");
					if (ft[0] == key) {
						return ft[1];
					}
				}

			},

			openQuestion: function(seqNo) {
				//alert($("table.reply tr.first a[name='hrefContents']").length);
				$("table.reply tr.first a[name='hrefContents']").each(function() {
					if ($(this).attr("SeqNo") == seqNo) {
						var aLinkID = $(this).attr("ID").replace("hrefContents", "");
						var answerID = "htrAnswers" + aLinkID;

						toggleRow(answerID);
						$.setRead("True", aLinkID, seqNo);
					}
				});
			}

		});

		$(document).ready(function() {
			var seqNo = $.getParam("qnano");
			//alert(seqNo);
			if (seqNo != null)
				$.openQuestion(seqNo);

			$(":image[name='himgDelete']", "#uxcOrderTab6 table").filter(function() { return $(this).css("display") != "none" }).bind("click", $.isVislble);
		});
	</script>	
	
		





<%@ include file="/views/common/footer.jsp"%> --%>