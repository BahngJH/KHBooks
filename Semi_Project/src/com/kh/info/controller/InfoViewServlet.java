package com.kh.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.book.model.vo.Book;
import com.kh.info.model.service.InfoService;

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
		
		/*최근 본 목록 쿠키*/
		Cookie[] cookies = request.getCookies();
		String cookieValue = "";
		
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("recent")) {
					cookieValue = c.getValue();
				}
			}
		}
		
		if(cookies.length == 5) {
			//쿠키 값이 5개만 유지되도록 함 
			for(int i=0;i<cookies.length-1;i++) {
				cookies[i] = cookies[i+1];
			}
		}
		
		
		
		Cookie c = new Cookie("recent", String.valueOf(b.getBookId()));
		
		
		System.out.println(b);
		request.setAttribute("book", b);
		request.getRequestDispatcher("/views/inforconpare_hwang/BookInformationPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
