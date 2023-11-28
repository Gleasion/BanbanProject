package kr.or.ddit.banban.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.banban.service.IMemberService;
import kr.or.ddit.banban.service.MemberServiceImpl;
import kr.or.ddit.banban.vo.MemberVO;

@WebServlet("/admin/ADMemberDetail")
public class MemberDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String memId = req.getParameter("memId");

		IMemberService memService = MemberServiceImpl.getInstance();

		MemberVO mv = memService.getMember(memId);

		req.setAttribute("mv", mv);

		req.getRequestDispatcher("/views/admin/MemberDetail.jsp");

		req.getRequestDispatcher("/views/admin/MemberDetail.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
