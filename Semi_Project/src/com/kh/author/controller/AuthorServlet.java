package com.kh.author.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.author.model.service.AuthorService;
import com.kh.author.model.vo.Author;
import com.kh.book.model.vo.Book;

/**
 * Servlet implementation class AuthorServlet
 */
@WebServlet("/author/authorInfo")
public class AuthorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String authorId = request.getParameter("author");
		
		Author author = new AuthorService().selectAuthor(authorId);
		List<Book> blist = new AuthorService().selectAuthorBook(authorId);
		
		request.setAttribute("author", author);
		request.setAttribute("blist", blist);
		request.getRequestDispatcher("/views/main/author.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
