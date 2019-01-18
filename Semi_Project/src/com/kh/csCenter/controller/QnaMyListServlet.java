package com.kh.csCenter.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.csCenter.model.service.QnaService;
import com.kh.csCenter.model.vo.Qna;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class QnaListMain
 */
@WebServlet("/qna/qnaListMain")
public class QnaMyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QnaMyListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Member m = (Member) request.getSession(false).getAttribute("logined");
		//Qna q = (Qna) request.getAttribute("qna");
		
		
		if (m != null) {
			
			//int qnaWriter=q.getQnaWriter();
			int memberNum = m.getMemberNum();
			List<Qna> list = new QnaService().selecMyQnaList(memberNum);
			request.setAttribute("list", list);
			request.setAttribute("cnt", list.size());
			request.getRequestDispatcher("/views/csCenter/qnaList.jsp").forward(request, response);

		} else {
			request.getRequestDispatcher("/views/login_myPage/login.jsp").forward(request, response);

		}

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
