package kr.or.ddit.banban.service;

import java.util.List;

import kr.or.ddit.banban.dao.PetDaoImpl;
import kr.or.ddit.banban.dao.IPetDao;
import kr.or.ddit.banban.vo.PetVO;


public class PetServiceImpl implements IPetService{

	private static IPetService petService;
	
	private IPetDao petDao;
	
	private PetServiceImpl() {
		petDao = PetDaoImpl.getInstance();
	}
	
	public static IPetService getInstance() {
		if(petService == null) {
			petService = new PetServiceImpl();
		}
		
		return petService;
	}
	
	@Override
	public int registerPet(PetVO pv) {
		
		return petDao.insertPet(pv);
	}

	@Override
	public boolean checkPet(String petNo) {
		return petDao.checkPet(petNo);
	}

	@Override
	public List<PetVO> getAllPet(String memId) {
		return petDao.getAllPet(memId);
	}

	@Override
	public int modifyPet(PetVO pv) {
		return petDao.updatePet(pv);
	}

	@Override
	public int removePet(String petNo) {
		return petDao.deletePet(petNo);
	}

//	@Override
//	public List<PetVO> searchPet(PetVO pv) {
//		return petDao.searchPet(pv);
//	}

	@Override
	public PetVO getPet(String petNo) {
		return petDao.getPet(petNo);
	}
	
}
