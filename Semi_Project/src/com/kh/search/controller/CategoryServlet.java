package com.kh.search.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import com.kh.search.model.service.SearchService;
import com.kh.search.model.vo.GenreCount;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/search/category")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String genre = request.getParameter("category");
		String order = request.getParameter("order");
		
		if(genre == null) {
			genre = "소설";
		}
		
		if(order == null) {
			order = "default";
		}
		
		/*페이지 처리*/
		
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage = 1;
		}
				
		/*
		 * 도서 정보가 부족해서 페이지 테스트를 위해 1로 놓음
		 * 추후에 10으로 늘릴 예정
		 * */
		int numPerPage = 2;
		
		int totalBook = new SearchService().getBookCount(genre);
		int totalPage = (int)Math.ceil((double)totalBook/numPerPage);
		
		String pageBar="";
		
		int pageBarSize = 5;
		int pageNo = ((cPage-1)/pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		
		/*pageBar 작성하기*/
		
		/*이전 버튼*/
		if(pageNo == 1) {
			pageBar += "<li class='disabled'><span><span aria-hidden='true'> << </span></span></li>";
		}else { 
			pageBar += "<li><a href='"+request.getContextPath()+"/search/category?cPage="+(pageNo-1)+"&category="+genre+"&order="+order+"' aria-label='Previous'> << </a></li>";
		}
		
		/*숫자 버튼*/
		while(!(pageNo > pageEnd || pageNo > totalPage)) {
			if(cPage == pageNo) {
				pageBar += "<li class='active'><span>"+pageNo+"<span class='sr-only'>(current)</span></span>";
			}else {
				pageBar += "<li><a href='"+request.getContextPath()+"/search/category?cPage="+(pageNo)+"&category="+genre+"&order="+order+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		
		/*다음 버튼*/
		if(pageNo>totalPage) {
			pageBar += "<li class='disabled'><span><span aria-hidden='true'> >> </span></span></li>";
		}else {
			pageBar += "<li><a href='"+request.getContextPath()+"/search/category?cPage="+pageNo+"&category="+genre+"&order="+order+"' aria-label='Next'> >> </a></li>";
		}
		
		/*책 정보 가져오기*/
		List<Book> bList = new SearchService().selectBook(cPage, numPerPage, genre, order);
		
		
		/*같은 책이 들어있을 수 있기 때문에 중복을 제거함*/
		List<Book> deduplicationList = new ArrayList<>();
		
		for(Book b : bList) {
			if(!deduplicationList.contains(b)) {
				deduplicationList.add(b);
			}
		}
				
		/*쿠키 정보 가져오기*/
		Cookie [] cookies = request.getCookies();
		String cookieValue = "";
		
		
		List<Book> rList = new ArrayList<>();
		
		if(cookies != null){
			for(Cookie c : cookies){
				if(c.getName().equals("recent")){
					cookieValue = c.getValue();
					String [] values = cookieValue.split("\\|");
					
//					//처음과 끝 값의 | 제거
//					values[0] = values[0].split("\\|")[1];
//					values[values.length-1] = values[values.length-1].split("\\|")[0];
										
					for(String id : values) {
						rList.add(new InfoService().selectInfoBook(Integer.parseInt(id)));
					}
				}
			}
		}		
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("category", genre);
		request.setAttribute("bookList", deduplicationList);
		request.setAttribute("order", order);
		request.setAttribute("recentList", rList);
		request.getRequestDispatcher("/views/main/category.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
