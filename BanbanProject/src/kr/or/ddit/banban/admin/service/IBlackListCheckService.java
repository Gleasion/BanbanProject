package kr.or.ddit.banban.admin.service;

import java.util.List;

import kr.or.ddit.banban.vo.MemberVO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.CommentVO;

public interface IBlackListCheckService {
	
	public int registerNotice (BoardVO bv);

	public boolean checkNotice(int bdNo);

	public List<BoardVO> getAllNotice();

	public List<MemberVO> getAllBlackMember();

	public List<MemberVO> showBlackMember();
	
//	public int modifyNotie(BoardVO bv);
	
	public int removeNotice(int bdNo);

	public List<BoardVO> getNotice(BoardVO bv);
	
	public BoardVO getNoticeOne(int bdNo);
	
	public BoardVO getWriterCate(BoardVO bv);

	public List<CommentVO> getAllNoticeComment();
	
	public int removeNoticeComment(int bdComNo);

	public int registerNoticeComment(CommentVO cv);

	public List<CommentVO> getAllNoticeComment(int bdNo, int bdCateNo);

	public BoardVO getNoticeOne(int bdNo, int bdCateNo);

	public List<CommentVO> getAllNoticeComment(int bdNo, String memId);

	public int removeNoticeComment(int bdComNo, String memId);

	public List<CommentVO> getAllNoticeComment(int bdNo);

	public int removeNotice(int bdNo, int bdCateNo);

	public BoardVO getNoticeOne(int bdNo, String memId);
	
	public List<BoardVO> selectMyBoard(String memId);
	
	public List<BoardVO> selecSearhBoard(String searchWord);
	
	public int insertBlackList(String memId);

}
