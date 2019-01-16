package com.kh.notice.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/notice/update")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
		String title=request.getParameter("title");
		String content =request.getParameter("content");
		int no=Integer.parseInt(request.getParameter("no1"));
		Notice n=new Notice();
		n.setNoticeNo(no);
		n.setNoticeContent(content);
		n.setNoticeTitle(title);
		
		
		int result=new NoticeService().updateNotice(n);
		
		System.out.println("수정후 : "+n);
		String msg="";
		String view="/views/common/msg.jsp";
		String loc="";
		
		if(result>0) {
			msg="수정 성공";
			loc="/notice/noticemain";
		}else {
			msg="수정실패";
			loc="/notice/noticeupdate";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher(view).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
