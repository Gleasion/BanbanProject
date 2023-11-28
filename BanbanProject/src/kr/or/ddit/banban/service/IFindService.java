package kr.or.ddit.banban.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.banban.vo.MemberVO;

public interface IFindService {

	public MemberVO getFindId(MemberVO mv);

	public MemberVO getFindPw(MemberVO mv);
	
	
}
