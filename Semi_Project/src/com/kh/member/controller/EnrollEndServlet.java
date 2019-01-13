package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class EnrollEndServlet
 */
@WebServlet(name="EnrollEndServlet", urlPatterns="/member/enrollEnd")
public class EnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		String memberName = request.getParameter("memberName");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String ad = request.getParameter("address1");
		String add= request.getParameter("address2");
		//주소 입력칸이 여러개라 따로 받아서 하나로 합침
		String address = ad+" "+add;
		
		Member m = new Member();
		m.setMemberId(memberId);
		m.setMemberPw(memberPw);
		m.setMemberName(memberName);
		m.setBirth(birth);
		m.setPhone(phone);
		m.setEmail(email);
		m.setGender(gender);
		m.setAddress(address);
		
		System.out.println(m);
		
		int rs = new MemberService().memberEnroll(m);
		if(rs>0)
		{
			//회원가입 성공!
			request.setAttribute("msg", "회원가입을 축하합니다!!");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/login_myPage/login.jsp").forward(request, response);
		}else
		{
			//회원가입 실패!!
			request.setAttribute("msg", "회원가입에 실패했습니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/login_myPage/enroll.jsp").forward(request, response);
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
