package com.kh.csCenter.controller;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.csCenter.model.service.QnaService;
import com.kh.csCenter.model.vo.Qna;
import com.kh.csCenter.model.vo.QnaRe;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

import common.JDBCTemplate;
import common.MyFileRenamePolicy;

/**
 * Servlet implementation class QnaAnswerEndServlet
 */
@WebServlet("/qna/qnaAnswerEnd")
public class QnaAnswerEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QnaAnswerEndServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String reCheck = request.getParameter("reCheck");
		String reMail = request.getParameter("reMail");
		String reContent = request.getParameter("reContent");
		int memberNum = Integer.parseInt(request.getParameter("memberNum"));
		int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));
 				
		QnaRe qr = new QnaRe();
		qr.setReNum(0);
		qr.setAdminNum(memberNum);
		qr.setQnaNum(qnaNum);
		qr.setReMail(reMail);
		qr.setReContent(reContent);
		qr.setReStatus(null);
		qr.setReDate(null);
		System.out.println(qr);

		Qna q=new Qna();
		q.setReCheck(reCheck);
		q.setQnaNum(qnaNum);
		
		int rs = new QnaService().qnaAnswerEnroll(qr, q);
	
		// 응답처리
		String msg = "";
		String loc = "";
		String view = "/views/common/msg.jsp";

		if (rs > 0) {
			// 문의 정상 등록
			sendEmail(request, response, qr);
			msg = "답변이 정상적으로 등록되었습니다.";
			loc = "/qna/qnaListAdmin";
		} else {
			msg = "답변 등록에 실패하였습니다.";
			loc = "/qna/qnaContent?qnaNum="+qnaNum;
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

	private void sendEmail(HttpServletRequest request, HttpServletResponse response, QnaRe qr) throws ServletException, IOException {

		// 메일 수신여부 'yes' 체크 한 사람에 한하여 메일 전송.
		Qna q = new QnaService().selectNo(qr.getQnaNum());
		if (q.getQnaAnswer().equals("yes")) {

			Properties prop = new Properties();
			String smtpInfo = JDBCTemplate.class.getResource("./smtp.properties").getPath();
			prop.load(new FileReader(smtpInfo));

			// mail server 설정
			String host = "smtp.naver.com";
			String user = prop.getProperty("id"); // 자신의 네이버 계정
			String password = prop.getProperty("pw");// 자신의 네이버 패스워드

			// 메일 받을 주소
			String to_email = q.getQnaMail();

			// SMTP 서버 정보를 설정한다.
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 465);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});

			// email 전송
			try {
				MimeMessage msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress(user, "KH Books"));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

				// 메일 제목
				msg.setSubject("안녕하세요 KH BOOKS입니다. 문의 하신 답변 입니다.");
				// 메일 내용
				msg.setText("문의주신 내용입니다.\n\n"+q.getQnaContent()+"\n\n\n\n\n답변 내용입니다.\n\n"+q.getReContent());
				
				Transport.send(msg);
				System.out.println("이메일 전송");

			} catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
		}
		request.getRequestDispatcher("/views/csCenter/qnaListAdmin.jsp").forward(request, response);
	}
}
