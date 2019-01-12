package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class BuyListServlet
 */
@WebServlet("/member/buyList")
public class BuyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member logined = (Member) request.getSession(false).getAttribute("logined");
		if(logined==null) {
			System.out.println("로그인 정보가 없기 때문에 로그인으로 이동");
			response.sendRedirect(request.getContextPath()+"/views/login_myPage/login.jsp");
			return;
		}
		
		System.out.println("로그인 확인이 되었기에 마이 페이지 보여줌");
		response.sendRedirect(request.getContextPath()+"/views/login_myPage/buyList.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
