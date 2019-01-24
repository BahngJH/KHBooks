package com.kh.admin.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.kh.admin.model.service.AdminService;
import com.kh.book.model.vo.*;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/book/updatebook")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		
		String bookname=request.getParameter("updatename");
		int price=Integer.parseInt(request.getParameter("updateprice"));
		String pulisher=request.getParameter("updatepublisher");
		String genre=request.getParameter("updategenre");
		String isbn=request.getParameter("updateisbn");
		String edit=request.getParameter("bookedit");
		int stock=Integer.parseInt(request.getParameter("bookstock"));
		String content =request.getParameter("updatecontent");
		int bookId=Integer.parseInt(request.getParameter("bookId"));
		System.out.println(bookname);
	
		Book b=new Book();
		b.setBookId(bookId);
		b.setBookName(bookname);
		b.setPrice(price);
		b.setPublisher(pulisher);
		b.setGenre(genre);
		b.setIsbn(isbn);
		b.setEditor(edit);
		b.setStock(stock);
		b.setBookContent(content);
		System.out.println("서블릿"+b);
		
		int result = new AdminService().updatebook(b);
		String msg="";
		String view="/views/common/msg.jsp";
		String loc="";
		
		if(result>0) {
			msg="수정 완료";
			loc="/admin/book";
			
		}else {
			msg="수정실패";
			loc="/admin/book";
		}
		
		request.setAttribute("msg", msg);
		
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher(view).forward(request, response);
		
		

	
	}
	
		
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
