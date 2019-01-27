package com.kh.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.absence.model.service.AbsenceService;
import com.kh.absence.model.vo.Absence;
import com.kh.member.model.vo.Member;
import com.kh.reply.model.service.ReplyService;
import com.kh.reply.model.vo.Reply;

/**
 * Servlet implementation class AdminAbsence
 */
@WebServlet("/admin/absencelist")
public class AdminAbsence extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAbsence() {
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
		
			int no = Integer.parseInt(request.getParameter("no"));		
			Absence ab = new AbsenceService().selectNo(no);
			
	
			String view = "";
			if (ab != null) {
				List<Reply> rlist = new ReplyService().selectReplyList(no);
				view = "/views/admin/adminabsencecontent.jsp";
				request.setAttribute("ab", ab);
				request.setAttribute("reply", rlist);
			
	
			}else {
				view="views/common/msg.jsp";
				request.setAttribute("msg", "주문도서가 없습니다");
				request.setAttribute("loc", "/book/appendlist");
				
			}
	
			request.getRequestDispatcher("/views/admin/adminabsencecontent.jsp").forward(request, response);
		
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
