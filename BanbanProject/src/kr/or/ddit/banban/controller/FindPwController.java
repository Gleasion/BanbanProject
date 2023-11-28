package kr.or.ddit.banban.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.banban.service.FindServiceImpl;
import kr.or.ddit.banban.service.IFindService;
import kr.or.ddit.banban.service.IMemberService;
import kr.or.ddit.banban.service.MemberServiceImpl;
import kr.or.ddit.banban.vo.MemberVO;

@WebServlet("/FindPw")
public class FindPwController extends HttpServlet {

	@Override

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/FindPw.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String memNm = req.getParameter("memNm");
		String memEmail = req.getParameter("memEmail");
		String memId = req.getParameter("memId");

		IFindService service = FindServiceImpl.getInstance();
		IMemberService memService = MemberServiceImpl.getInstance();

		MemberVO mv = new MemberVO();

		mv.setMemId(memId);
		mv.setMemNm(memNm);
		mv.setMemEmail(memEmail);

		MemberVO mv2 = service.getFindPw(mv);

		resp.setCharacterEncoding("UTF-8");

		String memPw = "";
		if (mv2 != null) {

			memPw = mv2.getMemPw();
			resp.getWriter().println("{\"memPw\": \"회원가입 시 등록하신 이메일로 패스워드를 발송하였습니다. \"}");
			final String user = "dhkek567@naver.com"; // 발신자의 이메일 아이디를 입력
			final String password = "qaws482600"; // 발신자 이메일의 패스워드를 입력

			Properties prop = new Properties();
			prop.put("mail.smtp.host", "smtp.naver.com");
			prop.put("mail.smtp.port", 465);
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.ssl.enable", "true");
			prop.put("mail.smtp.ssl.trust", "smtp.naver.com");
			prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

			Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});

			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(user));

				// 수신자메일주소
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(mv.getMemEmail()));

				// Subject
				message.setSubject("비밀번호 찾기 결과"); // 메일 제목을 입력

				// Text
				message.setText("요청하신 비밀번호는 : " + memPw + "입니다."); // 메일 내용을 입력

				// send the message
				Transport.send(message); //// 전송
				System.out.println("message sent successfully...");

			} catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			resp.getWriter().println("{\"memPw\": \"요청하신 정보는 존재하지 않습니다. \"}");

		}

	}
}
