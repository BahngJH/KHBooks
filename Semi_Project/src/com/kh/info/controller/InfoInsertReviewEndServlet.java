package com.kh.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.info.model.service.InfoService;
import com.kh.member.model.vo.Member;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class InfoInsertReviewEndServlet
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
		Member logined=(Member)request.getSession(false).getAttribute("logined");
		int memberNum=logined.getMemberNum();
		int bookId=Integer.parseInt(request.getParameter("bookId"));
		int checkOption=Integer.parseInt(request.getParameter("checkOption"));
		String reviewContext=request.getParameter("reviewContext");
		int grade=Integer.parseInt(request.getParameter("star_grade"));
		
		System.out.println("리뷰작성 서블릿으로 넘어오나?"+memberNum+" "+grade+" "+bookId+" "+checkOption+" "+reviewContext);
		
		Review r= new Review();
		
		r.setMemberNum(memberNum);
		r.setWriteDate(null);
		r.setGrade(grade);
		r.setBookId(bookId);
		r.setStatus(null);
		r.setCheckOption(checkOption);
		r.setReviewContext(reviewContext);
		
		int result=new InfoService().insertReview(r);
		
		if(result>0)
		{
			//리뷰등록 성공
			request.setAttribute("msg", "리뷰가 작성 되었습니다.");
			request.setAttribute("loc", "/inforconpare_hwang/infoView?bookId="+bookId);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else
		{
			//리뷰등록 실패
			request.setAttribute("msg", "리뷰 등록을 실패하였습니다.");
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
