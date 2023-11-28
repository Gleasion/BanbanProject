package kr.or.ddit.banban.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.banban.admin.service.BlackListCheckServiceImpl;
import kr.or.ddit.banban.admin.service.IBlackListCheckService;
import kr.or.ddit.banban.service.DonationListServiceImpl;
import kr.or.ddit.banban.service.DonationServiceImpl;
import kr.or.ddit.banban.service.IDonationListService;
import kr.or.ddit.banban.vo.DonationListVO;

@WebServlet("/admin/ADdonationList.do")
public class AdminDonationListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IDonationListService service = DonationListServiceImpl.getInstance();
		
		
		List<DonationListVO> dcList = service.searchAllDonationList();
		
		req.setAttribute("dcList", dcList);
		

		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/DonationPayList2.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
