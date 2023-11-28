package kr.or.ddit.banban.dao;

import kr.or.ddit.banban.vo.MemberVO;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.banban.dao.MyBatisDao;

public class FIndDaoImpl extends MyBatisDao implements IFIndDao {

	private FIndDaoImpl() {};

	private static IFIndDao dao = null;

	public static IFIndDao getInstance() {
		if (dao == null) {
			dao = new FIndDaoImpl();
		}
		return dao;
	}

	@Override
	public MemberVO getFindId(MemberVO mv) {

		MemberVO mv2 = selectOne("find.findId", mv);
		
		return mv2;
		
	}

	@Override
	public MemberVO getFindPw(MemberVO mv) {
		
		MemberVO mv2 = selectOne("find.findPw", mv);
		
		return mv2;
	}

}
