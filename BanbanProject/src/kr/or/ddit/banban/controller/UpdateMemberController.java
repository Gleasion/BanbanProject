package kr.or.ddit.banban.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.banban.service.MemberServiceImpl;
import kr.or.ddit.banban.service.IMemberService;
import kr.or.ddit.banban.vo.MemberVO;
//기존에 있는 정보를 수정하다보니 기존에 있는 데이터를 보여줘야 한다.
@MultipartConfig
@WebServlet("/MemberUpdate")
public class UpdateMemberController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	String memId = (String) req.getSession().getAttribute("loginCode");
		
		IMemberService memService = MemberServiceImpl.getInstance();
		
		MemberVO mv = memService.getMember(memId);
		
		req.setAttribute("mv", mv);

		req.getRequestDispatcher("/views/member/memberUpdate.jsp").forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
	
		String memId = (String) req.getSession().getAttribute("loginCode");
		
		String memPw = req.getParameter("memPw");
		String memTel = req.getParameter("memTel");
		String memAddr = req.getParameter("memAddr");
		String memNic = req.getParameter("memNic");
		String memEmail = req.getParameter("memEmail");
		IMemberService memberService = MemberServiceImpl.getInstance();
		
		MemberVO mv = new MemberVO(memId, memPw, memNic, memTel, memAddr, memEmail);
		
		System.out.println("업데이트 멤버 vo : "+ mv);
		int cnt = memberService.modifyMember(mv);
		
		String msg = "";
		if(cnt > 0) {
			//성공
			msg = memId+"님의 회원 정보 수정이 완료되었습니다.";
		}else {
			//실패
			msg = memId+"님의 회원 정보 수정이 실패했습니다.";
		}
		
		HttpSession httpSesion = req.getSession();
		httpSesion.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/Mypage");
		
		
	}
}
