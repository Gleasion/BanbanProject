package kr.or.ddit.banban.vo;

import java.sql.Date;

public class PetVO {
	private String petNo;
	private String memId;
	private String memNm;
	private String petNm;
	private String petRegno;
	private String petChip;
	private String petKind;
	private String petGender;
	private String petNeu;
	private String petBir;
	private String petEtc;
	private String memAddr;
	private String petAtchFileName;
	
	public PetVO() {}
	
	//반려동물 업데이트에 대한 생성자
	public PetVO(String petNo, String memId, String petNm, String petRegno, String petChip, String petKind, String petGender,
			String petNeu, String petBir, String petEtc, String petAtchFileName) {
		super();
		this.petNo = petNo;
		this.memId = memId;
		this.petNm = petNm;
		this.petRegno = petRegno;
		this.petChip = petChip;
		this.petKind = petKind;
		this.petGender = petGender;
		this.petNeu = petNeu;
		this.petBir = petBir;
		this.petEtc = petEtc;
		this.petAtchFileName = petAtchFileName;
	}
	
	//반려동물 조회에 대한 생성자
	public PetVO(String petNo, String memId, String memNm, String petNm, String petRegno, String petChip,
			String petKind, String petGender, String petNeu, String petBir, String petEtc, String memAddr, String petAtchFileName) {
		super();
		this.petNo = petNo;
		this.memId = memId;
		this.memNm = memNm;
		this.petNm = petNm;
		this.petRegno = petRegno;
		this.petChip = petChip;
		this.petKind = petKind;
		this.petGender = petGender;
		this.petNeu = petNeu;
		this.petBir = petBir;
		this.petEtc = petEtc;
		this.memAddr = memAddr;
		this.petAtchFileName = petAtchFileName;
	}
	
	
	
	public String getPetAtchFileName() {
		return petAtchFileName;
	}

	public void setPetAtchFileName(String petAtchFileName) {
		this.petAtchFileName = petAtchFileName;
	}

	public String getPetNo() {
		return petNo;
	}

	public void setPetNo(String petNo) {
		this.petNo = petNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemNm() {
		return memNm;
	}

	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}

	public String getPetNm() {
		return petNm;
	}

	public void setPetNm(String petNm) {
		this.petNm = petNm;
	}

	public String getPetRegno() {
		return petRegno;
	}

	public void setPetRegno(String petRegno) {
		this.petRegno = petRegno;
	}

	public String getPetChip() {
		return petChip;
	}

	public void setPetChip(String petChip) {
		this.petChip = petChip;
	}

	public String getPetKind() {
		return petKind;
	}

	public void setPetKind(String petKind) {
		this.petKind = petKind;
	}

	public String getPetGender() {
		return petGender;
	}

	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}

	public String getPetNeu() {
		return petNeu;
	}

	public void setPetNeu(String petNeu) {
		this.petNeu = petNeu;
	}

	public String getPetBir() {
		return petBir;
	}

	public void setPetBir(String petBir) {
		this.petBir = petBir;
	}

	public String getPetEtc() {
		return petEtc;
	}

	public void setPetEtc(String petEtc) {
		this.petEtc = petEtc;
	}

	public String getMemAddr() {
		return memAddr;
	}

	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}

	@Override
	public String toString() {
		return "PetVO [petNo=" + petNo + ", memId=" + memId + ", memNm=" + memNm + ", petNm=" + petNm + ", petRegno="
				+ petRegno + ", petChip=" + petChip + ", petKind=" + petKind + ", petGender=" + petGender + ", petNeu="
				+ petNeu + ", petBir=" + petBir + ", petEtc=" + petEtc + ", memAddr=" + memAddr + "]";
	}
	
	
}
