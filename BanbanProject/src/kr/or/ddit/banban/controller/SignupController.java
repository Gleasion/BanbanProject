package kr.or.ddit.banban.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.banban.service.IMemberService;
import kr.or.ddit.banban.service.MemberServiceImpl;
import kr.or.ddit.banban.vo.MemberVO;

@WebServlet("/Signup")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/Signup.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setCharacterEncoding("UTF-8");
	    req.setCharacterEncoding("UTF-8");
	      
		// 1. 요청 파라미터 정보 가져오기
		String memId = req.getParameter("memId");
		String memPw = req.getParameter("memPw");
		String memNic = req.getParameter("memNic");
		String memNm = req.getParameter("memNm");
		String memBir = req.getParameter("memBir");
		String memAddr = req.getParameter("memAddr");
		String memEmail = req.getParameter("memEmail");
		String memTel = req.getParameter("memTel");
		
		// 2. 서비스 객체 생성하기
		IMemberService memService = MemberServiceImpl.getInstance();

		// 3. 회원정보 등록
		MemberVO mv = new MemberVO(memId, memPw, memNic, memNm, memBir, memAddr, memEmail, memTel);

		int cnt = memService.registerMember(mv);

		String msg = "";
		if (cnt > 0) {
			// 성공
			msg = "회원가입이 완료되었습니다.";
		} else {
			// 실패
			msg = "실패";
		}

		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);

		// 4. 목록 조회화면으로 이동하기
//		req.getRequestDispatcher("/member/list.do").forward(req, resp);
		resp.sendRedirect(req.getContextPath() + "/Index.jsp ");
	}

}
