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
import kr.or.ddit.banban.vo.MemberVO;

@WebServlet("/admin/blackListMemberCheck.do")
public class BlackListMemberCheckController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		IBlackListCheckService bcService = BlackListCheckServiceImpl.getInstance();
		
		List<MemberVO> mbList = bcService.getAllBlackMember();
		
		req.setAttribute("mbList", mbList);
		
		System.out.println("컨트롤러에서 mbList : "+mbList);
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/BlackListMemberCheck.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}
}
