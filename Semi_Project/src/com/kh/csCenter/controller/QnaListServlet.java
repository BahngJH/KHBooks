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

/**
 * Servlet implementation class QnaListServlet
 */
@WebServlet("/qna/qnaList")
public class QnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		int totalQna=new QnaService().selectCount();
		int totalPage=(int)Math.ceil((double)totalQna/numPerPage);
		
		List<Qna> list=new QnaService().selectList(cPage,numPerPage);

		String pageBar="";
		int pageSize=5;
		int pageNo=((cPage-1)/pageSize)*pageSize+1;
		int pageEnd=pageNo+pageSize-1;
		
		if(pageNo==1)
		{
			pageBar+="<span>[이전]</span>";
		}
		else 
		{
			pageBar+="<a href='"+request.getContextPath()
			+"/board/boardList?cPage="+(pageNo-1)
			+"&numPerPage="+numPerPage+"'>[이전]</a>";
		}
		//선택페이지 만들기
		while(!(pageNo>pageEnd||pageNo>totalPage))
		{
			if(cPage==pageNo)
			{
				pageBar+="<span class='cPage'>"+pageNo+"</span>";
			}
			else
			{
				pageBar+="<a href='"+request.getContextPath()
				+"/board/boardList?cPage="+(pageNo)
				+"&numPerPage="+numPerPage+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		//[다음]구현
		
		if(pageNo>totalPage)
		{
			pageBar+="<span>[다음]</span>";
		}
		else 
		{
			pageBar+="<a href='"+request.getContextPath()
					+"/board/boardList?cPage="+pageNo
					+"&numPerPage="+numPerPage+"'>[다음]</a>";
		}
		
				
		request.setAttribute("cPage",cPage);
		request.setAttribute("pageBar",pageBar);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/csCenter/qnaAdmin.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
