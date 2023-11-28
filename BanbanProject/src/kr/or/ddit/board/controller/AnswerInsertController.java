package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import kr.or.ddit.board.service.AtchFileServiceImpl;
import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IAtchFileService;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.AnswerVO;
import kr.or.ddit.board.vo.AtchFileVO;
import kr.or.ddit.board.vo.BoardVO;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 3, maxFileSize = 1024 * 1024 * 40)
@WebServlet("/board/answerInsert.do")
public class AnswerInsertController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/board/askDetail.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
	    req.setCharacterEncoding("UTF-8");
		
	    String hospCd = (String) req.getSession().getAttribute("loginCode");
	    int bdNo = Integer.parseInt(req.getParameter("bdNo"));
	    
	    System.out.println("bdNo : " + bdNo);
	    
		String bdCont = req.getParameter("bdCont");
		
		IBoardService bdService = BoardServiceImpl.getInstance();

		AnswerVO av = new AnswerVO(hospCd, bdCont);
		av.setBdNo(bdNo);
		
		int cnt = bdService.registerAnswerBoard(av);
		
		String msg = "";
		if(cnt > 0) {
			msg = "답변 등록에 성공하였습니다.";
		}else {
			msg = "답변 등록에 실패하였습니다.";
		}
		
		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/board/askList.do?bdNo=" + bdNo);
	}
	
	private String getFileName(Part part) {

		for(String content : part.getHeader("Content-Disposition").split(";")) {
			if(content.trim().startsWith("filenam")){
				return content
						.substring(content.indexOf("=") + 1)
						.trim()
						.replace("\"", "");
			}
		}
		return null;
	}
	
}
