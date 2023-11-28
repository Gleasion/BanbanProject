package kr.or.ddit.banban.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.banban.service.FindServiceImpl;
import kr.or.ddit.banban.service.IFindService;
import kr.or.ddit.banban.service.IMemberService;
import kr.or.ddit.banban.service.MemberServiceImpl;
import kr.or.ddit.banban.vo.MemberVO;

@WebServlet("/IdCheck")
public class IdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/FindPw.jsp");
		rd.forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String memId = req.getParameter("memId");

		System.out.println("controller 에서  memId >> " + memId);

		IFindService service = FindServiceImpl.getInstance();
		IMemberService memService = MemberServiceImpl.getInstance();

		int cnt = memService.checkMember(memId);
		System.out.println("controller에서 cnt >>>"+cnt);
		resp.getWriter().println("{\"cnt\": \"" + cnt + "\"}");
	}

}
