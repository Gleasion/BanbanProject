package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.board.vo.AtchFileVO;

public interface IAtchFileDao {
	
	public int insertAtchFile(AtchFileVO atchFileVO);
	
	public int insertAtchFileDetail(AtchFileVO atchFileVO);
	
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO);
	
	public AtchFileVO getAtchFileDetail(AtchFileVO atchFileVO);

	public int getAtchFile(AtchFileVO atchFileVO);
	
	
}
