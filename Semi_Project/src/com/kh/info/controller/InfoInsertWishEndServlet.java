package com.kh.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import com.kh.info.model.service.InfoService;
import com.kh.member.model.vo.Member;
import com.kh.wish.model.vo.Wish;

/**
 * Servlet implementation class InfoInsertServlet
 */
@WebServlet("/inforconpare_hwang/infoInsertWishEnd")
public class InfoInsertWishEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoInsertWishEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member logined=(Member)request.getSession(false).getAttribute("logined");
		int memberNum=logined.getMemberNum();
		int bookId=Integer.parseInt(request.getParameter("bookId"));
		int bookCount=Integer.parseInt(request.getParameter("bookCount"));
		

		Wish w=new Wish();

		w.setMemberNum(memberNum);
		w.setBookId(bookId);
		w.setBookCount(bookCount);
		
		System.out.println("장바구니 서블릿으로 넘어와라 : "+" "+memberNum+" "+bookId+" "+bookCount);
		
		int result=new InfoService().insertWish(w);
		
		
		if(result>0)
		{
			request.setAttribute("msg", "장바구니에 책을 넣었습니다.");
			request.setAttribute("loc", "/inforconpare_hwang/infoView?bookId="+bookId);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("msg", "장바구니에 책을 넣지 못했습니다.");
			request.setAttribute("loc", "/inforconpare_hwang/infoView?bookId="+bookId);
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
