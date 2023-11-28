package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;

@WebServlet("/board/commentDelete.do")
public class CommentDeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bdNo = Integer.parseInt(req.getParameter("bdNo"));
		int bdComNo = Integer.parseInt(req.getParameter("bdComNo"));
		int bdCateNo = Integer.parseInt(req.getParameter("bdCateNo"));
		
		String memId = (String) req.getSession().getAttribute("loginCode");
		
		IBoardService bdService = BoardServiceImpl.getInstance();
		
		int cnt = bdService.removeBoardComment(bdComNo, memId);
		
		String msg = "";
		if(cnt > 0) {
			msg = "댓글 삭제에 성공하였습니다.";
		}else {
			msg = "댓글 삭제에 실패하였습니다.";
		}
		
		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);
		
		String viewPath = "";
	    if (bdCateNo == 100) {
			viewPath = "notice";
		} else if (bdCateNo == 200) {
			viewPath = "ask";
		} else if (bdCateNo == 300) {
			viewPath = "review";
		} else if (bdCateNo == 400) {
			viewPath = "dona";
		} else if (bdCateNo == 500) {
			viewPath = "free";
		} else if (bdCateNo == 600) {
			viewPath = "adv";
		}
				
		resp.sendRedirect(req.getContextPath() + viewPath + "Detail.do?bdNo=" + bdNo);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
