package kr.or.ddit.banban.vo;

public class HospitalVO {
	private String hospCd;
	private String hospPw;
	private String hospNm;
	private String hospEntNo;
	private String hospPsStart;
	private String hospPsEnd;
	private String hospAddr;
	private String hospTel;

	public HospitalVO() {
	}
	

	public HospitalVO(String hospNm, String hospEntNo, String hospPsStart, String hospPsEnd, String hospAddr,
			String hospTel) {
		super();
		this.hospNm = hospNm;
		this.hospEntNo = hospEntNo;
		this.hospPsStart = hospPsStart;
		this.hospPsEnd = hospPsEnd;
		this.hospAddr = hospAddr;
		this.hospTel = hospTel;
	}


	public HospitalVO(String hospCd, String hospNm, String hospAddr, String hospTel) {
		super();
		this.hospCd = hospCd;
		this.hospNm = hospNm;
		this.hospAddr = hospAddr;
		this.hospTel = hospTel;
	}


	public HospitalVO(String hospCd, String hospPw, String hospNm, String hospEntNo, String hospPsStart,
			String hospPsEnd, String hospAddr, String hospTel) {
		super();
		this.hospCd = hospCd;
		this.hospPw = hospPw;
		this.hospNm = hospNm;
		this.hospEntNo = hospEntNo;
		this.hospPsStart = hospPsStart;
		this.hospPsEnd = hospPsEnd;
		this.hospAddr = hospAddr;
		this.hospTel = hospTel;
	}


	public String getHospCd() {
		return hospCd;
	}

	public void setHospCd(String hospCd) {
		this.hospCd = hospCd;
	}

	public String getHospPw() {
		return hospPw;
	}

	public void setHospPw(String hospPw) {
		this.hospPw = hospPw;
	}

	public String getHospNm() {
		return hospNm;
	}

	public void setHospNm(String hospNm) {
		this.hospNm = hospNm;
	}

	public String getHospEntNo() {
		return hospEntNo;
	}

	public void setHospEntNo(String hospEntNo) {
		this.hospEntNo = hospEntNo;
	}

	public String getHospPsStart() {
		return hospPsStart;
	}

	public void setHospPsStart(String hospPsStart) {
		this.hospPsStart = hospPsStart;
	}

	public String getHospPsEnd() {
		return hospPsEnd;
	}

	public void setHospPsEnd(String hospPsEnd) {
		this.hospPsEnd = hospPsEnd;
	}

	public String getHospAddr() {
		return hospAddr;
	}

	public void setHospAddr(String hospAddr) {
		this.hospAddr = hospAddr;
	}

	public String getHospTel() {
		return hospTel;
	}

	public void setHospTel(String hospTel) {
		this.hospTel = hospTel;
	}

}
