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
 * Servlet implementation class QnaCsMain
 */
@WebServlet("/qna/qnaListAdmin")
public class QnaAdminListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QnaAdminListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
			numPerPage=10;
		}
		
		int totalQna=new QnaService().selectCount();
	
		int totalPage=(int)Math.ceil((double)totalQna/numPerPage);
	
		List<Qna> list=new QnaService().selectList(cPage,numPerPage);
	
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
			pageBar+="<a href='"+request.getContextPath()+"/qna/qnaListAdmin?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a>";
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
				pageBar+="<a href='"+request.getContextPath()+"/qna/qnaListAdmin?cPage="+(pageNo)+"&numPerPage="+numPerPage+"'>"+pageNo+"</a>";				
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
			pageBar+="<a href='"+request.getContextPath()+"/qna/qnaListAdmin?cPage="+pageNo+"&numPerPage="+numPerPage+"' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>";
		}
		
				
		request.setAttribute("cPage",cPage);
		request.setAttribute("pageBar",pageBar);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/csCenter/qnaListAdmin.jsp").forward(request, response);
		
		

		//List<Qna> list = new QnaService().selectAllQna();
		/*request.setAttribute("list", list);
		request.setAttribute("cnt", list.size());*/
	

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
