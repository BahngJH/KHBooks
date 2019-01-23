package com.kh.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.book.model.vo.Book;
import com.kh.member.model.vo.Member;
import com.kh.order.model.service.OrderService;

/**
 * Servlet implementation class PaySuccessServlet
 */
@WebServlet("/order/paySuccess")
public class PaySuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaySuccessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//결제 성공해서 장바구니에서 데이터 지우고, 오더리스트에 구매한 책들 넣어줌
		//세션에 넣어둔 정보를 꺼내온다.
		List<Book> payBookList = (List<Book>) request.getSession().getAttribute("payBookList");
		Member m = (Member)request.getSession().getAttribute("logined");
		
		//판매한 수 만큼 stock 제거 
		int rs4 = new OrderService().stockSelect(payBookList);
		if(rs4>0) {
			System.out.println("수량제거 완료");
		}else {
			System.out.println("수량제거 실패");
		}
		//실제 대입될 값
		int milage =0;
		//임시저장값
		int milag =0;
		
		for(Book b:payBookList) 
		{
			milag +=(b.getPrice()*b.getBookCount())/10;
		}
		
		milage = m.getMileage()+milag;
		m.setMileage(milage);
		//마일리지 적립하기
		int rs3 = new OrderService().insertMilage(m.getMemberNum(),milage);
		if(rs3>0) {
			System.out.println("적립 완료");
		}else {
			System.out.println("적립 실패");
		}
		
		//orderList에 추가하기
		int rs =  new OrderService().insertOrderlist(m.getMemberNum(),payBookList);
		if(rs>0) {
			System.out.println("구매목록에 추가 완료");
		}else {
			System.out.println("구매목록 추가 실패");
		}
		
		//장바구니에서 구매된 책들 제거
		int rs2 = new OrderService().deleteWishlist(m.getMemberNum(),payBookList);
		if(rs2>0) {
			System.out.println("구매된 책, 장바구니에서 삭제 성공");
		}else {
			//이거 다이렉트로 1개만 구매할 때는 장바구니를 거치지 않고 가기 때문에 장바구니에서 실패 할 수 밖에 없음
			
			System.out.println("구매된 책, 장바구니에서 삭제 실패");
		}
		//마일리지 갱신을 위해 세션 재 설정
		request.getSession().setAttribute("logined", m);;
		//메인으로 화면 전환
		request.getRequestDispatcher("/views/buy_won/paySuccess.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
