package kr.or.ddit.board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.AtchFileServiceImpl;
import kr.or.ddit.board.service.IAtchFileService;
import kr.or.ddit.board.vo.AtchFileVO;

@WebServlet("/board/download.do")
public class DownloadController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String bafId = req.getParameter("bafId");
		String bafdNo = req.getParameter("bafdNo");
		
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		AtchFileVO atchFileVO = new AtchFileVO();
		atchFileVO.setBafId(Long.parseLong(bafId));
		atchFileVO.setBafdNo(Integer.parseInt(bafdNo));
		
		atchFileVO = fileService.getAtchFileDetail(atchFileVO);
		
		String bafdCours = atchFileVO.getBafdCours();
		String bafdOrinm = atchFileVO.getBafdOrinm();
		String endcodedFileName = URLEncoder.encode(bafdOrinm, "UTF-8");

		resp.setContentType("application/octet-stream");
		resp.setHeader("Content-Disposition", "attachment; filename =\"" + endcodedFileName + "\""); 
	
		BufferedInputStream bis = new BufferedInputStream(
									new FileInputStream(bafdCours));
		BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());
		
		int data = 0;
		
		while((data = bis.read()) != -1) {
			bos.write(data);
		}
		
		bis.close();
		bos.close();
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}
	
}
