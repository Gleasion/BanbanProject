package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.vo.AnswerVO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.CommentVO;
import kr.or.ddit.board.vo.ReportVO;

public interface IBoardService {

	public List<BoardVO> getAllBoard(int bdCateNo);
	
	public BoardVO getBoardOne(int bdNo);

	public List<CommentVO> getAllComment(int bdNo);
	
	public int registerBoard (BoardVO bv);
	
	public int removeBoard(int bdNo, String memId);
	
	public int modifyBoard(BoardVO bv);
	
	public int registerBoardComment(CommentVO cv);
	
	public int removeBoardComment(int bdComNo, String memId);
	
	public void modifybdComRepcnt(int bdComNo);
	
	public void modifyMemRepcnt(String memId);
	
	public void modifyBoardRepcnt(int bdNo);

	public void modifyBoardHits(int bdNo);
	
	public int registerAnswerComment(CommentVO cv);

	
	
	///////////////////////////////////////////////////

	public boolean checkNotice(int bdNo);
	
	public int removeNotice(int bdNo);

	public List<BoardVO> getNotice(BoardVO bv);
	
	public BoardVO getWriterCate(BoardVO bv);

	public List<CommentVO> getAllNoticeComment();

	public List<CommentVO> getAllNoticeComment(int bdNo, int bdCateNo);

	public BoardVO getNoticeOne(int bdNo, int bdCateNo);

	public List<CommentVO> getAllNoticeComment(int bdNo, String memId);

	public BoardVO getNoticeOne(int bdNo, String memId);
	
	public List<BoardVO> selectMyBoard(String memId);

	public int registerReportNotice(ReportVO rv);
	
	public int registerReportComment(ReportVO rv);

	public CommentVO getCommentOne(int bdComNo);

	public List<BoardVO> getAllReview();

	// 병원 답변 조회
	public List<CommentVO> getAllComment2(int bdNo);
	
	public BoardVO getBoardOneAdmin(int bdNo);

	public int registerAnswerBoard(AnswerVO av);

	public List<AnswerVO> getAllAnswerBoard(int bdNo);

	public int removeAnswerBoard(int bdAnswerNo, String hosCd);

	public int modifyAnswerBoard(AnswerVO av);

	public AnswerVO getAnswerBoardOne(int bdAnswerNo);


	
}
