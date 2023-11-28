

package kr.or.ddit.banban.service;

import java.util.Map;

import kr.or.ddit.banban.vo.DonationListVO;
import kr.or.ddit.banban.vo.MemberVO;

public interface IDonationService {
	
	//접근제한자 반환타입 메소드명(매개변수)

	public MemberVO getMemInfo(String memId);
	
	
}
