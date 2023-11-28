package kr.or.ddit.banban.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.banban.dao.MemberDaoImpl;
import kr.or.ddit.banban.dao.IMemberDao;
import kr.or.ddit.banban.vo.DonationListVO;
import kr.or.ddit.banban.vo.MemberVO;
import sun.security.jca.GetInstance;

public class DonationServiceImpl implements IDonationService{
	
	private IMemberDao dao;
	private static IDonationService service;
	
	
	private DonationServiceImpl() {
		
		dao = MemberDaoImpl.getInstance(); 
		
	}
	
	public static IDonationService getInstance() {
		if(service == null) {
			service = new DonationServiceImpl();
		}
		return service;
	}

	@Override
	public MemberVO getMemInfo(String memId) {
		return dao.getMemInfo(memId);
	}




	
	
}
