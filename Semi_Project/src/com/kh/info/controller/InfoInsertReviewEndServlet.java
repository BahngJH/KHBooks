package com.kh.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.info.model.service.InfoService;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class InfoInsertReviewServlet
 */
@WebServlet("/inforconpare_hwang/infoInsertReviewEnd")
public class InfoInsertReviewEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoInsertReviewEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int memberNum=Integer.parseInt(request.getParameter("memberNum"));
		int grade=Integer.parseInt(request.getParameter("grade"));
		int bookId=Integer.parseInt(request.getParameter("bookId"));
		int checkOption=Integer.parseInt(request.getParameter("checkOption"));
		String reviewContext=request.getParameter("reviewContext");
		
		System.out.println(memberNum+grade+bookId+checkOption+reviewContext);
		
		Review r= new Review();
		
		r.setMemberNum(memberNum);
		r.setGrade(grade);
		r.setBookId(bookId);
		r.setCheckOption(checkOption);
		r.setReviewContext(reviewContext);
		
		int result=new InfoService().insertReview(r);
		
		if(result>0)
		{
			//리뷰등록 성공
			request.setAttribute("msg", "리뷰가 작성 되었습니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else
		{
			//리뷰등록 실패
			request.setAttribute("msg", "리뷰 등록을 실패하였습니다.");
			request.setAttribute("loc", "/views/inforconpare_hwang/BookInformationPage.jsp");
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
