package kr.or.ddit.banban.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.banban.service.IMemberService;
import kr.or.ddit.banban.service.MemberServiceImpl;
import kr.or.ddit.banban.vo.MemberVO;


@WebServlet("/admin/ADMemberList")
public class MemberListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		
		List<MemberVO> memList = service.getAllMember();
		
		req.setAttribute("memList", memList);
		

		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/MemberList.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
