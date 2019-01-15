package com.kh.csCenter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.csCenter.model.vo.Qna;

/**
 * Servlet implementation class qnaInputEndServlet
 */
@WebServlet("/qna/InputFormEnd")
public class qnaInputEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public qnaInputEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qnaPart=request.getParameter("qnaPart");
		String qnaWriter=request.getParameter("qnaWriter");
		String mail1=request.getParameter("mail1");
		String mail2=request.getParameter("mail2");
		//email ID + 도메인
		String mail=mail1+"@"+mail2;
		String hp1=request.getParameter("hp1");
		String tel1=request.getParameter("tel1");
		String tel2=request.getParameter("tel2");
		String tel3=request.getParameter("tel3");
		//전화번호 처음/중간/끝  나눠 받아온것을 합친것.
		String phone=tel2+tel3;
		String qnaTitle=request.getParameter("qnaTitle");
		String qnaContent=request.getParameter("qnaContent");
		
		Qna q= new Qna();
		q.setQnaPart(qnaPart);
		q.setQnaTitle(qnaTitle);
		q.setQnaWriter(qnaWriter);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
