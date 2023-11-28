package kr.or.ddit.banban.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.banban.vo.MemberVO;

public interface IMemberDao {

	public int insertMember(MemberVO mv);

	public int updateMember(MemberVO mv);

	public int deleteMember(String memId);

	public int checkMember(String memId);

	public List<MemberVO> getAllMember();

	public List<MemberVO> searchMember(MemberVO mv);

	public MemberVO getMember(String memId);

	public String checkLogin(Map<String, Object> loginMap);

	public MemberVO getMemInfo(String memId);

}