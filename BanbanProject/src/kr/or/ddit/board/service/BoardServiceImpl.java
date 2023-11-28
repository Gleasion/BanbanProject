package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.AnswerVO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.CommentVO;
import kr.or.ddit.board.vo.ReportVO;

public class BoardServiceImpl implements IBoardService {

	private IBoardDao bdDao;
	
	public BoardServiceImpl() {
		bdDao = BoardDaoImpl.getInstance();
	}
	
	private static IBoardService bdService;
	
	public static IBoardService getInstance() {
		if(bdService == null)
			bdService = new BoardServiceImpl();
		return bdService;	
	}
	
	@Override
	public List<BoardVO> getAllBoard(int bdCateNo) {
		return bdDao.getAllBoard(bdCateNo);
	}

	@Override
	public BoardVO getBoardOne(int bdNo) {
		return bdDao.getBoardOne(bdNo);
	}
	
	@Override
	public List<CommentVO> getAllComment(int bdNo) {
		return bdDao.getAllComment(bdNo);
	}
	
	@Override
	public List<CommentVO> getAllComment2(int bdNo) {
		return bdDao.getAllComment2(bdNo);
	}
	
	@Override
	public int registerBoard(BoardVO bv) {
		return bdDao.insertBoard(bv);
	}
	
	@Override
	public int removeBoard(int bdNo, String memId) {
		return bdDao.deleteBoard(bdNo, memId);
	}
	
	@Override
	public int modifyBoard(BoardVO bv) {
		return bdDao.updateBoard(bv);
	}
	
	@Override
	public int modifyAnswerBoard(AnswerVO av) {
		return bdDao.updateAnswerBoard(av);
	}

	@Override
	public int registerBoardComment(CommentVO cv) {
		return bdDao.insertBoardComment(cv);
	}

	@Override
	public int removeBoardComment(int bdComNo, String memId) {
		return bdDao.deleteBoardComment(bdComNo, memId);
	}
	
	@Override
	public void modifybdComRepcnt(int bdComNo) {
		bdDao.insertbdComRepcnt(bdComNo);
	}
	
	@Override
	public void modifyMemRepcnt(String memId) {
		bdDao.insertMemRepcnt(memId);
	}
	
	@Override
	public void modifyBoardRepcnt(int bdNo) {
		bdDao.insertbdRepcnt(bdNo);
	}
	
	@Override
	public void modifyBoardHits(int bdNo) {
		bdDao.updateBoardHits(bdNo);
	}
	
	//병원 답변(댓글) 등록
	@Override
	public int registerAnswerComment(CommentVO cv) {
		return bdDao.insertAnswerComment(cv);
	}

	
	
	
	//////////////////////////////////////////////////////////////////////////
	
	@Override
	public boolean checkNotice(int bdNo) {
		return false;
	}

	@Override
	public int removeNotice(int bdNo) {
		return bdDao.deleteNotice(bdNo);
	}

	@Override
	public List<BoardVO> getNotice(BoardVO nv) {
		return bdDao.getNotice(nv);
	}

	@Override
	public BoardVO getWriterCate(BoardVO bv) {
		return bdDao.getWriterCate(bv);
	}

	@Override
	public List<CommentVO> getAllNoticeComment() {
		return bdDao.getAllNoticeComment();
	}

	@Override
	public List<CommentVO> getAllNoticeComment(int bdNo, int bdCateNo) {
		return bdDao.getAllNoticeComment(bdNo, bdCateNo);
	}

	@Override
	public BoardVO getNoticeOne(int bdNo, int bdCateNo) {
		return bdDao.getNoticeOne(bdNo, bdCateNo);
	}

	@Override
	public List<CommentVO> getAllNoticeComment(int bdNo, String memId) {
		return null;
	}

	@Override
	public BoardVO getNoticeOne(int bdNo, String memId) {
		return bdDao.getNoticeOne(bdNo, memId);
	}

	@Override
	public List<BoardVO> selectMyBoard(String memId) {
		return bdDao.selectMyBoard(memId);
	}

	@Override
	public int registerReportNotice(ReportVO rv) {
		return bdDao.insertReportNotice(rv);
	}

	@Override
	public CommentVO getCommentOne(int bdComNo) {
		return bdDao.getCommentOne(bdComNo);
	}


	@Override
	public int registerReportComment(ReportVO rv) {
		return bdDao.insertReportComment(rv);
	}

	@Override
	public List<BoardVO> getAllReview() {
		return bdDao.getAllReview();
	}

	@Override
	public BoardVO getBoardOneAdmin(int bdNo) {
		return bdDao.getBoardOneAdmin(bdNo);
	}

	@Override
	public int registerAnswerBoard(AnswerVO av) {
		return bdDao.insertAnswerBoard(av);
	}

	@Override
	public List<AnswerVO> getAllAnswerBoard(int bdNo) {
		return bdDao.getAllAnswerBoard(bdNo);
	}

	@Override
	public int removeAnswerBoard(int bdAnswerNo, String hosCd) {
		return bdDao.deleteAnswerBoard(bdAnswerNo, hosCd);
	}

	@Override
	public AnswerVO getAnswerBoardOne(int bdAnswerNo) {
		return bdDao.getAnswerBoardOne(bdAnswerNo);
	}



}
