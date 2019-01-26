package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="LoginEndServlet",urlPatterns="/member/loginEnd")
public class LoginEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("memberId");
		String pw = request.getParameter("memberPw");
		String saveId = request.getParameter("saveId");
		//로그인 로직 아이디먼저 검사
		Member m = new MemberService().memberLogin(id);
		
		if(m==null || !m.getMemberPw().equals(pw)) {
			//로그인 실패 or 없는 회원
			request.setAttribute("msg", "로그인 실패! 아이디나 비밀번호를 다시 확인해 주세요");
			request.setAttribute("loc", "/member/login");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			
		}else{
			//로그인 성공
			//아이디 저장 여부를 보고 쿠키로 아이디값 저장
			if(saveId!=null) {
				Cookie c = new Cookie("saveId",id);
				c.setMaxAge(60*60*24*7);
				response.addCookie(c);
			}else {
				Cookie c = new Cookie("saveId",id);
				c.setMaxAge(0);
				response.addCookie(c);
			}
			
			//로그인되면 정보를 세션값에 넣고 브라우저가 닫힐 때까지 유지
			HttpSession session = request.getSession();
			session.setAttribute("logined", m);
			//회원정보는 세션에 넣었으니 Redirect로 데이터 없이 화면 전환
			response.sendRedirect(request.getContextPath()+"/");
			
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
