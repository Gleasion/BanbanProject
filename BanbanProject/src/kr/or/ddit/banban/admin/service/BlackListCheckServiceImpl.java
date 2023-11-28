package kr.or.ddit.banban.admin.service;

import java.util.List;

import kr.or.ddit.banaban.admin.dao.BlackListCheckDaoImpl;
import kr.or.ddit.banaban.admin.dao.IBlackListCheckDao;
import kr.or.ddit.banban.vo.MemberVO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.CommentVO;

public class BlackListCheckServiceImpl implements IBlackListCheckService {

	private IBlackListCheckDao bcDao;

	public BlackListCheckServiceImpl() {
		bcDao = BlackListCheckDaoImpl.getInstance();
	}

	private static IBlackListCheckService bcService;

	public static IBlackListCheckService getInstance() {
		if (bcService == null)
			bcService = new BlackListCheckServiceImpl();
		return bcService;
	}
	

	@Override
	public int registerNotice(BoardVO bv) {
		return bcDao.insertNotice(bv);
	}

	@Override
	public boolean checkNotice(int bdNo) {
		return false;
	}

	@Override
	public List<BoardVO> getAllNotice() {
		return bcDao.getAllNotice();
	}

//	@Override
//	public int modifyNotie(BoardVO bv) {
//		return bcDao.updateNoitce(bv);
//	}

	@Override
	public int removeNotice(int bdNo) {
		return bcDao.deleteNotice(bdNo);
	}

	@Override
	public List<BoardVO> getNotice(BoardVO nv) {
		return bcDao.getNotice(nv);
	}

	@Override
	public BoardVO getNoticeOne(int bdNo) {
		return bcDao.getNoticeOne(bdNo);
	}


	@Override
	public BoardVO getWriterCate(BoardVO bv) {
		return bcDao.getWriterCate(bv);
		
	}

	@Override
	public List<CommentVO> getAllNoticeComment() {
		return bcDao.getAllNoticeComment();
	}


	@Override
	public int registerNoticeComment(CommentVO cv) {
		return bcDao.insertNoticeComment(cv);
	}


	@Override
	public List<CommentVO> getAllNoticeComment(int bdNo, int bdCateNo) {
		return bcDao.getAllNoticeComment(bdNo, bdCateNo);
	}


	@Override
	public BoardVO getNoticeOne(int bdNo, int bdCateNo) {
		return bcDao.getNoticeOne(bdNo, bdCateNo);
	}

	@Override
	public List<CommentVO> getAllNoticeComment(int bdNo) {
		return bcDao.getAllNoticeComment(bdNo);
	}

	@Override
	public List<CommentVO> getAllNoticeComment(int bdNo, String memId) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int removeNoticeComment(int bdComNo, String memId) {
		return bcDao.deleteNoticeComment(bdComNo, memId);
	}


	@Override
	public int removeNoticeComment(int bdComNo) {
		return bcDao.deleteNotice(bdComNo);
	}


	@Override
	public int removeNotice(int bdNo, int bdCateNo) {
		return bcDao.deleteNotice(bdNo, bdCateNo);
	}


	@Override
	public BoardVO getNoticeOne(int bdNo, String memId) {
		return bcDao.getNoticeOne(bdNo, memId);
	}


	@Override
	public List<BoardVO> selectMyBoard(String memId) {
		return bcDao.selectMyBoard(memId);
	}


	@Override
	public List<BoardVO> selecSearhBoard(String searchWord) {
		
		return bcDao.selecSearhBoard(searchWord);
	}


	@Override
	public List<MemberVO> getAllBlackMember() {
		
		return bcDao.getAllBlackMember();
	}


	@Override
	public int insertBlackList(String memId) {
		
		return bcDao.insertBlackList(memId);
	}


	@Override
	public List<MemberVO> showBlackMember() {
		
		return bcDao.showBlackMember();
	}

}
