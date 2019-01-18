package com.kh.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.kh.book.model.vo.Book;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;


/**
 * Servlet implementation class MarkServlet
 */
@WebServlet("/member/mark")
public class MarkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MarkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member logined = (Member) request.getSession(false).getAttribute("logined");
		if(logined==null) {
			
			response.sendRedirect(request.getContextPath()+"/views/login_myPage/login.jsp");
			return;
		}
		
		int memberNum = Integer.parseInt(request.getParameter("memberNum"));
		//회원번호로 조건을 걸어서 찜목록을 불러옴
		//List<Book> list= new MemberService().markList(memberNum);
		
		
		//현재 페이지를 나타낼 변수
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch (NumberFormatException e) {
			cPage=1;
		}
		//페이지당 몇개의 자료를 보일것인지
		int numPerPage = 5;
		//전체 페이지 구하는 메소드들
		int totalMark = new MemberService().selectMarkCount(memberNum);
		int totalPage = (int)Math.ceil((double)totalMark/numPerPage);
		//실제 데이터 구해오는 메소드
		List<Book> bookList = new MemberService().markList(cPage,numPerPage,memberNum);
		System.out.println(bookList);
		//list의 인덱스값으로 현재 몇개의 찜이 있는지 확인
		int count = bookList.size();
		String pageBar="";
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1)
		{
			pageBar+= "<li class='disabled'><span><span aria-hidden='true'> << </span></span></li>";
		}
		else {
			pageBar +="<li><a href='"+request.getContextPath()+
					"/member/mark?cPage="+(pageNo-1)+"&memberNum="+memberNum+"' aria-label='Previous'> << </a></li>";
		}
		//선택페이지 구현
		while(!(pageNo>pageEnd||pageNo>totalPage))
		{
			if(pageNo==cPage) {
				pageBar += "<li class='active'><span>"+pageNo+"<span class='sr-only'>(current)</span></span>";
			}else {
			pageBar +="<li><a href='"+request.getContextPath()+
					"/member/mark?cPage="+pageNo+"&memberNum="+memberNum+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		//다음구현
		if(pageNo>totalPage) {
			pageBar += "<li class='disabled'><span><span aria-hidden='true'> >> </span></span></li>";
		}else {
			pageBar +="<li><a href='"+request.getContextPath()+
					"/member/mark?cPage="+cPage+"&memberNum="+memberNum+"' aria-label='Next'> >> </a></li>";
		}
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("markCount", count);
		request.setAttribute("bookList", bookList);	
		request.getRequestDispatcher("/views/login_myPage/mark.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
