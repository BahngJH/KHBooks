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
import com.kh.csCenter.model.vo.QnaRe;
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
		
		
		//int reNum = qr.getReNum();
	/*	int reNum=Integer.parseInt(request.getParameter("reNum"));
		System.out.println(reNum);
		List<QnaRe> qrList = new QnaService().selectMyRe(reNum);	
		request.setAttribute("qrList", qrList);*/
		
		Member m = (Member) request.getSession(false).getAttribute("logined");			
		if (m != null) {
			int memberNum = m.getMemberNum();
			System.out.println("회원번호: "+memberNum);
			List<Qna> list = new QnaService().selecMyQnaList(memberNum);	
			request.setAttribute("list", list);
			request.setAttribute("cnt", list.size());
			request.getRequestDispatcher("/views/csCenter/qnaMyList.jsp").forward(request, response);

		} else {
			request.getRequestDispatcher("/views/login_myPage/login.jsp").forward(request, response);

		}
		
		QnaRe qr=(QnaRe) request.getAttribute("reNum");
		if(qr!=null) {
			int reNum=Integer.parseInt(request.getParameter("reNum"));
			System.out.println("번호나오나?"+reNum);
			List<QnaRe> qrList = new QnaService().selectMyRe(reNum);	
			request.setAttribute("qrList", qrList);
			request.getRequestDispatcher("/views/csCenter/qnaMyList.jsp").forward(request, response);
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
