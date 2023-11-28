package kr.or.ddit.board.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.banban.vo.MemberVO;
import kr.or.ddit.board.vo.AnswerVO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.CommentVO;
import kr.or.ddit.board.vo.ReportVO;
import kr.or.ddit.util.MyBatisUtil;


public class BoardDaoImpl implements IBoardDao {

	private static IBoardDao bdDao;

	public static IBoardDao getInstance() {
		if (bdDao == null)
			bdDao = new BoardDaoImpl();
		return bdDao;
	}

	/**
	 * 모든 게시글 각 게시판 List.jsp로 가져오기
	 * @return List<BoardVO>
	 */
	@Override
	public List<BoardVO> getAllBoard(int bdCateNo) {
		
		List<BoardVO> bdList = new ArrayList<BoardVO>();

		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("bdCateNo", bdCateNo);
			
			bdList = session.selectList("board.getAllBoard", paramMap);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return bdList;

	}
	
	/**
	 * 게시글 및 카테고리 번호로 게시글 한개 조회
	 */
	@Override
	public BoardVO getBoardOne(int bdNo) {
		
		SqlSession session = MyBatisUtil.getInstance(true);
		
		BoardVO bv = null;
		
		try {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("bdNo", bdNo);
			
			bv = session.selectOne("board.getBoardOne", map);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return bv;
		
	}
	
	/**
	 * 게시글 번호로 게시글 댓글 조회
	 */
	@Override
	public List<CommentVO> getAllComment(int bdNo) {
		
		List<CommentVO> cmList = new ArrayList<CommentVO>();

		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("bdNo", bdNo);
			
			cmList = session.selectList("board.getAllComment", map);
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return cmList;
	}
	
	/**
	 * 진료문의 답변 조회
	 */
	@Override
	public List<CommentVO> getAllComment2(int bdNo) {
		
		List<CommentVO> cmList = new ArrayList<CommentVO>();

		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("bdNo", bdNo);
			
			cmList = session.selectList("board.getAllComment2", map);
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return cmList;
	}
	
	/**
	 * 게시글 등록
	 */
	@Override
	public int insertBoard(BoardVO bv) {
		
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {

			cnt = session.insert("board.insertBoard", bv);
			session.commit();

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return cnt;
	}
	
	/**
	 * 게시글 번호 및 멤버 아이디로 게시글 삭제
	 */
	@Override
	public int deleteBoard(int bdNo, String memId) {
		
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("bdNo", bdNo);
			map.put("memId", memId);
			
			cnt = session.delete("board.deleteBoard", map);
			session.commit();

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	/**
	 * 게시글 수정(업데이트)
	 */
	@Override
	public int updateBoard(BoardVO bv) {
	
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);
		try {

			cnt = session.update("board.updateBoardreview", bv);
			session.commit();

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
		
	}
	
	/**
	 * 병원답변 수정(업데이트)
	 */
	@Override
	public int updateAnswerBoard(AnswerVO av) {
	
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);
		try {

			cnt = session.update("board.updateAnswerBoard", av);
			session.commit();

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
		
	}
	
	/**
	 * 게시판 댓글 삭제
	 */
	@Override
	public int deleteBoardComment(int bdComNo, String memId) {
		
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("bdComNo", bdComNo);
			map.put("memId", memId);
			
			cnt = session.delete("board.deleteBoardComment", map);
			session.commit();

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public boolean checkNotice(int bdNo) {

		boolean isExist = false;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {

			int cnt = session.selectOne("board.checkNotice", bdNo);

			if (cnt > 0) {
				isExist = true;
			}

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return isExist;
		
	}
	
	@Override
	public List<BoardVO> getAllNotice(int bdCateNo) {

		List<BoardVO> ncList = new ArrayList<BoardVO>();

		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("bdCateNo", bdCateNo);
			
			ncList = session.selectList("board.getAllNotice");

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return ncList;

	}



	@Override
	public int deleteNotice(int bdNo) {
		
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			
			cnt = session.delete("board.deleteNotice", bdNo);
			session.commit();

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
		
	}
	
	@Override
	public List<BoardVO> getNotice(BoardVO bv) {

		List<BoardVO> bvList = Collections.emptyList();
		
		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("bdNo", bv.getBdNo());
			paramMap.put("memId", bv.getMemId());
			paramMap.put("bdTitle", bv.getBdTitle());
			paramMap.put("bdCont", bv.getBdCont());
			
			bvList = session.selectList("board.getNotice", paramMap);

			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return bvList;
	
	}


	@Override
	public BoardVO getWriterCate(BoardVO bv) {
		
		SqlSession session = MyBatisUtil.getInstance(true);
		
		BoardVO wc = null;
		
		try {
			
			wc = session.selectOne("board.getWriterCate", wc);
			
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return wc;
	}

	@Override
	public List<CommentVO> getAllNoticeComment() {

		List<CommentVO> cmList = new ArrayList<CommentVO>();

		SqlSession session = MyBatisUtil.getInstance(true);

		try {

			cmList = session.selectList("board.getAllNoticeComment");

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return cmList;
	}

// 모든 게시판 댓글 입력
	@Override
	public int insertBoardComment(CommentVO cv) {
		
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {

			cnt = session.insert("board.insertBoardComment", cv);
			session.commit();

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return cnt;
	}
	
//	병원 답변 입력(댓글)
	@Override
	public int insertAnswerComment(CommentVO cv) {
		
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {

			cnt = session.insert("board.insertAnswerComment", cv);
			session.commit();

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return cnt;
	}

	@Override
	public List<CommentVO> getAllNoticeComment(int bdNo, int bdCateNo) {
		
		List<CommentVO> cmList = new ArrayList<CommentVO>();

		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("bdNo", bdNo);
			map.put("bdCateNo", bdCateNo);
			
			cmList = session.selectList("board.getAllNoticeComment", map);
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return cmList;
	}

	@Override
	public BoardVO getNoticeOne(int bdNo, int bdCateNo) {
		
		SqlSession session = MyBatisUtil.getInstance(true);

		BoardVO bv = null;
		
		try {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("bdNo", bdNo);
			map.put("bdCateNo", bdCateNo);
			
			bv = session.selectOne("board.getNoticeOne", map);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return bv;
	}




	
	@Override
	public BoardVO getNoticeOne(int bdNo, String memId) {
		
		SqlSession session = MyBatisUtil.getInstance(true);

		BoardVO bv = null;
		
		try {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("bdNo", bdNo);
			map.put("bdCateNo", memId);
			
			bv = session.selectOne("board.getNoticeOne", map);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return bv;
	}

	@Override
	public List<BoardVO> selectMyBoard(String memId) {
		List<BoardVO> myList = new ArrayList<BoardVO>();

		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			
			myList = session.selectList("Member.selectMyBoard", memId);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return myList;
	}

	@Override
	public CommentVO getCommentOne(int bdComNo) {
		
		SqlSession session = MyBatisUtil.getInstance(true);

		CommentVO cv = null;
		
		try {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("bdComNo", bdComNo);
			
			cv = session.selectOne("board.getCommentOne", map);
			session.commit();

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return cv;
	}

	@Override
	public int insertReportNotice(ReportVO rv) {
		
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {

			cnt = session.insert("board.insertReportNotice", rv);
			session.commit();

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return cnt;
	}

	@Override
	public int insertReportComment(ReportVO rv) {
		
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {

			cnt = session.insert("board.insertReportComment", rv);
			session.commit();

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return cnt;
	}

	@Override
	public void insertbdComRepcnt(int bdComNo) {
		
		SqlSession session = MyBatisUtil.getInstance(true);

		CommentVO cv = null;
		
		try {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("bdComNo", bdComNo);
			
			cv = session.selectOne("board.updateCommentRepcnt", map);
			session.commit();
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		
	}

	/**
	 * 게시글 신고수 증가
	 */
	@Override
	public void insertbdRepcnt(int bdNo) {

		SqlSession session = MyBatisUtil.getInstance(true);

		BoardVO bv = null;
		
		try {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("bdNo", bdNo);
			
			bv = session.selectOne("board.updateBoardRepcnt", map);
			session.commit();
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		
	}
	
	/**
	 * 게시글 신고수 증가
	 */
	@Override
	public void updateCommentRepcnt(int bdAnswerNo) {

		SqlSession session = MyBatisUtil.getInstance(true);

		AnswerVO av = null;
		
		try {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("bdAnswerNo", bdAnswerNo);
			
			av = session.selectOne("board.updateCommentRepcnt", map);
			session.commit();
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		
	}
	
	
	/**
	 * 게시글 조회수 증가
	 */
	@Override
	public void updateBoardHits(int bdNo) {
		
		SqlSession session = MyBatisUtil.getInstance(true);
		
		BoardVO bv = null;
		
		try {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("bdNo", bdNo);
			
			bv = session.selectOne("board.updateBoardHits", map);
			session.commit();
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		
	}

	
	
	
	@Override
	public void insertMemRepcnt(String memId) {

		SqlSession session = MyBatisUtil.getInstance(true);

		MemberVO mv = null;
		
		try {
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("memId", memId);
			
			mv = session.selectOne("board.updateMemRepcnt", map);
			
			session.commit();

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		
	}

	@Override
	public List<BoardVO> getAllReview() {

		List<BoardVO> rvList = new ArrayList<BoardVO>();

		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			
			rvList = session.selectList("board.getAllReview");

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return rvList;
	}

	@Override
	public BoardVO getBoardOneAdmin(int bdNo) {
		
	SqlSession session = MyBatisUtil.getInstance(true);
		
		BoardVO bv = null;
		
		try {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("bdNo", bdNo);
			
			bv = session.selectOne("admin.getBoardOneAdmin", map);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return bv;
		
	}

	@Override
	public int insertAnswerBoard(AnswerVO av) {
		
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {

			cnt = session.insert("board.insertAnswerBoard", av);
			session.commit();

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return cnt;
	}

	@Override
	public List<AnswerVO> getAllAnswerBoard(int bdNo) {
		
		List<AnswerVO> answerList = new ArrayList<AnswerVO>();

		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("bdNo", bdNo);
			
			answerList = session.selectList("board.getAllAnswerBoard", map);
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return answerList;
	}

	@Override
	public int deleteAnswerBoard(int bdAnswerNo, String hosCd) {
		
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("bdAnswerNo", bdAnswerNo);
			map.put("hosCd", hosCd);
			
			cnt = session.delete("board.deleteAnswerBoard", map);
			session.commit();

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public AnswerVO getAnswerBoardOne(int bdAnswerNo) {
		
		SqlSession session = MyBatisUtil.getInstance(true);

		AnswerVO av = null;
		
		try {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("bdAnswerNo", bdAnswerNo);
			
			av = session.selectOne("board.getAnswerBoardOne", map);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return av;
	}





}
