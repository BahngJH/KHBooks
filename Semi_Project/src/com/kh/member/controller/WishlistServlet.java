package com.kh.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.book.model.vo.Book;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class WishlistServlet
 */
@WebServlet("/member/wishlist")
public class WishlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishlistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member logined = (Member) request.getSession(false).getAttribute("logined");
		
		if(logined==null) {
			response.sendRedirect(request.getContextPath()+"/views/login_myPage/login.jsp");
			return;
		}
		
		int memberNum = Integer.parseInt(request.getParameter("memberNum"));
		
		List<Book> booksList = new MemberService().getWishlist(memberNum);
		int wishlistCount = booksList.size();
		
		request.setAttribute("booksList", booksList);
		request.setAttribute("wishlistCount", wishlistCount);
		request.getRequestDispatcher("/views/login_myPage/wishlist.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
