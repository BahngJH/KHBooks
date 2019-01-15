package com.kh.review.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.review.model.service.ReviewService;

/**
 * Servlet implementation class DeleteSelectReviewServlet
 */
@WebServlet("/review/deleteSelectReview")
public class DeleteSelectReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSelectReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nums = request.getParameter("nums");		/*체크된 리뷰의 번호 (1,2,3 식으로 넘어옴)*/
		String[] snums = nums.split(",");				/*분리하여 배열에 담음*/
		List<Integer> inums = new ArrayList();			
		for(int i = 0; i < snums.length; i++) {
			inums.add(Integer.parseInt(snums[i]));		/*String 배열의 값을 하나씩 파싱하여 리스트에 담음*/
		}
		
		int result = new ReviewService().deleteSelectReview(inums);
		
		String msg="";
		String loc="/member/review";
		String view="/views/common/msg.jsp";
			
		if(result > inums.size() - 1) {				/*선택 값이 여러개일 수 있기 때문에 조건을  0이 아닌 size로 함*/
			msg="리뷰 삭제 성공";
		} 
		else {
			msg="리뷰 삭제 실패";
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
