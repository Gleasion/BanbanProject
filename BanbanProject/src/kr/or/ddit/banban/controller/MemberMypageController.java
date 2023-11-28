package kr.or.ddit.banban.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

//import kr.or.ddit.service.AtchFileServiceImpl;
//import kr.or.ddit.service.IAtchFileService;
//import kr.or.ddit.vo.AtchFileVO;
import kr.or.ddit.banban.service.IMemberService;
import kr.or.ddit.banban.service.MemberServiceImpl;
import kr.or.ddit.banban.vo.MemberVO;

@WebServlet("/Mypage")
public class MemberMypageController extends HttpServlet {

	private IMemberService memService;

	public MemberMypageController() {
		memService = MemberServiceImpl.getInstance();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String memId = (String) req.getSession().getAttribute("loginCode");

		String msg = "";

		if (memId != null) {

			MemberVO mv = memService.getMember(memId);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");

			req.setAttribute("mv", mv);

			req.getRequestDispatcher("/views/member/memberMypage.jsp");

			req.getRequestDispatcher("/views/member/memberMypage.jsp").forward(req, resp);

		} else {
			msg = "로그인 이후 이용하실 수 있는 서비스입니다.";
			HttpSession httpSession = req.getSession();
			httpSession.setAttribute("msg", msg);
			
			resp.sendRedirect(req.getContextPath() + "/Index.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
