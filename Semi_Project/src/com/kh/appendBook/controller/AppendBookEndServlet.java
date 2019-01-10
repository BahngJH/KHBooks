package com.kh.appendBook.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.book.model.vo.Book;

/**
 * Servlet implementation class AppendBookInsertEndServlet
 */
@WebServlet("/appendBook/appendBookFormEnd")
public class AppendBookEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AppendBookEndServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String country=request.getParameter("country");
		String bookName=request.getParameter("bookName");
		String authorName=request.getParameter("authorName");
		String publisher=request.getParameter("publisher");
		String bookDate=request.getParameter("country");
		String currency=request.getParameter("currency");
		String isbn=request.getParameter("isbn");
		
		Book b=new Book();
		
		b.setBookName(bookName);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
