package com.kh.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.info.model.service.InfoService;
import com.kh.mark.model.vo.Mark;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class InfoInsertJjimEndServlet
 */
@WebServlet("/inforconpare_hwang/infoInsertJjimEnd")
public class InfoInsertJjimEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoInsertJjimEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member logined=(Member)request.getSession(false).getAttribute("logined");
		int memberNum=logined.getMemberNum();
		int bookId=Integer.parseInt(request.getParameter("bookId"));
		
		System.out.println("찜 서블릿으로 넘어와 "+" "+memberNum+" "+bookId);
		
		Mark j=new Mark();
		
		j.setMemberNum(memberNum);
		j.setBookId(bookId);
		
		int result=new InfoService().insertMark(j);
		
		if(result>0)
		{
			request.setAttribute("msg", "찜을 성공하였습니다.");
			request.setAttribute("loc", "/inforconpare_hwang/infoView?bookId="+bookId);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("msg", "찜을 실패하였습니다.");
			request.setAttribute("loc", "/inforconpare_hwang/infoView?bookId="+bookId);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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
