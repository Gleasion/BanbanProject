package kr.or.ddit.banban.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.CommentVO;

@WebServlet( "/admin/blackListCheckDetail.do")
public class BlackListCheckDetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bdNo = Integer.parseInt(req.getParameter("bdNo"));
		int bdCateNo = Integer.parseInt(req.getParameter("bdCateNo"));
		System.out.println("bdCateNo>>>>>>>>>>"+bdCateNo);
		
		IBoardService bdService = BoardServiceImpl.getInstance();
		
		BoardVO bv = bdService.getBoardOneAdmin(bdNo);
		req.setAttribute("bv", bv);

		List<CommentVO> cmList = bdService.getAllComment(bdNo);
		req.setAttribute("cmList", cmList);
		
		req.getRequestDispatcher("/views/admin/BlackListCheckDetail.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
