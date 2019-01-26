package com.kh.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class DeleteBookServlet
 */
@WebServlet("/book/deleted")
public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBookServlet() {
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
		
				String id =request.getParameter("del");	
				
				String [] arr=id.split(",");
				
				
				int result=new AdminService().deleteBook(arr);
				
				String msg="";
				String view="/views/common/msg.jsp";
				String loc="";
				
				if(result==arr.length) {
					msg="삭제 성공";
					loc="/admin/book";
				}else {
					msg="삭제실패";
					loc="/admin/book";
				}
				
				
					
				
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher(view).forward(request, response);
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
