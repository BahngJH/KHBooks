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
 * Servlet implementation class KaKaoLoginServlet
 */
@WebServlet("/member/kakaoLogin")
public class KaKaoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KaKaoLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		//이름이 "홍길동" 식으로 넘어오기 때문에 "으로 짤라줌
		String[] names = name.split("\"");
		
		//회원이 있는지 검사, 없으면 회원가입부터 진행 후 로그인
		Member m = new MemberService().memberLogin(id);
		
		if(m==null) {
			//회원가입이 필요
			Member m2 = new Member();
			m2.setMemberId(id);
			//빈칸을 암호화 (로그인할 때 빈칸은 막히기 때문에 카카오로 로그인하는거 아니면 접근이 불가)
			m2.setMemberPw("z4PhNX7vuL3xVChQ1m2AB9Yg5AULVxXcg/SpIdNs6c5H0NE8XYXysP+DGNKHfuwvY7kxvUdBeoGlODJ6+SfaPg==");
			//실제 이름이 저장된 인덱스
			m2.setMemberName(names[1]);
			//일단 디폴트로 남자로 입력했음
			m2.setGender("남");
			//다른 데이터는 카카오에게 넘겨받지 못했다는 문구로 대체
			m2.setAddress("카카오에서 넘겨받은 데이터가 없습니다.");
			m2.setPhone("카카오에서 넘겨받은 데이터가 없습니다.");
			m2.setBirth("카카오에서 넘겨받은 데이터가 없습니다.");
			m2.setEmail("카카오에서 넘겨받은 데이터가 없습니다.");
			
			//카카오 자동 회원가입 로직 실행
			int rs = new MemberService().kakaoEnroll(m2);
			
			if(rs>0) {
				System.out.println("카카오 회원가입 완료");
				//회원가입 했으니 로그인까지 연동
				System.out.println("로그인까지 자동으로 연결!");
				//memberNum 데이터는 못불러와서 그거 가져오기위해 다시 실행
				Member m3 = new MemberService().memberLogin(id);
				
				session = request.getSession();
				session.setAttribute("logined", m3);
				response.getWriter().append("/");
			}else {
				System.out.println("카카오 회원가입 실패");
			}
			
		}else {
			//있는 회원
			System.out.println("카카오 로그인 성공");
			session.setAttribute("logined", m);
			//response.setContentType("text/checkedId;charset=utf-8");
			response.getWriter().append("/");
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
