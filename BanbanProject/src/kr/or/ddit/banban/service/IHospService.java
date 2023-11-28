package kr.or.ddit.banban.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.banban.vo.HospitalVO;

public interface IHospService {
	
	public int registerHosp(HospitalVO hv);
	
	public int checkHosp(String hospCd);
	
	public HospitalVO getHosp(String hospCd);
	
	public List<HospitalVO> getAllHosp();
	
	public int modifyHosp(HospitalVO hv);
	
	public int removeHosp(String hospCd);
	
	public List<HospitalVO> searchHosp(HospitalVO hv);
	
	public String checkHospLogin(Map<String, Object> HosploginMap);
	
}
