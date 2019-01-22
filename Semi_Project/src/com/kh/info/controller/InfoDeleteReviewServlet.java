package com.kh.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.info.model.service.InfoService;

/**
 * Servlet implementation class InfoDeleteReviewServlet
 */
@WebServlet("/inforconpare_hwang/infoDeleteReview")
public class InfoDeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoDeleteReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int reviewNum=Integer.parseInt(request.getParameter("reviewNum"));
		int bookId=Integer.parseInt(request.getParameter("bookId"));
		
		System.out.println("리뷰삭제 서블릿으로 넘어오나? "+reviewNum+" "+bookId);
		
		int result=new InfoService().deleteReview(reviewNum);
		
		if(result>0)
		{
			//리뷰삭제 성공
			request.setAttribute("msg", "리뷰 삭제를 성공하였습니다.");
			request.setAttribute("loc", "/inforconpare_hwang/infoView?bookId="+bookId);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		else
		{
			//리뷰삭제 실패
			request.setAttribute("msg", "리뷰 삭제를 실패하였습니다.");
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
