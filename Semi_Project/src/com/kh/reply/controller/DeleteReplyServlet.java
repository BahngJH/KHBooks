package com.kh.reply.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.reply.model.service.ReplyService;

/**
 * Servlet implementation class DeleteReplyServlet
 */
@WebServlet("/reply/deleteReply")
public class DeleteReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reNo=Integer.parseInt(request.getParameter("no"));//쿼리스트링으로 보내준 댓글번호
		int no=Integer.parseInt(request.getParameter("no1"));//쿼리스트링으로 보내준 원글 번호
		//댓글삭제
		int result=new ReplyService().deleteReply(reNo);
	
		
		String msg="";
		String view ="/views/common/msg.jsp";
		String loc="";
		if(result>0) {
			
			view="/notice/absencecontent?no="+no;
			
				
			}else{
				msg="삭제실패";
				loc="/";
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
