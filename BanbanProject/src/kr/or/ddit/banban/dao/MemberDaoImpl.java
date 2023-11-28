package kr.or.ddit.banban.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MyBatisUtil;
import kr.or.ddit.banban.vo.MemberVO;

public class MemberDaoImpl extends MyBatisDao implements IMemberDao {

	private static IMemberDao memDao;

	private MemberDaoImpl() {
	}

	public static IMemberDao getInstance() {
		if (memDao == null) {
			memDao = new MemberDaoImpl();
		}
		return memDao;
	}

	@Override
	public int insertMember(MemberVO mv) {

		int cnt = insert("Member.insertMember", mv);

		return cnt;
	}

	@Override
	public int updateMember(MemberVO mv) {

		int cnt = 0;

		cnt = update("Member.updateMember", mv);

		return cnt;
	}

	@Override
	public int deleteMember(String memId) {

		int cnt = delete("Member.deleteMember", memId);

		return cnt;
	}

	@Override
	public int checkMember(String memId) {


		int cnt = selectOne("Member.checkCnt", memId);

		
		return cnt;
	}

	@Override
	public List<MemberVO> getAllMember() {

		List<MemberVO> memList = new ArrayList<MemberVO>();

		memList = selectList("Member.getAllMember");

		return memList;
	}

	@Override
	public List<MemberVO> searchMember(MemberVO mv) {

		List<MemberVO> memList = Collections.EMPTY_LIST;// Collections.EMPTY_LIST 비어 있는 리스트를 초기화 시켜준다.

		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("memId", mv.getMemId());
		paramMap.put("memNm", mv.getMemNm());
		paramMap.put("memAddr", mv.getMemAddr());
		paramMap.put("memTel", mv.getMemTel());

		memList = selectList("Member.searchMember2", paramMap);

		return memList;
	}

	@Override
	public MemberVO getMember(String memId) {

		MemberVO mv = selectOne("Member.getMember", memId);

		return mv;
	}

	@Override
	public String checkLogin(Map<String, Object> loginMap) {

		String memId = "";

		memId = selectOne("Member.checkLogin", loginMap);

		return memId;
	}

	@Override
	public MemberVO getMemInfo(String memId) {
		MemberVO memberVO = new MemberVO();
		memberVO.setMemId(memId);
		
		MemberVO mv = selectOne("Member.getMember",memberVO);
		
		return mv; 
	}
}