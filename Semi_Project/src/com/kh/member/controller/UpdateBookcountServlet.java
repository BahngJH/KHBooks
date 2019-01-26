package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.book.model.vo.Book;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class UpdateBookcountServlet
 */
@WebServlet("/member/updateBookcount")
public class UpdateBookcountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBookcountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bookId = request.getParameter("bookId");
		String bookCount = request.getParameter("bookCount");
		Member logined = (Member) request.getSession().getAttribute("logined");
		int memberNum = logined.getMemberNum();
		
		Book b = new Book();
		b.setBookId(Integer.parseInt(bookId));
		b.setBookCount(Integer.parseInt(bookCount));
		
		
		System.out.println(bookId+" "+bookCount);
		int rs = new MemberService().updateBookcount(b,memberNum);
		if(rs>0) {
			//수량 변경 성공
		}else {
			//수량 변경 실패
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
