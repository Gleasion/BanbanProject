package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.board.service.AtchFileServiceImpl;
import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IAtchFileService;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.AnswerVO;
import kr.or.ddit.board.vo.AtchFileVO;
import kr.or.ddit.board.vo.BoardVO;

@WebServlet("/board/answerUpdate.do")
public class AskUpdateController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bdAnswerNo = Integer.parseInt(req.getParameter("bdAnswerNo"));
		int bdNo = Integer.parseInt(req.getParameter("bdNo"));
		
		IBoardService bdService = BoardServiceImpl.getInstance();

		AnswerVO av = bdService.getAnswerBoardOne(bdAnswerNo);
		av.setBdNo(bdNo);
		
		req.setAttribute("av", av);

		req.getRequestDispatcher("/views/board/answerUpdateForm.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
	    req.setCharacterEncoding("UTF-8");
		
		int bdNo = Integer.parseInt(req.getParameter("bdNo"));
		int bdAnswerNo = Integer.parseInt(req.getParameter("bdAnswerNo"));
		String bdCont = req.getParameter("bdCont");
		String hospCd = (String) req.getSession().getAttribute("loginCode");

		IBoardService bdService = BoardServiceImpl.getInstance();
		
		AnswerVO av = new AnswerVO(hospCd, bdCont);
		av.setBdAnswerNo(bdAnswerNo);
		av.setBdNo(bdNo);
		
		int cnt = bdService.modifyAnswerBoard(av);
		
		String msg = "";
		if(cnt > 0) {
			msg = "답변 수정에 성공하였습니다.";
		}else {
			msg = "답변 수정에 실패하였습니다.";
		}
		
		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/board/askDetail.do?bdNo=" + bdNo);
	}
	
}
