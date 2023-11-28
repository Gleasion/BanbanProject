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

@WebServlet("/board/commentReportInsert.do")
public class CommentReportInsertController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bdNo = Integer.parseInt(req.getParameter("bdNo"));
		int bdComNo = Integer.parseInt(req.getParameter("bdComNo"));
		String memId = req.getParameter("memId");
		int bdCateNo = Integer.parseInt(req.getParameter("bdCateNo"));
		
		IBoardService bdService = BoardServiceImpl.getInstance();
		
		CommentVO cv = new CommentVO();
		cv.setBdNo(bdNo);
		cv.setBdComNo(bdComNo);
		cv.setMemId(memId);
		cv.setBdCateNo(bdCateNo);
		
		req.setAttribute("cv", cv);
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/board/commentReportInsertForm.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
	    req.setCharacterEncoding("UTF-8");
		
	    String memId = req.getParameter("memId");
	    String bllstRsn = req.getParameter("bllstRsn");
	    String reporter = (String) req.getSession().getAttribute("loginCode");
		String repCate = req.getParameter("repCate");
		int bdNo = Integer.parseInt(req.getParameter("bdNo"));
		int bdComNo = Integer.parseInt(req.getParameter("bdComNo"));
		int bdCateNo = Integer.parseInt(req.getParameter("bdCateNo"));
		
		IBoardService bdService = BoardServiceImpl.getInstance();

		ReportVO rv = new ReportVO(memId, bllstRsn, reporter, repCate);
		rv.setBdComNo(bdComNo);
		int cnt = bdService.registerReportComment(rv);
		
		String msg = "";
		if(memId.equals(reporter)) {
			msg = "본인의 댓글은 신고할 수 없습니다.";
		}else {
			if(cnt > 0) {
				msg = "신고에 성공하였습니다.";
			
				bdService.modifybdComRepcnt(bdComNo);
				bdService.modifyMemRepcnt(memId);
			
			}else {
				msg = "신고에 실패하였습니다.";
			}
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
		} else {
			viewPath = "fail";
		}
		
		resp.sendRedirect(req.getContextPath() + "/board/" + viewPath + "Detail.do?bdNo=" + bdNo);
	}
}
