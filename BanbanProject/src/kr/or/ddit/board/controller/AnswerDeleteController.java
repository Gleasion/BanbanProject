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

@WebServlet("/board/answerDelete.do")
public class AnswerDeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bdNo = Integer.parseInt(req.getParameter("bdNo"));
		int bdAnswerNo = Integer.parseInt(req.getParameter("bdAnswerNo"));
		
		String hosCd = (String) req.getSession().getAttribute("loginCode");
		
		IBoardService bdService = BoardServiceImpl.getInstance();
		
		int cnt = bdService.removeAnswerBoard(bdAnswerNo, hosCd);
		
		String msg = "";
		if(cnt > 0) {
			msg = "답변 삭제에 성공하였습니다.";
		}else {
			msg = "답변 삭제에 실패하였습니다.";
		}
		
		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "askDetail.do?bdNo=" + bdNo);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
