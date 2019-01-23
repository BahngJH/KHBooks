package com.kh.reply.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.reply.model.service.ReplyService;
import com.kh.reply.model.vo.Reply;

/**
 * Servlet implementation class EnrollReplyServlet
 */
@WebServlet("/reply/enrollReply")
public class EnrollReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EnrollReplyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String orderReContent = request.getParameter("orderReContent");
		int memberNum = Integer.parseInt(request.getParameter("memberNum"));
		int orderBookNum = Integer.parseInt(request.getParameter("orderBookNum"));
		System.out.println("orderBookNum: "+orderBookNum);

		Reply r = new Reply();
		r.setOrderBookNum(orderBookNum);
		r.setMemberNum(memberNum);
		r.setOrderReContent(orderReContent);
		r.setOrderReCoNum(0);
		r.setStatus(null);
		r.setOrderReDate(null);

		System.out.println(r);

		int rs = new ReplyService().enrollReply(r);

		// 응답처리
		String msg = "";
		String loc = "";
		String view = "/views/common/msg.jsp";

		if (rs > 0) {
			// 댓글 정상 등록
			msg = "댓글 등록 완료!";
			loc = "/absence/page";
		} else {
			msg = "댓글 등록 실패!";
			loc = "/notice/absencecontent";

		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
