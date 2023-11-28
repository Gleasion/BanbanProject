package kr.or.ddit.banban.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.banban.dao.HospDaoImpl;
import kr.or.ddit.banban.dao.IHospDao;
import kr.or.ddit.banban.vo.HospitalVO;

public class HospServiceImpl implements IHospService {
	
	private static IHospService hospService;
	
	private IHospDao hospDao;
	
	private HospServiceImpl() {
		hospDao = HospDaoImpl.getInstance();
	}
	
	public static IHospService getInstance () {
		if(hospService == null) {
			hospService = new HospServiceImpl();
		}
		
		return hospService;
	}

	@Override
	public int registerHosp(HospitalVO hv) {
		return hospDao.insertHosp(hv);
	}

	@Override
	public int checkHosp(String hospCd) {
		return hospDao.checkHosp(hospCd);
	}

	@Override
	public HospitalVO getHosp(String hospCd) {
		return hospDao.getHosp(hospCd);
	}

	@Override
	public List<HospitalVO> getAllHosp() {
		return hospDao.getAllHosp();
	}

	@Override
	public int modifyHosp(HospitalVO hv) {
		return hospDao.updateHosp(hv);
	}

	@Override
	public int removeHosp(String hospCd) {
		return hospDao.deleteHosp(hospCd);
	}

	@Override
	public List<HospitalVO> searchHosp(HospitalVO hv) {
		return hospDao.searchHosp(hv);
	}

	@Override
	public String checkHospLogin(Map<String, Object> HosploginMap) {
		return hospDao.checkHospLogin(HosploginMap);
	}
	
}
