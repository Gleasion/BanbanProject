package kr.or.ddit.banaban.admin.dao;

import java.util.List;

import kr.or.ddit.banban.vo.MemberVO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.CommentVO;

public interface IBlackListCheckDao {

	public int insertNotice (BoardVO bv);

	public boolean checkNotice(int bdNo);
	
	public List<BoardVO> getAllNotice();

	public List<MemberVO> getAllBlackMember();
	
	public List<MemberVO> showBlackMember();
	
//	public int updateNoitce(BoardVO bv);

	public int deleteNotice(int bdNo);

	public List<BoardVO> getNotice(BoardVO bv);

	public BoardVO getNoticeOne(int bdNo);
	
	public BoardVO getWriterCate(BoardVO bv);

	public List<CommentVO> getAllNoticeComment();

	public int deleteNoticeComment(int bdComNo, String memId);

	public int insertNoticeComment(CommentVO cv);

	public List<CommentVO> getAllNoticeComment(int bdNo, int bdCateNo);

	public BoardVO getNoticeOne(int bdNo, int bdCateNo);

	public List<BoardVO> getAllNotice(int bdCateNo);

	public List<CommentVO> getAllNoticeComment(int bdNo);

	public int deleteNotice(int bdNo, int bdCateNo);

	public BoardVO getNoticeOne(int bdNo, String memId);

	public List<BoardVO> selectMyBoard(String memId);
	
	public List<BoardVO> selecSearhBoard(String searchWord);
	
	public int insertBlackList(String memId);
}
