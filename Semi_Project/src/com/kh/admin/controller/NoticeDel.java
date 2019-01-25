package com.kh.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;
import com.kh.notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeDel
 */
@WebServlet("/admin/adminnoticedel")
public class NoticeDel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int no=Integer.parseInt(request.getParameter("no"));	
		
		int result = new AdminService().deleteNotice(no);
			System.out.println(no);
		String msg="";
		String view ="/views/common/msg.jsp";
		String loc="";
		if(result>0) {
			msg="공지사항 삭제완료!";
			loc="/admin/adminnotice";
				
				
			}else{
				msg="삭제실패";
				loc="/admin/adminnotice";
			}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
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
