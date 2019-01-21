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
 * Servlet implementation class BuyListServlet
 */
@WebServlet("/member/orderList")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member logined = (Member) request.getSession(false).getAttribute("logined");
		if(logined==null) {
			//로그인 정보가 없어서 로그인페이지로
			response.sendRedirect(request.getContextPath()+"/views/login_myPage/login.jsp");
			return;
		}
		
		//로그인 성공
		int no = logined.getMemberNum();
		
		//페이징 처리 하자~! 
		int cPage;//현재페이지를 의미
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}
		catch(NumberFormatException e)
		{
			cPage=1;
		}
		int numPerPage;//페이지당 자료수
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		}
		catch(NumberFormatException e)
		{
			numPerPage=5;
		}
		
		//페이지 수만큼의 데이터를 불러옴
		List<Order> list = new OrderService().selectList(no, cPage, numPerPage);
		
		//페이지구성해보자~!
		//전체자료수를 확인
		int totalOrder = new OrderService().selectOrderCount();
		//전체페이지수
		int totalPage=(int)Math.ceil((double)totalOrder/numPerPage);
		//페이지바 html코드 누적변수
		String pageBar="<nav>";
		pageBar += "<ul class='pagination'>";
		//페이지바길이
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		//페이지바를 구성
		if(pageNo==1)
		{
			pageBar+="<li><span aria-hidden='true'>&laquo;</span></li>";
		}
		else 
		{
			pageBar+="<li><a href='"+request.getContextPath() +"/member/orderList?cPage=" + (pageNo-1) + "&numPerPage="+numPerPage+"' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
		}
				
		//선택페이지 만들기
		while(!(pageNo>pageEnd||pageNo>totalPage))
		{
			if(cPage==pageNo)
			{
				pageBar+="<li><span class='cPage'>"+pageNo+"</span></li>";
			}
			else
			{
				pageBar+="<li><a href='"+request.getContextPath()+"/member/orderList?cPage="+(pageNo)+"&numPerPage="+numPerPage+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		
		
		//[다음]구현
		
		if(pageNo>totalPage)
		{
			pageBar+="<li><span aria-hidden='true'>&raquo;</span></li>";
		}
		else 
		{
			pageBar+="<li><a href='"+request.getContextPath()+"/member/orderList?cPage="+pageNo+"&numPerPage="+numPerPage+"'><span aria-hidden='true'>&raquo;</span></a></li>";
		}		
				
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/login_myPage/orderList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
