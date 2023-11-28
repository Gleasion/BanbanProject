package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.banban.dao.MyBatisDao;
import kr.or.ddit.board.vo.AtchFileVO;

public class AtchFileDaoImpl extends MyBatisDao implements IAtchFileDao{

	private static IAtchFileDao fileDao;
	
	private AtchFileDaoImpl() {

	}
	
	public static IAtchFileDao getInstance() {
		
		if(fileDao == null) {
			fileDao = new AtchFileDaoImpl();
		}
		
		return fileDao;
	}
	
	@Override
	public int insertAtchFile(AtchFileVO atchFileVO) {
		
		int cnt = 0;
		
		cnt = insert("atchFile.insertAtchFile", atchFileVO);
		
		return cnt;
	}

	@Override
	public int insertAtchFileDetail(AtchFileVO atchFileVO) {
		
		int cnt = 0;
		
		cnt = insert("atchFile.insertAtchFileDetail", atchFileVO);
		
		return cnt;
	}

	@Override
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO) {
		
		List<AtchFileVO> atchFileList = selectList("atchFile.getAtchFileList", atchFileVO);
		
		return atchFileList;
	}

	@Override
	public AtchFileVO getAtchFileDetail(AtchFileVO atchFileVO) {
		
		AtchFileVO fileVO = selectOne("atchFile.getAtchFileDetail", atchFileVO);
		
		return fileVO;
	}

	@Override
	public int getAtchFile(AtchFileVO atchFileVO) {
		
		int cnt = 0;
		
		cnt = insert("atchFile.insertAtchFile", atchFileVO);
		
		return cnt;
	}

}
