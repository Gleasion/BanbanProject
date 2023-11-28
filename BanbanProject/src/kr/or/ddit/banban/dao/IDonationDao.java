package kr.or.ddit.banban.dao;

import java.util.List;

import kr.or.ddit.banban.vo.DonationListVO;
import kr.or.ddit.banban.vo.MemberVO;

public interface IDonationDao {
	
	public int insertDonation(DonationListVO dv);
	
	public List<DonationListVO> searchAllDonationList();

}
