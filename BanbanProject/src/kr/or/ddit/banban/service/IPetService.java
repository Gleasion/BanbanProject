package kr.or.ddit.banban.service;

import java.util.List;

import kr.or.ddit.banban.vo.PetVO;

public interface IPetService {
	
	public int registerPet(PetVO pv); // 필드를 더 추가할 필요 없이 VO클래스에 멤버변수를 더 추가하면 된다.

	public boolean checkPet(String petNo);

	public PetVO getPet(String petNo);

	public List<PetVO> getAllPet(String memId);

	public int modifyPet(PetVO pv);

	public int removePet(String petNo);

//	public List<PetVO> searchPet(PetVO pv);

}
