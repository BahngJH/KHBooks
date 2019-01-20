package com.kh.csCenter.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.csCenter.model.service.QnaService;
import com.kh.csCenter.model.vo.Qna;
import com.kh.csCenter.model.vo.QnaRe;
import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;

/**
 * Servlet implementation class QnaAnswerEndServlet
 */
@WebServlet("/qna/qnaAnswerEnd")
public class QnaAnswerEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaAnswerEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String reCheck=request.getParameter("reCheck");
		String reMail=request.getParameter("reMail");
		String reContent=request.getParameter("reContent");
		int memberNum=Integer.parseInt(request.getParameter("memberNum"));
		int qnaNum=Integer.parseInt(request.getParameter("qnaNum"));
				
		QnaRe qr=new QnaRe();
		//qr.setReNum(0);
		qr.setAdminNum(memberNum);
		qr.setQnaNum(qnaNum);
		qr.setReCheck(reCheck);
		qr.setReMail(reMail);
		qr.setReContent(reContent);
		//qr.setReStatus(null);
		//qr.setReDate(null);		
		int rs=new QnaService().qnaAnswerEnroll(qr);
		System.out.println(qr);
		
		//응답처리
		String msg="";
		String loc="";
		String view="/views/common/msg.jsp";
		
		if(rs>0) {
			//문의 정상 등록
			msg="답변이 정상적으로 등록되었습니다.";			
			loc="/qna/qnaListAdmin";
		}else {
			msg="답변 등록에 실패하였습니다.";
			loc="/qna/qnaContent";						
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
