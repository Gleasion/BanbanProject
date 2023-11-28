package kr.or.ddit.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.board.vo.AtchFileVO;

public interface IAtchFileService {
	
	public AtchFileVO saveAtchFileList(HttpServletRequest req);
	
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO);
	
	public AtchFileVO getAtchFileDetail(AtchFileVO atchFileVO);

	public int insertAtchFile(AtchFileVO atchFileVO);

}
