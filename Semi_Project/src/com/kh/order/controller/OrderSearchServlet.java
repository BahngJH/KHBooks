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
 * Servlet implementation class OrderSearchServlet
 */
@WebServlet("/order/orderSearch")
public class OrderSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member logined = (Member) request.getSession(false).getAttribute("logined");
		int no = logined.getMemberNum();
		String keyword = request.getParameter("keyword");
		
		List<Order> list = new OrderService().searchOrder(keyword, no);
		
		boolean status = false;
		for(Order o : list) {
			if (o.getStatus().equals("y") || o.getStatus().equals("Y") ) {
				status = true;
			}
		}
		request.setAttribute("status", status);
		request.setAttribute("searchList", list);
		request.getRequestDispatcher("/views/login_myPage/searchOrderList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
