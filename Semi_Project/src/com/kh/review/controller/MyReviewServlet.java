package com.kh.review.controller;

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
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class MyReviewServlet
 */
@WebServlet("/member/review")
public class MyReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member logined = (Member) request.getSession(false).getAttribute("logined");

		if (logined != null) {
			int memberNum = logined.getMemberNum();	
			
			
			//페이징 처리 하자~! 
			int cPage;//현재페이지를 의미
			try {
				cPage=Integer.parseInt(request.getParameter("cPage"));
			}
			catch(NumberFormatException e)
			{
				cPage=1;
			}
			int numPerPage = 5;//페이지당 자료수
			

			List<Review> list=new ReviewService().selectList(memberNum, cPage, numPerPage);
			
			//페이지구성해보자~!
			//전체자료수를 확인
			int totalReview = new ReviewService().selectReviewCount(memberNum);
			//전체페이지수
			int totalPage=(int)Math.ceil((double)totalReview/numPerPage);
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
				pageBar+="<li><a href='"+request.getContextPath() +"/member/review?cPage=" + (pageNo-1) + "&numPerPage="+numPerPage+"' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
			}
					
			//선택페이지 만들기
			while(!(pageNo>pageEnd||pageNo>totalPage))
			{
				if(cPage==pageNo)
				{
					pageBar+="<li class='page-item active'><span class='cPage'>"+pageNo+"</span></li>";
				}
				else
				{
					pageBar+="<li><a href='"+request.getContextPath()+"/member/review?cPage="+(pageNo)+"&numPerPage="+numPerPage+"'>"+pageNo+"</a></li>";
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
				pageBar+="<li><a href='"+request.getContextPath()+"/member/review?cPage="+pageNo+"&numPerPage="+numPerPage+"'><span aria-hidden='true'>&raquo;</span></a></li>";
			}		

			request.setAttribute("pageBar", pageBar);
			request.setAttribute("list", list);
			
			int cnt = 0;
			List<Review> reviewCount = new ReviewService().selectList(memberNum);			
			
			for(Review r : reviewCount) {
				if(r.getStatus().equals("y") || r.getStatus().equals("Y"))
					cnt ++;
			}
			
			
			boolean status = false;
			for(Review r: list) {
				if (r.getStatus().equals("y") || r.getStatus().equals("Y") ) {
					status = true;
				}
			}
			request.setAttribute("status", status);
			request.setAttribute("cnt", cnt);
			request.getRequestDispatcher("/views/login_myPage/myReview.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("/views/login_myPage/login.jsp").forward(request, response);
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
