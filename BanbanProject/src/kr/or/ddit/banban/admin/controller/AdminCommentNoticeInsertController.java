package kr.or.ddit.banban.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.banban.admin.service.BlackListCheckServiceImpl;
import kr.or.ddit.banban.admin.service.IBlackListCheckService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.CommentVO;

@WebServlet("/admin/commentNoticeInsert.do")
public class AdminCommentNoticeInsertController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/BlackListCheckDetail.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
	    req.setCharacterEncoding("UTF-8");
		
	    int bdNo = Integer.parseInt(req.getParameter("bdNo"));
	    int bdCateNo = Integer.parseInt(req.getParameter("bdCateNo"));
		String bdComCont = req.getParameter("bdComCont");
		String memId = (String) req.getSession().getAttribute("loginCode");
		
		
		System.out.println("컨트롤러에서 memId : >>>>>>"+memId);
		
		IBlackListCheckService bcService = BlackListCheckServiceImpl.getInstance();
		
		CommentVO cv = new CommentVO(bdNo, bdComCont, memId);
		
		int cnt = bcService.registerNoticeComment(cv);
		
		String msg = "";
		if(cnt > 0) {
			msg = "댓글 등록에 성공하였습니다.";
		}else {
			msg = "댓글 등록에 실패하였습니다.";
		}
		
		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/admin/blackListCheckDetail.do?bdNo=" + bdNo + "&bdCateNo=" + bdCateNo);
	}
}
