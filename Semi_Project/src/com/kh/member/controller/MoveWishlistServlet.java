package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MoveWishlistServlet
 */
@WebServlet("/member/moveWishlist")
public class MoveWishlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoveWishlistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Integer> booksId = new ArrayList();
		String[] bookId = request.getParameterValues("BookId");
		Member m = (Member) request.getSession().getAttribute("logined");
		
		if(bookId==null) {
			request.setAttribute("msg", "이동할 상품을 선택해주세요");
			request.setAttribute("loc", "/member/mark?memberNum="+m.getMemberNum());
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		for(String i:bookId) {
			booksId.add(Integer.parseInt(i));
		}
		int deleteCount = booksId.size();
		
		int rs = new MemberService().moveWishlist(booksId, m.getMemberNum());
		if(rs>0) {
			//찜목록 장바구니로 이동 성공
			//장바구니로 이동했으니 찜목록에서는 제거
			int result = new MemberService().markMutiDelete(booksId, m.getMemberNum(),deleteCount);
			request.setAttribute("msg", "선택한 상품을 장바구니로 이동시켰습니다.");
		}else {
			//찜목록 장바구니로 이동 실패
			request.setAttribute("msg", "장바구니로 이동 실패!");

		}
		request.setAttribute("loc", "/member/wishlist?memberNum="+m.getMemberNum());
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
