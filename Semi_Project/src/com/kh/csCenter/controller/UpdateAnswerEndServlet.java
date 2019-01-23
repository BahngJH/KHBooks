package com.kh.csCenter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.csCenter.model.service.QnaService;
import com.kh.csCenter.model.vo.Qna;
import com.kh.csCenter.model.vo.QnaRe;

/**
 * Servlet implementation class UpdateAnswerEndServlet
 */
@WebServlet("/qna/answerUpdateEnd")
public class UpdateAnswerEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAnswerEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reMail=request.getParameter("reMail");
		String reContent=request.getParameter("reContent");		
		String reCheck=request.getParameter("reCheck");
		int reNum=Integer.parseInt(request.getParameter("reNum"));
		int memberNum=Integer.parseInt(request.getParameter("memberNum"));
					
		int qnaNum=Integer.parseInt(request.getParameter("qnaNum"));
		
		QnaRe qr=new QnaRe();
		qr.setReNum(reNum);	
		qr.setAdminNum(memberNum);
		qr.setReContent(reContent);
		qr.setReMail(reMail);
		qr.setQnaNum(qnaNum);
		
		System.out.println("qr="+qr);
		
		int rs=new QnaService().updateAnswer(qr);
		
		System.out.println("수정된 답변 : "+qr);
		System.out.println(rs);
		
		String msg="";
		String view="/views/common/msg.jsp";
		String loc="";
		
		if(rs>0) {
			msg="수정 성공";
			loc="/qna/qnaContent?qnaNum="+qr.getQnaNum();
		}else {
			msg="수정실패";
			loc="/qna/answerUpdate";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
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
