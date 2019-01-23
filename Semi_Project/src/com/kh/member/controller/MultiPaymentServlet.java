package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.book.model.service.BookService;
import com.kh.book.model.vo.Book;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MultiPaymentServlet
 */
@WebServlet("/member/multiPayment")
public class MultiPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MultiPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member logined = (Member) request.getSession(false).getAttribute("logined");
		int memberNum = logined.getMemberNum();
		String[] bookIds = request.getParameterValues("BookId");
		List<Integer> ids = new ArrayList();
		 
		//로그인이 안되어 있으면 로그인페이지로 이동
		if(logined==null) {
			response.sendRedirect(request.getContextPath()+"/views/login_myPage/login.jsp");
		}
		
		if(bookIds==null) {
			request.setAttribute("msg", "구매할 상품을 선택해주세요");
			request.setAttribute("loc", "/member/wishlist?memberNum="+logined.getMemberNum());
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}		 
		 
		for(int i=0; i<bookIds.length; i++) {
			ids.add(Integer.parseInt(bookIds[i])); 
		 }
		 
		 List<Book> payList = new BookService().payList(ids, memberNum);
		 //장바구니 목록제거, 구매목록 추가에 쓰기 위해 세션에 값을 저장
		 HttpSession s = request.getSession();
		 s.setAttribute("payBookList", payList);
		 
		 request.setAttribute("payList", payList);
		 request.getRequestDispatcher("/views/login_myPage/payment.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
