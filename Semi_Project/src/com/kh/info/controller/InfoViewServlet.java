package com.kh.info.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.author.model.vo.Author;
import com.kh.book.model.vo.Book;
import com.kh.info.model.service.InfoService;
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
		// TODO Auto-generated method stub
		int bookId=Integer.parseInt(request.getParameter("bookId"));

		Book b=new InfoService().selectInfoBook(bookId);
		List<Review> list=new InfoService().selectInfoReview(bookId);
		System.out.println(bookId);
		int cPage;
		try {
		
			cPage=Integer.parseInt(request.getParameter("cPage"));
			
		}catch(NumberFormatException e)
		{
			cPage=1;
			System.out.println(cPage);
		}
		
		int numPerPage;
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		}
		catch(NumberFormatException e){
			numPerPage=5;
			System.out.println(numPerPage);
		}
		
		int totalBoard=new InfoService().selectReviewCount();
//		System.out.println(totalBoard);
		int totalPage=(int)Math.ceil((double)totalBoard/numPerPage);
//		System.out.println(totalPage);
		List<Review> reviewCountList=new InfoService().selectReviewList(cPage,numPerPage);
		System.out.println(reviewCountList.size());
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
			+"/inforconpare_hwang/infoView?cPage="+(pageNo-1)
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
				+"/inforconpare_hwang/infoView?cPage="+(pageNo)
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
					+"/inforconpare_hwang/infoView?cPage="+pageNo
					+"&numPerPage="+numPerPage+"'>[다음]</a>";
		}
				
		
		
		//쿠키 설정
		response = setCookie(bookId, request, response);
		
		
		
//		System.out.println(pageBar);
//		System.out.println(b);
//		System.out.println(list.size());
		request.setAttribute("cPage",cPage);
		request.setAttribute("pageBar",pageBar);
		request.setAttribute("reviewCountList", reviewCountList);
		request.setAttribute("book", b);
		request.setAttribute("reviewList", list);
		request.setAttribute("reviewsize", list.size());
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
		String newValue="";
		if(cookies != null) {
			for(Cookie c : cookies) {
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
						newValue += bookId + "|";
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
