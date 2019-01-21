package com.kh.csCenter.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.csCenter.model.service.QnaService;
import com.kh.csCenter.model.vo.Qna;
import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;

/**
 * Servlet implementation class qnaInputEndServlet
 */
@WebServlet("/qna/qnaInputEnd")
public class QnaMyInputEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaMyInputEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {			
			request.setAttribute("msg", "문의 등록 오류");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		//파일 경로
		String root=getServletContext().getRealPath("/");
		
		//파일 경로 설정 구분자.
		String saveDir=root+"upload"+File.separator+"qna";
		
		//파일 크기 설정
		int maxSize=1024*1024*10;//10mB
		
		//파일 업로드 객체 생성
		MultipartRequest mr=new MultipartRequest(request, saveDir, maxSize, "UTF-8", new MyFileRenamePolicy());
		String qnaPart=mr.getParameter("qnaPart");
		System.out.println(qnaPart);
		int qnaWriter=Integer.parseInt(mr.getParameter("memberNum"));
		String qnaAnswer=mr.getParameter("qnaAnswer");
		String mail1=mr.getParameter("mail1");
		String mail2=mr.getParameter("mail2");
		//email ID + 도메인
		String qnaMail=mail1+"@"+mail2;	
		String tel1=mr.getParameter("tel1");
		String tel2=mr.getParameter("tel2");
		String tel3=mr.getParameter("tel3");
		//전화번호 처음/중간/끝  나눠 받아온것을 합친것.
		String qnaTel=tel1+tel2+tel3;
		String qnaTitle=mr.getParameter("qnaTitle");
		String qnaContent=mr.getParameter("qnaContent");
		//String upfile=mr.getParameter("upfile");
		
		
		Qna q= new Qna();
		q.setQnaNum(0);
		q.setQnaDate(null);
		q.setQnaStatus(null);	
		q.setQnaPart(qnaPart);
		q.setQnaTitle(qnaTitle);
		q.setQnaWriter(qnaWriter);
		q.setQnaAnswer(qnaAnswer);
		q.setQnaMail(qnaMail);
		q.setQnaTel(qnaTel);
		q.setReContent(null);
		q.setQnaContent(qnaContent);
		q.setQnaOriFile(mr.getOriginalFileName("upfile"));
		q.setQnaReFile(mr.getFilesystemName("upfile"));
						
		System.out.println(q);
		
		int rs=new QnaService().qnaEnroll(q);
		
		//응답처리
		String msg="";
		String loc="";
		String view="/views/common/msg.jsp";
		
		if(rs>0) {
			//문의 정상 등록
			msg="문의글이 정상적으로 등록되었습니다.";			
			loc="/";
		}else {
			msg="문의글 등록에 실패하였습니다.";
			loc="/csCenter/qnaAskForm";						
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
