package com.kh.conpare.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.book.model.vo.Book;
import com.kh.conpare.model.service.ConpareService;

@WebServlet("/inforconpare_hwang/conpareView")
public class ConpareViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ConpareViewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	int bookId=Integer.parseInt(request.getParameter("bookId"));
    	List<Book> bList=new ConpareService().selectConpareBook(bookId);
		request.setAttribute("bList", bList);
		
		request.getRequestDispatcher("/views/inforconpare_hwang/ComparisonPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
