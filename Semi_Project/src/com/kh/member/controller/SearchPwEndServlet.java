package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class SearchPwEndServlet
 */
@WebServlet(name="SearchPwEndServlet",urlPatterns ="/member/searchPwEnd")
public class SearchPwEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPwEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String AuthenticationKey = (String)request.getSession().getAttribute("AuthenticationKey");
		String AuthenticationUser = request.getParameter("AuthenticationUser");
		if(!AuthenticationKey.equals(AuthenticationUser))
		{
			System.out.println("인증번호 일치하지 않음");
			request.setAttribute("msg", "인증번호가 일치하지 않습니다");
			request.setAttribute("loc", "/member/searchPw");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		String memberPwNew = request.getParameter("memberPwNew");
		String memberId = request.getParameter("memberId");
		
		Member m = new Member();
		m.setMemberPw(memberPwNew);
		m.setMemberId(memberId);
		int rs = new MemberService().onlyPwUpdate(m);
		
		if(rs>0) {
			System.out.println("패스워드 변경 성공");
			//사용한 세션은 끊어줌
			HttpSession session = request.getSession();
			session.invalidate();
			request.setAttribute("msg", "정상적으로 변경되었습니다");
			request.setAttribute("loc", "/member/login");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			System.out.println("패스워드 변경 실패");
			//사용한 세션은 끊어줌
			HttpSession session = request.getSession();
			session.invalidate();
			request.setAttribute("msg", "패스워드 변경이 실패 되었습니다");
			request.setAttribute("loc", "/member/searchPw");
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
