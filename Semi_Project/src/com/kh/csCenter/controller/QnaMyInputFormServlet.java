package com.kh.csCenter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;


/**
 * Servlet implementation class qnaInputServlet
 */
@WebServlet("/qna/qnaInput")
public class QnaMyInputFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaMyInputFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member m = (Member)request.getSession(false).getAttribute("logined");
		//문의 글은 이메일 데이터가 없으면 에러가 떠서 예외처리 해준것
		if(m.getPhone().length()>11)
		{
			request.setAttribute("msg", "정보변경에서 부족한 데이터를 입력해주세요");
			request.setAttribute("loc", "/member/updateInfo");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		request.getRequestDispatcher("/views/csCenter/qnaAskForm.jsp").forward(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
