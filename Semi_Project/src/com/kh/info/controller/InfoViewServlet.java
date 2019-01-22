package com.kh.info.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.book.model.vo.Book;
import com.kh.info.model.service.InfoService;
import com.kh.member.model.vo.Member;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class InfoViewServlet
 */
@WebServlet("/inforconpare_hwang/infoView")
public class InfoViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookId=Integer.parseInt(request.getParameter("bookId"));
		Book b=new InfoService().selectInfoBook(bookId);

		int avg=new InfoService().selectReviewAvg();
		
		
		int cPage;//현재페이지를 의미
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}
		catch(NumberFormatException e)
		{
			cPage=1;
		}
		int numPerPage = 5;//페이지당 자료수

		List<Review> list=new InfoService().selectInfoReview(bookId, cPage, numPerPage);
		
		//페이지구성해보자~!
		//전체자료수를 확인
		int totalReview = new InfoService().selectReviewCount();
		//전체페이지수
		int totalPage=(int)Math.ceil((double)totalReview/numPerPage);
		//페이지바 html코드 누적변수
		String pageBar="<nav>";
		pageBar += "<ul class='pagination'>";
		//페이지바길이
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		//페이지바를 구성
		if(pageNo==1)
		{
			pageBar+="<li><span aria-hidden='true'>&laquo;</span></li>";
		}
		else 
		{
			pageBar+="<li><a href='"+request.getContextPath() +"/inforconpare_hwang/infoView?bookId="+bookId+"&cPage="+(pageNo-1) + "&numPerPage="+numPerPage+"' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
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
				pageBar+="<li><a href='"+request.getContextPath()+"/inforconpare_hwang/infoView?bookId="+bookId+"&cPage="+(pageNo)+"&numPerPage="+numPerPage+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		
		
		//[다음]구현
		
		if(pageNo>totalPage)
		{
			pageBar+="<li><span aria-hidden='true'>&raquo;</span></li>";
		}
		else 
		{
			pageBar+="<li><a href='"+request.getContextPath()+"/inforconpare_hwang/infoView?bookId="+bookId+"&cPage="+pageNo+"&numPerPage="+numPerPage+"'><span aria-hidden='true'>&raquo;</span></a></li>";
		}		

		request.setAttribute("pageBar", pageBar);
		request.setAttribute("list", list);
		
		int cnt = 0;
		for(Review r : list) {
			if(r.getStatus().equals("y") || r.getStatus().equals("Y"))
			cnt ++;
		}

		System.out.println("페이징처리 잘되나? "+(cPage-1)*numPerPage+1+" "+cPage*numPerPage);

		//쿠키 설정
		response = setCookie(bookId, request, response);
		
		request.setAttribute("avg", avg);
		request.setAttribute("cnt", cnt);
		request.setAttribute("book", b);
		request.setAttribute("reviewList", list);
		request.setAttribute("reviewsize", totalReview);
		request.getRequestDispatcher("/views/inforconpare_hwang/BookInformationPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private HttpServletResponse setCookie(int bookId, HttpServletRequest request ,HttpServletResponse response) {
		/*최근 본 목록 쿠키*/
		Cookie[] cookies = request.getCookies();
		String cookieValue = "";
		String newValue = bookId + "|";;
		if(cookies != null) {
			for(Cookie c : cookies) {
				//이미 recent 쿠키가 있을 경우
				if(c.getName().equals("recent")) {
					cookieValue = c.getValue();
										
					// |1||2||3||4||5| 
					
					String [] values = cookieValue.split("\\|");
										
					//쿠키 중복 값 막음
					//중복 값이 없을 때
					if(!cookieValue.contains(bookId+"|")) {
						//쿠키 값이 5개만 유지되도록 함 
						//값이 5개 일 때
						if(values.length > 4) {
							//처음 들어간 쿠키 값 제거
							for(int i=1;i<values.length;i++) {
								newValue += values[i] + "|";
							}
						//중복 값이 없고 값이 5개 미만일 때
						}else {
							newValue = cookieValue;
						}
						
					}else {
						//중복 값이 있을 때
						newValue = cookieValue;
					}
				}
			}
		}
		Cookie cookie = new Cookie("recent", newValue);
		cookie.setMaxAge(30 * 60 * 60 * 24);
		cookie.setPath("/");
		response.addCookie(cookie);
		
		return response;
	}
}
