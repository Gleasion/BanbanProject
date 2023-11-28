package kr.or.ddit.banban.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.banban.service.MemberServiceImpl;
import kr.or.ddit.banban.service.IMemberService;

@WebServlet("/Delete")
public class DeleteMemberController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String memId = (String) req.getSession().getAttribute("loginCode");
		
		IMemberService memService = MemberServiceImpl.getInstance();

		int cnt = memService.removeMember(memId);	
		
		HttpSession Session = req.getSession();
		
		String msg = "";
		if(cnt > 0) {
			//성공
			msg = "회원 탈퇴가 정상적으로 진행되었습니다.";
			Session.removeAttribute("loginCode");
		}else {
			//실패
			msg = "회원 탈퇴가 정상적으로 이뤄지지 않았습니다.";
		}
		
		Session.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/Index.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
