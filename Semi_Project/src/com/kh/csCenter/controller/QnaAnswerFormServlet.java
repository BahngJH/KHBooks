package com.kh.csCenter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.csCenter.model.service.QnaService;
import com.kh.csCenter.model.vo.Qna;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class QnaAdminContentServlet
 */
@WebServlet("/qna/qnaContent")
public class QnaAnswerFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QnaAnswerFormServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		/*int memberNum=Integer.parseInt(request.getParameter("memberNum"));
		Member m=new MemberService().selectNo(memberNum);*/
		int no = Integer.parseInt(request.getParameter("no"));
		Qna q = new QnaService().selectNo(no);
			
		//request.setAttribute("m", m);
		request.setAttribute("q", q);
		request.getRequestDispatcher("/views/csCenter/qnaAnswerForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
