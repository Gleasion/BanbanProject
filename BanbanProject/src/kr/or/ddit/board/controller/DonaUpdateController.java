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

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 3, maxFileSize = 1024 * 1024 * 40)
@WebServlet("/board/donaUpdate.do")
public class DonaUpdateController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bdNo = Integer.parseInt(req.getParameter("bdNo"));
		
		IBoardService bdService = BoardServiceImpl.getInstance();
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();

		BoardVO bv = bdService.getBoardOne(bdNo);

		if(bv.getBafId() != -1) {
	    	  
	    	  AtchFileVO atchFileVO = new AtchFileVO();
	    	  atchFileVO.setBafId(bv.getBafId());
	      
	    	  List<AtchFileVO> atchFileList = fileService.getAtchFileList(atchFileVO);
	      
	    	  req.setAttribute("atchFileList", atchFileList);
	      }
		
		req.setAttribute("bv", bv);

		req.getRequestDispatcher("/views/board/donaUpdateForm.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
	    req.setCharacterEncoding("UTF-8");
		
		int bdNo = Integer.parseInt(req.getParameter("bdNo"));
		String bdTitle = req.getParameter("bdTitle");
		String bdCont = req.getParameter("bdCont");
		String memId = (String) req.getSession().getAttribute("loginCode");
		
		int bafId = Integer.parseInt(req.getParameter("bafId"));
			
		IBoardService bdService = BoardServiceImpl.getInstance();
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		AtchFileVO atchFileVO = null;
		atchFileVO = fileService.saveAtchFileList(req);
		
		BoardVO bv = new BoardVO(bdTitle, bdCont);
		bv.setBdNo(bdNo);
		bv.setMemId(memId);
		
		if(atchFileVO == null) {
			bv.setBafId(bafId);
		}else {
			bv.setBafId(atchFileVO.getBafId());
		}
		
		int cnt = bdService.modifyBoard(bv);
		
		String msg = "";
		if(cnt > 0) {
			msg = "게시글 수정에 성공하였습니다.";
		}else {
			msg = "게시글 수정에 실패하였습니다.";
		}
		
		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/board/donaDetail.do?bdNo=" + bdNo);
	}
	
}
