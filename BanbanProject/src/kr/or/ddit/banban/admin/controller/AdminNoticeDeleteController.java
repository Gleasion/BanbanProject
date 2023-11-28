package kr.or.ddit.banban.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.banban.admin.service.BlackListCheckServiceImpl;
import kr.or.ddit.banban.admin.service.IBlackListCheckService;
import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;

@WebServlet("/admin/deleteNotice.do")
public class AdminNoticeDeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bdNo = Integer.parseInt(req.getParameter("bdNo"));
//		String memId = (String) req.getSession().getAttribute("loginCode");
		int bdCateNo = Integer.parseInt(req.getParameter("bdCateNo"));
		System.out.println("딜리트 컨트롤러에 값 넘어오는지 확인 : "+bdCateNo);
		IBlackListCheckService blService= BlackListCheckServiceImpl.getInstance();
		
		int cnt = blService.removeNotice(bdNo, bdCateNo);
		
		String msg = "";
		if(cnt > 0) {
			// 성공
			msg = "게시글 삭제 성공하였습니다.";
		}else {
			// 실패
			msg = "게시글 삭제 실패하였습니다.";
		}
		
		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "blackListCheck.do");
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
