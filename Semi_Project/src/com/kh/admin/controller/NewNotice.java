package com.kh.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class NewNotice
 */
@WebServlet("/admin/noticeinsert")
public class NewNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewNotice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		Notice n = new Notice();
		n.setNoticeDate(null);
		n.setNoticeNo(0);
		n.setStatus(null);
		n.setNoticeTitle(title);
		n.setNoticeContent(content);
		int result= new AdminService().insertNotice(n);
		
		String msg="";
		String view="/views/common/msg.jsp";
		String loc="";
				
		if(result>0) {
			msg="등록완료";
			loc="/admin/adminnotice";
		}else {
			msg="등록실패";
			loc="/admin/adminnotice";
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
