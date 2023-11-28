package kr.or.ddit.banban.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.banban.service.IMemberService;
import kr.or.ddit.banban.service.MemberServiceImpl;
import kr.or.ddit.banban.vo.MemberVO;


@WebServlet("/admin/ADMemberDelete")
public class MemberDeleteController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String memId = req.getParameter("memId"); 
		System.out.println("딜리트 컨트롤러 memID : "+ memId);
		IMemberService memService = MemberServiceImpl.getInstance();
		
		int cnt = memService.removeMember(memId);	
		System.out.println("");
		List<MemberVO> memList = memService.getAllMember();
		
		req.setAttribute("memList", memList);
		
		HttpSession Session = req.getSession();
		String msg = "";
		if(cnt > 0) {
			//성공
			msg = "회원 탈퇴가 정상적으로 진행되었습니다.";
		}else {
			//실패
			msg = "회원 탈퇴가 정상적으로 이뤄지지 않았습니다.";
		}
		
		
		Session.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/admin/ADMemberList");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
