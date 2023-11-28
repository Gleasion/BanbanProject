package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
import kr.or.ddit.board.vo.ReportVO;

@WebServlet("/board/boardReportInsert.do")
public class BoardReportInsertController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bdNo = Integer.parseInt(req.getParameter("bdNo"));
		String memId = req.getParameter("memId");
		
		IBoardService bdService = BoardServiceImpl.getInstance();
		
		BoardVO bv = new BoardVO();
		bv.setBdNo(bdNo);
		bv.setMemId(memId);
		
		req.setAttribute("bv", bv);
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/board/boardReportInsertForm.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
	    req.setCharacterEncoding("UTF-8");
		
	    String memId = req.getParameter("memId");
	    int bdNo = Integer.parseInt(req.getParameter("bdNo"));
	    String bllstRsn = req.getParameter("bllstRsn");
	    String reporter = (String) req.getSession().getAttribute("loginCode");
		String repCate = req.getParameter("repCate");
		
		IBoardService bdService = BoardServiceImpl.getInstance();
		ReportVO rv = new ReportVO(memId, bllstRsn, reporter, repCate);
		rv.setBdNo(bdNo);
		
		int cnt = bdService.registerReportNotice(rv);
		
		String msg = "";
		if(memId.equals(reporter)) {
			msg = "본인의 글은 신고할 수 없습니다.";
		}else {
			if(cnt > 0) {
				msg = "신고에 성공하였습니다.";

				bdService.modifyBoardRepcnt(bdNo);
				bdService.modifyMemRepcnt(memId);
			
			}else {
				msg = "신고에 실패하였습니다.";
			}
		}
			
		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/Index.jsp");
	}
}
