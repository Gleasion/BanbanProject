package kr.or.ddit.banban.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

@WebServlet("/selectMyBoard.do")
public class selectMyBoardController extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String memId = req.getParameter("memId");
		
		IBoardService bdService	 = BoardServiceImpl.getInstance();
		
		List<BoardVO> selectMyBoard = bdService.selectMyBoard(memId);
		
		req.setAttribute("selectMyBoard", selectMyBoard);
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/member/selectMyBoard.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
