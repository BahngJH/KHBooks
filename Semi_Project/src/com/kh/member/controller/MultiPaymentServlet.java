package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.book.model.vo.Book;

/**
 * Servlet implementation class MultiPaymentServlet
 */
@WebServlet("/member/multiPayment")
public class MultiPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MultiPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String[] bookNames =request.getParameterValues("bookName");
		 String[] bookCounts =request.getParameterValues("bookCount");
		 String[] bookPrices =request.getParameterValues("bookPrice");
		 String[] bookImages =request.getParameterValues("bookImage");
		 String[] authorNames =request.getParameterValues("authorName");
		 String[] publishers =request.getParameterValues("publisher");
		 
		 Book b = new Book();
		 for(int i=0;i<bookIds.length;i++)
		 {
			 b.setBookName(bookNames[i]);
			 b.setBookCount(bookCounts[i]);
			 b.setPrice(bookPrices[i]);
			 b.setBookImage(bookImages[i]);
			 b.setAuthor((bookNames[i]);
			 b.setBookName(bookNames[i]);
			 
		 }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
