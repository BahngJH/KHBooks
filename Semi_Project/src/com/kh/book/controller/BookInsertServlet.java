package com.kh.book.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.absence.model.service.AbsenceService;
import com.kh.author.model.service.AuthorService;
import com.kh.author.model.vo.Author;
import com.kh.book.model.service.BookService;
import com.kh.book.model.vo.Book;
import com.kh.reply.model.service.ReplyService;
import com.kh.reply.model.vo.Reply;
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

		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "도서 등록 오류");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String root = getServletContext().getRealPath("/");
		int maxSize = 10* 1024* 1024;
		String path = root+"/images/book";
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		//저자가 디비에 있는지 확인
		String authorName = mr.getParameter("author");
		Author author = new AuthorService().selectAuthorName(authorName);
		
		//저자가 없을 경우
		if(author == null) {
			new AuthorService().insertAuthor(authorName);
			author = new AuthorService().selectAuthorName(authorName);
		}		
		
		//도서 신청 글 번호
		String no = mr.getParameter("no");
		
		Book book = new Book();
		book.setBookInfo(mr.getParameter("info"));
		book.setBookContent(mr.getParameter("content"));
		book.setToc(mr.getParameter("index"));
		book.setStock(Integer.parseInt(mr.getParameter("count")));
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
		book.setBookImage(mr.getOriginalFileName("image"));
		book.setAuthorNum(author.getauthorNum());
		
		//도서 정보 삽입
		int result = new BookService().insertBook(book);
		
		//도서 정보 삽입 성공
		if(result >0) {
			request.setAttribute("msg", "도서 등록 성공");
			if(no != null) {
				//게시글이 있는 도서였을 경우
				Reply r = new Reply();
				r.setMemberId("0");
				r.setOrderBookNum(Integer.parseInt(no));
				r.setOrderReContent("도서 신청이 완료되었습니다.");
				
				new ReplyService().enrollReply(r);
				new AbsenceService().updateDone(Integer.parseInt(no));
			}
			
		}else {
			//실패
			request.setAttribute("msg", "도서 등록 오류");
		}
		request.setAttribute("loc", "/absence/page");
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
