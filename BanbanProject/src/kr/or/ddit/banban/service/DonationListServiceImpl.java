package kr.or.ddit.banban.service;

import java.util.List;

import kr.or.ddit.banban.dao.DonationDaoImpl;
import kr.or.ddit.banban.dao.IDonationDao;
import kr.or.ddit.banban.vo.DonationListVO;
import kr.or.ddit.banban.vo.MemberVO;

public class DonationListServiceImpl implements IDonationListService {

	private IDonationDao dao;
	private static IDonationListService service;
	
	private DonationListServiceImpl() {
		dao= DonationDaoImpl.getInstance();
	}
	
	public static IDonationListService getInstance() {
		if(service == null) {
			service = new DonationListServiceImpl();
		}
		return service;
	}
	
	@Override
	public int insertDonation(DonationListVO dv) {
		
		
		return dao.insertDonation(dv);
	}

	@Override
	public List<DonationListVO> searchAllDonationList() {
		// TODO Auto-generated method stub
		return dao.searchAllDonationList();
	}





}
