package kr.or.ddit.banban.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.banban.vo.HospitalVO;


public interface IHospDao {
	public int insertHosp(HospitalVO hv);

	public int updateHosp(HospitalVO hv);

	public int deleteHosp(String hospCd);

	public int checkHosp(String hospCd);

	public List<HospitalVO> getAllHosp();

	public List<HospitalVO> searchHosp(HospitalVO hv);

	public HospitalVO getHosp(String hospCd);

	public String checkHospLogin(Map<String, Object> loginHospMap);

	public HospitalVO getHospInfo(String hospCd);

}
