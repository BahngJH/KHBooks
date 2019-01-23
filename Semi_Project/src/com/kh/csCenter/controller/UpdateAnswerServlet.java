package com.kh.csCenter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.csCenter.model.service.QnaService;
import com.kh.csCenter.model.vo.Qna;
import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class UpdateAnswer
 */
@WebServlet("/qna/answerUpdate")
public class UpdateAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaNum=Integer.parseInt(request.getParameter("qnaNum"));
		Qna q=new QnaService().selectNo(qnaNum);
		
		request.setAttribute("q", q);
		String view="";

		if(q!=null)
		{
			view="/views/csCenter/updateAnswer.jsp";
		}
		else 
		{
			request.setAttribute("msg", "조회된 자료가 없습니다.");
			request.setAttribute("loc", "/qna/qnaListAdmin");
			view="/views/common/msg.jsp";
		}
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
