package kr.or.ddit.banban.service;

import java.util.List;

import kr.or.ddit.banban.vo.DonationListVO;
import kr.or.ddit.banban.vo.MemberVO;

public interface IDonationListService {
	
	public int insertDonation(DonationListVO dv);
	
	public List<DonationListVO> searchAllDonationList();
}
 