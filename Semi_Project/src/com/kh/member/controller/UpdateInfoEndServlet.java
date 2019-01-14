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
 * Servlet implementation class UpdateInfoEndServlet
 */
@WebServlet("/member/updateInfoEnd")
public class UpdateInfoEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateInfoEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String memberId = request.getParameter("memberId");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String memberPwNew = request.getParameter("memberPwNew");
		
		
		
		Member m = new Member();
		m.setMemberId(memberId);
		m.setBirth(birth);
		m.setPhone(phone);
		m.setEmail(email);
		m.setAddress(address);
		int rs =0;
		if(!memberPwNew.equals("")) {			
			m.setMemberPw(memberPwNew);
			rs = new MemberService().updateInfoPw(m);
		}else {			
			rs = new MemberService().updateInfo(m);
		}
		
		if(rs>0) {
			System.out.println("회원정보 수정 성공");
			HttpSession session = request.getSession(false);
			Member logined =new MemberService().memberLogin(memberId);
			session.setAttribute("logined", logined);
			request.getRequestDispatcher("/member/myHome").forward(request, response);
		}else {
			System.out.println("회원정보 수정 실패");
			request.setAttribute("msg", "회원정보 수정에 실패 했습니다");
			request.setAttribute("loc", "/member/myHome");
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
