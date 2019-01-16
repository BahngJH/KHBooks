package com.kh.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class UpdateReviewServlet
 */
@WebServlet("/review/updateReview")
public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int renum = Integer.parseInt(request.getParameter("renum"));			// 수정 리뷰
		int grade = Integer.parseInt(request.getParameter("star_grade"));		// 수정 별점
		String title = request.getParameter("updateTitle");						// 수정 제목
		String context = request.getParameter("updateContext");					// 수정한 내용
		
		Review r = new Review();
		r.setReviewNum(renum);
		r.setGrade(grade);
		r.setReviewTitle(title);
		r.setReviewContext(context);
		
		int result = new ReviewService().updateReview(r);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
