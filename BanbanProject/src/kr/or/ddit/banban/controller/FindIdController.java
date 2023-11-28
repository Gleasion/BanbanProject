package kr.or.ddit.banban.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.banban.service.FindServiceImpl;
import kr.or.ddit.banban.service.IFindService;
import kr.or.ddit.banban.service.MemberServiceImpl;
import kr.or.ddit.banban.service.IMemberService;
import kr.or.ddit.banban.vo.MemberVO;

@WebServlet("/FindId")
public class FindIdController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/FindId.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String memNm = req.getParameter("memNm");
		String memEmail = req.getParameter("memEmail");

		System.out.println("controller 에서 memNm >> " + memNm);
		System.out.println("controller 에서  memEmail >> " + memEmail);

		IFindService service = FindServiceImpl.getInstance();
		IMemberService memService = MemberServiceImpl.getInstance();

		MemberVO mv = new MemberVO();

		mv.setMemNm(memNm);
		mv.setMemEmail(memEmail);

		MemberVO mv2 = service.getFindId(mv);

//		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		if (mv2 != null) {

			String memId = mv2.getMemId();
			resp.getWriter().println("{\"memId\": \"" + memId + "\"}");
		} else {
			resp.getWriter().println("{\"memId\": \"요청하신 정보의 ID가 존재하지 않습니다.\"}");
		}

	}
}
