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
		
		Member m = (Member) request.getSession(false).getAttribute("logined");			
		if (m != null) {
			int memberNum = m.getMemberNum();
			System.out.println("회원번호: "+memberNum);
			
			List<QnaRe> qrList=new QnaService().selectMyRe(memberNum);
			//List<QnaSub>qsList=new QnaService().selctMySub(memberNum);
			
			int cPage;
			try {
			
				cPage=Integer.parseInt(request.getParameter("cPage"));
				
			}catch(NumberFormatException e)
			{
				cPage=1;
			}
			
			int numPerPage;
			try {
				numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
			}
			catch(NumberFormatException e){
				numPerPage=5;
			}
		
			int myTotal=new QnaService().selectMyCount(memberNum);
			System.out.println(myTotal);
			int totalPage=(int)Math.ceil((double)myTotal/numPerPage);
			System.out.println(totalPage);
			List<Qna> list=new QnaService().selecMyQnaList(memberNum,cPage,numPerPage);
			
			String pageBar="";
			int pageSize=5;
			int pageNo=((cPage-1)/pageSize)*pageSize+1;
			int pageEnd=pageNo+pageSize-1;
			
			if(pageNo==1)
			{
				pageBar+="<a aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a>";				
			}
			else 
			{
				pageBar+="<a href='"+request.getContextPath()+"/qna/qnaListMain?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a>";
			}
			//선택페이지 만들기
			while(!(pageNo>pageEnd||pageNo>totalPage))
			{
				if(cPage==pageNo)
				{
					pageBar+="<a class='cPage'>"+pageNo+"</a>";
					
				}
				else
				{
					pageBar+="<a href='"+request.getContextPath()+"/qna/qnaListMain?cPage="+(pageNo)+"&numPerPage="+numPerPage+"'>"+pageNo+"</a>";				
				}
				pageNo++;
			}
			//[다음]구현
			
			if(pageNo>totalPage)
			{
				pageBar+="<a aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>";
			}
			else 
			{
				pageBar+="<a href='"+request.getContextPath()+"/qna/qnaListMain?cPage="+pageNo+"&numPerPage="+numPerPage+"' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>";
			}
			System.out.println(pageBar);
					
			request.setAttribute("cPage",cPage);
			request.setAttribute("pageBar",pageBar);
			request.setAttribute("list", list);	
			request.setAttribute("qrList", qrList);	
			//request.setAttribute("qsList", qsList);	
			request.setAttribute("cnt", list.size());
			request.getRequestDispatcher("/views/csCenter/qnaMyList.jsp").forward(request, response);
				

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
