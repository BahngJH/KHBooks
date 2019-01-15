package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class SearchIdEndServlet
 */
@WebServlet("/member/searchIdEnd")
public class SearchIdEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("memberName");
		String email = request.getParameter("email");
		String id = new MemberService().searchId(name,email);
		if(id.length()>0) {
			//조회 성공
			request.setAttribute("id", id);
			request.getRequestDispatcher("/views/login_myPage/searchIdEnd.jsp").forward(request, response);
		}else {
			//조회 실패 or 조건에 맞는 회원없음
			request.setAttribute("msg", "매칭되는 회원이 없습니다.");
			request.setAttribute("loc", "/member/searchId");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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
