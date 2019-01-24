package com.kh.conpare.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
    	String bookName=request.getParameter("bookName");
    	List<Book> bookList=new ConpareService().selectConpareBook(bookName);
    	response.getWriter().write(getJSON(bookName));
		request.setAttribute("bookList", bookList);
		
		request.getRequestDispatcher("/views/inforconpare_hwang/ComparisonPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public String getJSON(String bookName)
	{
		if(bookName == null) bookName="";
		StringBuffer result=new StringBuffer("");
		result.append("{\"result\":[");
		ConpareService conpareService=new ConpareService();
		List<Book> bookList=conpareService.selectConpareBook(bookName);
		for(int i=0; i<bookList.size(); i++)
		{
			result.append("[{\"value\":\""+bookList.get(i).getBookImage()+"\"},");
			result.append("[{\"value\":\""+bookList.get(i).getBookName()+"\"}],");
		}
		result.append("]}");
		return result.toString();
	}
}
