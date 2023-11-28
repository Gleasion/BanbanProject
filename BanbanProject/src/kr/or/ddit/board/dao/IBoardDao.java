package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.banban.vo.MemberVO;
import kr.or.ddit.board.vo.AnswerVO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.CommentVO;
import kr.or.ddit.board.vo.ReportVO;

public interface IBoardDao {

	/**
	 * 모든 게시글 각 게시판 List.jsp로 가져오기
	 * 
	 * @return List<BoardVO>
	 */
	List<BoardVO> getAllBoard(int bdCateNo);

	public BoardVO getBoardOne(int bdNo);

	public List<CommentVO> getAllComment(int bdNo);

	public int insertBoard(BoardVO bv);

	public int deleteBoard(int bdNo, String memId);

	public int updateBoard(BoardVO bv);

	public int insertBoardComment(CommentVO cv);

	int deleteBoardComment(int bdComNo, String memId);

	public void insertbdComRepcnt(int bdComNo);

	public void insertMemRepcnt(String memId);

	public void insertbdRepcnt(int bdNo);

	public void updateBoardHits(int bdNo);

	public int insertAnswerComment(CommentVO cv);

	public boolean checkNotice(int bdNo);

	public int deleteNotice(int bdNo);

	public List<BoardVO> getNotice(BoardVO bv);

	public BoardVO getWriterCate(BoardVO bv);

	public List<CommentVO> getAllNoticeComment();

	public List<CommentVO> getAllNoticeComment(int bdNo, int bdCateNo);

	public BoardVO getNoticeOne(int bdNo, int bdCateNo);

	public List<BoardVO> getAllNotice(int bdCateNo);

	public BoardVO getNoticeOne(int bdNo, String memId);

	public List<BoardVO> selectMyBoard(String memId);

	public int insertReportNotice(ReportVO rv);

	public int insertReportComment(ReportVO rv);

	public CommentVO getCommentOne(int bdComNo);

	public List<BoardVO> getAllReview();

	/**
	 * 진료문의 답변 조회
	 */
	public List<CommentVO> getAllComment2(int bdNo);

	/*
	 * 관리자 신고된 게시글 상세조회
	 */

	public BoardVO getBoardOneAdmin(int bdNo);

	public int insertAnswerBoard(AnswerVO av);

	public List<AnswerVO> getAllAnswerBoard(int bdNo);

	/**
	 * 게시글 신고수 증가
	 */
	void updateCommentRepcnt(int bdAnswerNo);
	
	// 문의 답변 삭제
	int deleteAnswerBoard(int bdAnswerNo, String hosCd);

	/**
	 * 병원답변 수정(업데이트)
	 */
	int updateAnswerBoard(AnswerVO av);

	public AnswerVO getAnswerBoardOne(int bdAnswerNo);

}
