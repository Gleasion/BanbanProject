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

@WebServlet("/board/commentInsert.do")
public class CommentInsertController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bdCateNo = Integer.parseInt(req.getParameter("bdCateNo"));
		
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
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/board/" + viewPath + "Detail.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
	    req.setCharacterEncoding("UTF-8");
		
	    int bdNo = Integer.parseInt(req.getParameter("bdNo"));
//	    int bdComNo = Integer.parseInt(req.getParameter("bdComNo"));
	    int bdCateNo = Integer.parseInt(req.getParameter("bdCateNo"));
		String bdComCont = req.getParameter("bdComCont");
		String memId = (String) req.getSession().getAttribute("loginCode");
		
		IBoardService bdService = BoardServiceImpl.getInstance();

		CommentVO cv = new CommentVO(bdNo, bdCateNo, bdComCont, memId);
		cv.setBdNo(bdNo);
		
		String msg = "";
		if(bdCateNo == 200) {
			int cnt = bdService.registerAnswerComment(cv);
			
			if(cnt > 0) {
				msg = "병원 답변 등록에 성공하였습니다.";
			}else {
				msg = "병원 답변 등록에 실패하였습니다.";
			}
			
		}else {
			int cnt = bdService.registerBoardComment(cv);
			
			if(cnt > 0) {
				msg = "댓글 등록에 성공하였습니다.";
			}else {
				msg = "댓글 등록에 실패하였습니다.";
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
		}
		
		resp.sendRedirect(req.getContextPath() + "/board/" + viewPath + "Detail.do?bdNo=" + bdNo + "&bdCateNo=" + bdCateNo);
		System.out.println("bdNoM?<>M<?M><?M><?M<>M?<>M?<>M?<M><M?><" + bdNo);
	}
}
