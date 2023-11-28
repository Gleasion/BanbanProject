package kr.or.ddit.banban.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.banban.service.DonationListServiceImpl;
import kr.or.ddit.banban.service.IDonationListService;
import kr.or.ddit.banban.vo.DonationListVO;

@WebServlet("/DonationList")
public class DonationListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher req = request.getRequestDispatcher("Index.jsp");
		req.forward(request, response); // 요청위치로 req, resp 객체에 담긴 데이터 전달

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String mId = request.getParameter("mId");
		String amount = request.getParameter("amount");
		
		
		
		
		
		IDonationListService service = DonationListServiceImpl.getInstance();
		DonationListVO dv = new DonationListVO();
		dv.setMemId(mId);
		dv.setDpAmt(amount);
		
		service.insertDonation(dv);
		
		HttpSession httpSession = request.getSession();

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

	}

}
