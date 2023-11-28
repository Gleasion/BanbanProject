package kr.or.ddit.banban.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.banban.admin.service.BlackListCheckServiceImpl;
import kr.or.ddit.banban.admin.service.IBlackListCheckService;
import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

@WebServlet("/admin/blackListCheck.do")
public class BlackListCheckController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		IBlackListCheckService bcService = BlackListCheckServiceImpl.getInstance();
		
//		IBoardService bdService = BoardServiceImpl.getInstance();
		
		
		
		List<BoardVO> ncList = bcService.getAllNotice();
		req.setAttribute("ncList", ncList);
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/BlackListCheck.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
