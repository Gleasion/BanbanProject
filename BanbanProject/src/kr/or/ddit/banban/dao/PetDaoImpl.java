package kr.or.ddit.banban.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.banban.vo.MemberVO;
import kr.or.ddit.banban.vo.PetVO;

public class PetDaoImpl extends MyBatisDao implements IPetDao {

	private static IPetDao petDao = null;
	
	private PetDaoImpl() {}
	
	public static IPetDao getInstance() {
		if(petDao == null) {
			petDao = new PetDaoImpl();
		}
		return petDao;
	}
	
	@Override
	public int insertPet(PetVO pv) {
		
		int cnt = insert("Pet.insertPet", pv);

		return cnt;
	}

	@Override
	public int updatePet(PetVO pv) {
		int cnt = 0;

		cnt = update("Pet.updatePet", pv);

		return cnt;
	}

	@Override
	public int deletePet(String petNo) {
		int cnt = delete("Pet.deletePet", petNo);

		return cnt;
	}

	@Override
	public boolean checkPet(String petNo) {
		boolean isExist = false;

		int cnt = selectOne("Pet.checkPet", petNo);

		if (cnt > 0) {
			isExist = true;
		}

		return isExist;
	}

	@Override
	public List<PetVO> getAllPet(String memId) {
		
		List<PetVO> petList = new ArrayList<PetVO>();

		petList = selectList("Pet.getAllPet", memId);

		return petList;
	}

//	@Override
//	public List<PetVO> searchPet(PetVO pv) {
//		List<PetVO> petList = Collections.EMPTY_LIST;// Collections.EMPTY_LIST 비어 있는 리스트를 초기화 시켜준다.
//
//		Map<Object, Object> paramMap = new HashMap<Object, Object>();
//		paramMap.put("petNo", pv.getPetNo());
//		paramMap.put("memNm", pv.getMemNm());
//		paramMap.put("memAddr", mv.getMemAddr());
//		paramMap.put("memTel", mv.getMemTel());
//
//		petList = selectList("Pet.searchPet2", paramMap);
//
//		return petList;
//	}

	@Override
	public PetVO getPet(String petNo) {
		PetVO pv = selectOne("Pet.getPet", petNo);

		return pv;
	}


}
