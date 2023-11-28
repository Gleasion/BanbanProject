package kr.or.ddit.banaban.admin.dao;

import java.util.ArrayList;
import java.util.Collections;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.banban.dao.MyBatisDao;
import kr.or.ddit.banban.vo.MemberVO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.CommentVO;
import kr.or.ddit.util.MyBatisUtil;

public class BlackListCheckDaoImpl implements IBlackListCheckDao {

	private static IBlackListCheckDao bcDao;

	public static IBlackListCheckDao getInstance() {

		if (bcDao == null)
			bcDao = new BlackListCheckDaoImpl();
		return bcDao;
	}

	@Override
	public int insertNotice(BoardVO bv) {

		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {

			cnt = session.insert("admin.insertNotice", bv);

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

			int cnt = session.selectOne("admin.checkNotice", bdNo);

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

			ncList = session.selectList("admin.getAllNotice");

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return ncList;

	}

//	@Override
//	public int updateNoitce(BoardVO bv) {
//	
//		int cnt = 0;
//
//		SqlSession session = MyBatisUtil.getInstance(true);
//		try {
//
//			cnt = session.update("board.updateNoitce", bv);
//
//		} catch (PersistenceException ex) {
//			ex.printStackTrace();
//		} finally {
//			session.close();
//		}
//		return cnt;
//		
//	}

	@Override
	public int deleteNotice(int bdNo) {

		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			cnt = session.delete("admin.deleteNotice", bdNo);

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

			bvList = session.selectList("admin.getNotice", paramMap);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return bvList;

	}

	@Override
	public BoardVO getNoticeOne(int bdNo) {

		SqlSession session = MyBatisUtil.getInstance(true);

		BoardVO bv = null;

		try {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bdNo", bdNo);

			bv = session.selectOne("admin.getNoticeOne", map);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return bv;

	}

	@Override
	public BoardVO getWriterCate(BoardVO bv) {

		SqlSession session = MyBatisUtil.getInstance(true);

		BoardVO wc = null;

		try {

			wc = session.selectOne("admin.getWriterCate", wc);

		} catch (PersistenceException ex) {
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

			cmList = session.selectList("admin.getAllNoticeComment");

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return cmList;
	}

	@Override
	public int deleteNoticeComment(int bdComNo, String memId) {

		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bdComNo", bdComNo);
			map.put("memId", memId);

			cnt = session.delete("admin.deleteNoticeComment", map);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int insertNoticeComment(CommentVO cv) {

		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {

			cnt = session.insert("admin.insertNoticeComment", cv);

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

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bdNo", bdNo);
			map.put("bdCateNo", bdCateNo);

			cmList = session.selectList("admin.getAllNoticeComment", map);
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

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bdNo", bdNo);
			map.put("bdCateNo", bdCateNo);

			bv = session.selectOne("admin.getNoticeOne", map);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return bv;
	}

	@Override
	public List<BoardVO> getAllNotice() {

		List<BoardVO> ncList = new ArrayList<BoardVO>();

		SqlSession session = MyBatisUtil.getInstance(true);

		try {

			ncList = session.selectList("admin.getAllNotice");

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return ncList;

	}

	@Override
	public List<CommentVO> getAllNoticeComment(int bdNo) {

		List<CommentVO> cmList = new ArrayList<CommentVO>();

		SqlSession session = MyBatisUtil.getInstance(true);

		try {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bdNo", bdNo);

			cmList = session.selectList("admin.getAllNoticeComment", map);
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return cmList;
	}

	@Override
	public int deleteNotice(int bdNo, int bdCateNo) {

		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bdNo", bdNo);
			map.put("bdCateNo", bdCateNo);

			cnt = session.delete("admin.deleteNotice", map);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public BoardVO getNoticeOne(int bdNo, String memId) {

		SqlSession session = MyBatisUtil.getInstance(true);

		BoardVO bv = null;

		try {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bdNo", bdNo);
			map.put("bdCateNo", memId);

			bv = session.selectOne("admin.getNoticeOne", map);

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
	public List<BoardVO> selecSearhBoard(String searchWord) {

		List<BoardVO> searchList = new ArrayList<BoardVO>();

		SqlSession session = MyBatisUtil.getInstance(true);

		searchList = session.selectList("admin.searchBoard", searchWord);

		return searchList;

	}

	@Override
	public List<MemberVO> getAllBlackMember() {

		List<MemberVO> mbList = new ArrayList<MemberVO>();

		SqlSession session = MyBatisUtil.getInstance(true);

		try {

			mbList = session.selectList("admin.getAllBlackMember");

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return mbList;
	}

	@Override
	public int insertBlackList(String memId) {

		SqlSession session = MyBatisUtil.getInstance();

		int cnt = 0;
		try {

			cnt = session.insert("admin.insertBlackList", memId);
			session.commit();

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return cnt;
	}

	@Override
	public List<MemberVO> showBlackMember() {

		List<MemberVO> mbList = new ArrayList<>();

		SqlSession session = MyBatisUtil.getInstance();

		try {

			mbList = session.selectList("admin.showBlackList");
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return mbList;
	}
}
