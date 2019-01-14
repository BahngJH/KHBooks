package com.kh.search.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.author.model.vo.Author;
import com.kh.book.model.vo.Book;
import com.kh.search.model.service.SearchService;
import com.kh.search.model.vo.GenreCount;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key = request.getParameter("keyword");
		
		/*책 정보 가져오기*/
		List<Book> bList = new SearchService().selectBook(key);

		/*같은 책이 들어있을 수 있기 때문에 중복을 제거함*/
		List<Book> deduplicationList = new ArrayList<>();
		
		for(Book b : bList) {
			if(!deduplicationList.contains(b)) {
				deduplicationList.add(b);
			}
		}
		
		/*작가 정보 가져오기*/
		List<Author> aList = new SearchService().selectAuthor(key);
		
		/*카테고리 정보 가져오기*/
		List<GenreCount> gList = new SearchService().getGenreCount(key); 
		
		/*페이지 처리*/
		
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage = 1;
		}
		
		int numPerPage = 1;
		
		int totalBook = new SearchService().getBookCount(key);
		int totalPage = (int)Math.ceil((double)totalBook/numPerPage);
		
		String pageBar="";
		
		int pageBarSize = 5;
		int pageNo = ((cPage-1)/pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		
		/*pageBar 작성하기*/
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("numPerPage", numPerPage);	
		
		request.setAttribute("bookList", deduplicationList);
		request.setAttribute("authorList", aList);
		request.setAttribute("genreList", gList);
		request.getRequestDispatcher("/views/main/searchResult.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
