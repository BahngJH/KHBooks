package com.kh.book.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.book.model.vo.Book;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * Servlet implementation class BookInsertServlet
 */
@WebServlet("/book/insertbook")
public class BookInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String root = request.getSession().getServletContext().getRealPath("/");
		int maxSize = 10* 10* 1024;
		String path = root+"/images/book";
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		Book book = new Book();
		book.setBookContent(mr.getParameter("info"));
		book.setBookCount(Integer.parseInt(mr.getParameter("count")));
		book.setBookName(mr.getParameter("title"));
		book.setPublisher(mr.getParameter("pub"));
		book.setPrice(Integer.parseInt(mr.getParameter("price")));
		book.setGenre(mr.getParameter("genre"));
		book.setPageNum(Integer.parseInt(mr.getParameter("page")));
		book.setIsbn(mr.getParameter("isbn"));
		book.setEditor(mr.getParameter("editor"));
		book.setTranslator(mr.getParameter("traslator"));
		book.setBookCount(Integer.parseInt(mr.getParameter("count")));
		book.setBookDate(Date.valueOf(mr.getParameter("date")));
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
