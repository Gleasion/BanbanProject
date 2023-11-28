package kr.or.ddit.banban.dao;

import java.util.List;

import kr.or.ddit.banban.vo.PetVO;

public interface IPetDao {
	
	 public int insertPet(PetVO pv);
	   
	   public int updatePet(PetVO v);
	   
	   public int deletePet(String petNo);
	   
	   public boolean checkPet(String petNo);
	   
	   public List<PetVO> getAllPet(String memId);
	   
//	   public List<PetVO> searchPet(PetVO pv);
	   
	   public PetVO getPet(String petNo);
	   
}
