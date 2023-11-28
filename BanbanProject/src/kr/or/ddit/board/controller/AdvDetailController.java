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
import kr.or.ddit.board.vo.AtchFileVO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.CommentVO;

@WebServlet( "/board/advDetail.do")
public class AdvDetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bdNo = Integer.parseInt(req.getParameter("bdNo"));
		int bdHits = 0;
		
		IBoardService bdService = BoardServiceImpl.getInstance();
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();

		BoardVO bv = bdService.getBoardOne(bdNo);
		req.setAttribute("bv", bv);

		List<CommentVO> cmList = bdService.getAllComment(bdNo);
		req.setAttribute("cmList", cmList);
		
		if(bv.getBafId() != -1) {
	    	  AtchFileVO atchFileVO = new AtchFileVO();
	    	  atchFileVO.setBafId(bv.getBafId());
	      
	    	  List<AtchFileVO> atchFileList = fileService.getAtchFileList(atchFileVO);
	      
	    	  req.setAttribute("atchFileList", atchFileList);
	      }
		
		bdService.modifyBoardHits(bdNo);
		req.setAttribute("bdHits", bdHits);
		
		req.getRequestDispatcher("/views/board/advDetail.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
