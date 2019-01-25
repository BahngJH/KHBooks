package com.kh.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;
import com.kh.author.model.vo.Author;
import com.kh.book.model.vo.Book;

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
		String authorName=request.getParameter("authorName");
		int stock=Integer.parseInt(request.getParameter("bookstock"));
		String content =request.getParameter("updatecontent");
		int bookId=Integer.parseInt(request.getParameter("bookId"));
		
		//추가로 더 만듬, 저자소개 목차 책소개
		String authorInfo = request.getParameter("authorInfo");
		String toc = request.getParameter("toc");
		String bookInfo = request.getParameter("bookInfo");
		int authorNum = Integer.parseInt(request.getParameter("authornum"));
	
		Book b=new Book();
		b.setBookId(bookId);
		b.setBookName(bookname);
		b.setPrice(price);
		b.setPublisher(pulisher);
		b.setGenre(genre);
		b.setIsbn(isbn);
		b.setStock(stock);
		b.setBookContent(content);
		b.setToc(toc);
		b.setBookInfo(bookInfo);
		Author a = new Author();
		a.setAuthorName(authorName);
		a.setAuthorInfo(authorInfo);
		a.setauthorNum(authorNum);
		
		int result = new AdminService().updatebook(b);
		System.out.println("책 정보 수정 리턴값 "+result);
		int rs = new AdminService().updateAuthor(a);
		System.out.println("작가 정보 수정 리턴값 "+rs);
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
