package kr.or.ddit.banban.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.banban.vo.HospitalVO;

public class HospDaoImpl extends MyBatisDao implements IHospDao {

	public static IHospDao hospDao;
	private HospDaoImpl() {
	}
	
	public static IHospDao getInstance() {
		if (hospDao == null ) {
			hospDao = new HospDaoImpl();
		}
		return hospDao;
	}

	@Override
	public int insertHosp(HospitalVO hv) {
		int cnt = insert("Hospital.insertHosp", hv);

		return cnt;
	}

	@Override
	public int updateHosp(HospitalVO hv) {
		int cnt = 0;

		cnt = update("Hospital.updateHosp", hv);

		return cnt;
	}

	@Override
	public int deleteHosp(String hospCd) {
		int cnt = delete("Hospital.deleteHosp", hospCd);

		return cnt;
	}

	@Override
	public int checkHosp(String hospCd) {
		int cnt = selectOne("Hospital.checkHosp", hospCd);

		
		return cnt;
	}

	@Override
	public List<HospitalVO> getAllHosp() {
		List<HospitalVO> hospList = new ArrayList<HospitalVO>();

		hospList = selectList("Hospital.getAllHosp");

		return hospList;
	}

	@Override
	public List<HospitalVO> searchHosp(HospitalVO hv) {
		List<HospitalVO> hospList = Collections.EMPTY_LIST;// Collections.EMPTY_LIST 비어 있는 리스트를 초기화 시켜준다.

		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("hospCd", hv.getHospCd());
		paramMap.put("hospNm", hv.getHospNm());
		paramMap.put("hospEntNo", hv.getHospEntNo());
		paramMap.put("hospAddr", hv.getHospAddr());
		paramMap.put("hospTel", hv.getHospTel());

		hospList = selectList("Hospital.searchHosp2", paramMap);

		return hospList;
	}

	@Override
	public HospitalVO getHosp(String hospCd) {
		HospitalVO hv = selectOne("Hospital.getHosp", hospCd);

		return hv;
	}

	@Override
	public String checkHospLogin(Map<String, Object> loginHospMap) {
		String hospCd = "";

		hospCd = selectOne("Hospital.checkHospLogin", loginHospMap);

		return hospCd;
	}

	@Override
	public HospitalVO getHospInfo(String hospCd) {
		HospitalVO hospVO = new HospitalVO();
		hospVO.setHospCd(hospCd);
		
		HospitalVO hv = selectOne("Hospital.getHosp",hospVO);
		
		return hv; 
	}
	
	

}
