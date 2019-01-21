package com.kh.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import com.kh.info.model.service.InfoService;
import com.kh.wish.model.vo.Wish;

/**
 * Servlet implementation class InfoInsertServlet
 */
@WebServlet("/inforconpare_hwang/infoInsert")
public class InfoInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int wishNo = Integer.parseInt(request.getParameter("wishNo"));
		int memberNum = Integer.parseInt(request.getParameter("memberNum"));
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		int bookCount = Integer.parseInt(request.getParameter("bookCount"));
		
		Wish w=new Wish(wishNo,memberNum,bookId,bookCount);
		
		int result=new InfoService().insertWish(w);
		
		String msg="";
		String loc="";
		String view="/views/inforconpare_hwang/WishList/msg.jsp";
		
		
		if(result>0)
		{
			msg="책을 장바구니에 넣었습니다.";
			loc="history.back();";
		}
		else
		{
			msg="실패했습니다.";
			loc="history.back();";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
