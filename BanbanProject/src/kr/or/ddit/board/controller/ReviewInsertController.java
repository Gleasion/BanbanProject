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
import kr.or.ddit.board.vo.AtchFileVO;
import kr.or.ddit.board.vo.BoardVO;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 3, maxFileSize = 1024 * 1024 * 40)
@WebServlet("/board/reviewInsert.do")
public class ReviewInsertController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/board/reviewInsertForm.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
	    req.setCharacterEncoding("UTF-8");
		
		int bdCateNo = Integer.parseInt(req.getParameter("bdCateNo"));
		String bdTitle = req.getParameter("bdTitle");
		String bdCont = req.getParameter("bdCont");
		String bdRating = req.getParameter("bdRating");
		
		
		String memId = (String) req.getSession().getAttribute("loginCode");
	    
	    IAtchFileService fileService = AtchFileServiceImpl.getInstance();
	    AtchFileVO atchFileVO = fileService.saveAtchFileList(req);

	    IBoardService bdService = BoardServiceImpl.getInstance();
	    BoardVO bv = new BoardVO(bdCateNo, bdTitle, bdCont, memId, bdRating);

	    if (atchFileVO != null) {
	    	bv.setBafId(atchFileVO.getBafId());
	    }
		
		int cnt = bdService.registerBoard(bv);
		
		String msg = "";
		if(cnt > 0) {
			msg = "리뷰 등록에 성공하였습니다.";
		}else {
			msg = "리뷰 등록에 실패하였습니다.";
		}
		
		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);
		
		
		resp.sendRedirect(req.getContextPath() + "/board/reviewList.do");
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