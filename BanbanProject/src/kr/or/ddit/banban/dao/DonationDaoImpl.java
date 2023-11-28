package kr.or.ddit.banban.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.banban.dao.MyBatisDao;
import kr.or.ddit.banban.vo.DonationListVO;
import kr.or.ddit.banban.vo.MemberVO;
import kr.or.ddit.util.MyBatisUtil;

public class DonationDaoImpl extends MyBatisDao implements IDonationDao {
	
	private DonationDaoImpl() {};
	
	private static IDonationDao dao = null;
	
	public static IDonationDao getInstance() {
		if(dao == null) {
			dao = new DonationDaoImpl();
		}
		return dao;
	}
	
	
	@Override
	public int insertDonation(DonationListVO dv) {
		int cnt = insert("don.insertDonationList", dv);
		
		return cnt;
	}


	@Override
	public List<DonationListVO> searchAllDonationList() {
		  
		List<DonationListVO> dcList = new ArrayList<DonationListVO>();
		
		SqlSession session = MyBatisUtil.getInstance(true);
		
		dcList = session.selectList("don.searchAllDonationList");
		
		
		return dcList;
	}




}
