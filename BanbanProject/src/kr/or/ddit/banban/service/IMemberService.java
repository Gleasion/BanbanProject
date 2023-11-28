package kr.or.ddit.banban.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.banban.vo.MemberVO;

public interface IMemberService {

	/**
	 * 회원정보를 등록 하기 위한 메서드
	 * 
	 * @param mv 등록할 회원정보를 담고있는 MemberVO객체
	 * @return 등록작업이 성공하면 1, 실패하면 0 리턴함.
	 */
	public int registerMember(MemberVO mv); // 필드를 더 추가할 필요 없이 VO클래스에 멤버변수를 더 추가하면 된다.

	/**
	 * 주어진 회원 ID를 이용하여 회원정보가 존재하는 지 여부를 체크하기 위한 메서드
	 * 
	 * @param memId 회원정보존재 여부 체크용 회원ID
	 * @return 해당 회원정보가 존재하면 true, 존재하지 않으면 false 리턴함.
	 */
	public int checkMember(String memId);

	/**
	 * 주어진 회원 ID를 이용하여 회원정보를 가져오기 위한 메서드
	 * 
	 * @param memId 회원정보를 가져올 회원ID
	 * @return 가져온 회원정보를 담은 MemberVO객체 리턴함.
	 */
	public MemberVO getMember(String memId);

	/**
	 * 모든 회원정보를 가져와 List에 담아서 반환하는 메서드
	 * 
	 * @return 모든 회원정보를 담은 List객체
	 */
	public List<MemberVO> getAllMember();

	/**
	 * MemberVO에 담긴 데이터를 DB에 업데이트 하기 위한 메서드
	 * 
	 * @param mv 업데이트 할 업데이트할 데이터를 담고있는 MemberVO객체
	 * @return 수정작업이 성공하면 1, 실패하면 0 리턴함.
	 */
	public int modifyMember(MemberVO mv);

	/**
	 * 주어진 회원ID에 해당하는 회원정보를 삭제하기 위한 메서드
	 * 
	 * @param memId 삭제할 회원 ID
	 * @return 삭제작업이 성공하면 1, 실패하면 0 리턴함.
	 */
	public int removeMember(String memId);

	/**
	 * 회원정보를 검색하기 위한 메서드
	 * 
	 * @param mv 검색할 회원정보를 담은 MemberVO객체
	 * @return 검색된 회원정보를 담은 리스트 객체
	 */
	public List<MemberVO> searchMember(MemberVO mv);

	
	public String checkLogin(Map<String, Object> loginMap);
	
	
}
