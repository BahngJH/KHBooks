package com.kh.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.absence.model.service.AbsenceService;
import com.kh.absence.model.vo.Absence;
import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeMainServlet
 */
@WebServlet("/notice/noticemain")
public class NoticeMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeMainServlet() {
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
			
			
		}catch(NumberFormatException e) {
			cPage=1;
			
		}
		int numPerPage;
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		}catch(NumberFormatException e) {
			numPerPage=8;
			
		}
		
		int totalBoard=new NoticeService().selectCount(); // 디비 속성갯수
		
		int totalPage=(int)Math.ceil((double)totalBoard/numPerPage);// 필요한 총 페이지수
		
		

		List<Notice> list=new NoticeService().selectList(cPage,numPerPage);
		
		String pageBar="";
		pageBar+="<ul class='pagination'>";
		int pageSize=5; //페이지 최대 수 5이면 12345<다음>
		int pageNo=((cPage-1)/pageSize)*pageSize+1;  //시작페이지
		int pageEnd=pageNo+pageSize-1; //끝페이지
		
		//보고있는페이지가 1이면 이전  
		if(pageNo ==1) {			
			pageBar+="<li><span aria-hidden='true'>&laquo;</span></li>";
		}else {
			 
			//2이상이면 이전 클릭시 현재 페이지 -1페이지로 이동
			pageBar+="<li><a href='"+request.getContextPath()
			+"/notice/noticemain?cPage="+(pageNo-1)
			+"&numPerPage="+numPerPage+"'aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
		}
		//선택페이지 만들기
				while(!(pageNo>pageEnd||pageNo>totalPage))
				{
					if(cPage==pageNo)
					{
						pageBar+="<li><span class='cPage'>"+pageNo+"</span></li>";
					}
					else
					{
						pageBar+="<li><a href='"+request.getContextPath()
						+"/notice/noticemain?cPage="+(pageNo)
						+"&numPerPage="+numPerPage+"'>"+pageNo+"</a></li>";
					}
					pageNo++;
				}
		//[다음]
		if(pageNo>totalPage) {
			pageBar+="<li><span aria-hidden='true'>&raquo;</span></li>";
			
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/notice/noticemain?cPage="+pageNo+"&numPerPage="+numPerPage+"'>[다음]</a>";
		}

		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/notice/mainnotice.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
