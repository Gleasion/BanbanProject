package kr.or.ddit.banban.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.banban.service.DonationServiceImpl;
import kr.or.ddit.banban.service.IDonationService;
import kr.or.ddit.banban.vo.MemberVO;

@WebServlet("/PayCon")
public class DonationController extends HttpServlet {
	 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String loginId = (String) req.getSession().getAttribute("loginCode");
		System.out.println("로그인 아이디 : " + loginId);
		
		IDonationService memService = DonationServiceImpl.getInstance();
		MemberVO mv = memService.getMemInfo(loginId);
		
		
		String amountStr = req.getParameter("amount");
		int amount = Integer.parseInt(amountStr); // int로 형변환
		
		req.setAttribute("amount", amount);
		req.setAttribute("mv", mv);
		
		System.out.println("mv: "+mv);
		System.out.println("amount: "+amount);
		
		req.getRequestDispatcher("pay.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);

	
	
	}
}
