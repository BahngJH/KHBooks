package com.kh.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.order.model.service.OrderService;
import com.kh.order.model.vo.Order;

/**
 * Servlet implementation class MyHomeServlet
 */
@WebServlet("/member/myHome")
public class MyHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyHomeServlet() {
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
		
		List<Order> orderList = new OrderService().selectList(logined.getMemberNum());
		boolean status = false;
		for(Order o : orderList) {
			if(o.getStatus().equals("y") || o.getStatus().equals("Y")) {
				status = true;
			}
		}
		
		request.setAttribute("orderList", orderList);
		request.setAttribute("status", status);
		request.setAttribute("flag", "pass");
		request.getRequestDispatcher("/views/login_myPage/myHome.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
