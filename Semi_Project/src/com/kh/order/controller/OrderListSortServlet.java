package com.kh.order.controller;

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
 * Servlet implementation class OrderListSortServlet
 */
@WebServlet("/order/orderSort")
public class OrderListSortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListSortServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member logined = (Member) request.getSession(false).getAttribute("logined");
		int no = logined.getMemberNum();
		int sort = Integer.parseInt(request.getParameter("sort"));
		
		List<Order> list = new OrderService().sortList(sort, no);
		
		request.setAttribute("sortList", list);
		request.getRequestDispatcher("/views/login_myPage/orderListSort.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
