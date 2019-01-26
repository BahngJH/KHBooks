package com.kh.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class BookAppendServlet
 */
@WebServlet("/admin/bookappend")
public class BookAppendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookAppendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member logined = (Member) request.getSession().getAttribute("logined");

		if (logined != null) {
			if(logined.getIsAdmin() == 1){
			int memberNum = logined.getMemberNum();	
		
			String isbn = request.getParameter("isbn");
			String no = request.getParameter("no");
			
			if(isbn == null) {
				isbn = "";
			}
			
			request.setAttribute("no", no);
			request.setAttribute("isbn", isbn);
			request.getRequestDispatcher("/views/admin/bookAppendForm.jsp").forward(request, response);
			}else {
				//관리자가 아닐 때
				request.setAttribute("msg", "접근할 수 없는 페이지입니다.");
				request.setAttribute("loc", "/main/mainview");
				request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);;
			}
		}else {
			//로그인을 안했을 때
			response.sendRedirect(request.getContextPath()+"/member/login");
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
