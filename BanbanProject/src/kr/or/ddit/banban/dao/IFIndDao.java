package kr.or.ddit.banban.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.banban.vo.MemberVO;

public interface IFIndDao {
	
	public MemberVO getFindId(MemberVO mv);
	
	public MemberVO getFindPw(MemberVO mv);

}
