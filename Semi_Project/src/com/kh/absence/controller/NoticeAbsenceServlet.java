package com.kh.absence.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.absence.model.service.AbsenceService;
import com.kh.absence.model.vo.Absence;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class NoticeAbsenceServlet
 */
@WebServlet("/notice/noticeabsence")
public class NoticeAbsenceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeAbsenceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		
		Member logined=(Member)request.getSession(false).getAttribute("logined");
		
		if(logined!=null) {
		
		int loginNum=logined.getMemberNum();
		String bookName=request.getParameter("bookName");
		String author=request.getParameter("authorName");
		String publisher=request.getParameter("publisher");
		String bookDate=request.getParameter("bookDate");
		String isbn=request.getParameter("isbn");
		
		Absence ab=new Absence();
		
		ab.setMemberNum(loginNum);
		ab.setBookName(bookName);
		ab.setAppDate(null);
		ab.setAuthor(author);
		ab.setBookDate(bookDate);
		ab.setISBN(isbn);
		ab.setPublisher(publisher);
		ab.setAppCancel(false);
		ab.setStatus(null);
		ab.setAppNum(0);
		
		int result=new AbsenceService().insertAbsence(ab);
		
		String msg="";
		String view="/views/common/msg.jsp";
		String loc="";
		
		if(result>0) {
			msg="신청이 완료됐습니다.";
			loc="/notice/absenceView";
		}else {
			msg="다시 신청해주세요.";
			loc="/notice/absence";
		}
		
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher(view).forward(request, response);
		}
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
