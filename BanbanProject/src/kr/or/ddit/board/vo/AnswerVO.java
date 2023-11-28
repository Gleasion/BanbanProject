package kr.or.ddit.board.vo;

import java.sql.Date;

public class AnswerVO {

	private String hospCd;
	private int bdAnswerNo;
	private String bdCont;
	private Date bdReg;
	private int bdRepcnt;
	private String hospNm;
	private int bdNo;
	
	public AnswerVO() {
		super();
	}

	public AnswerVO(String hospCd, String bdCont) {
		super();
		this.hospCd = hospCd;
		this.bdCont = bdCont;
	}

	public String getHospCd() {
		return hospCd;
	}
	
	public void setHospCd(String hospCd) {
		this.hospCd = hospCd;
	}
	
	public int getBdAnswerNo() {
		return bdAnswerNo;
	}
	
	public void setBdAnswerNo(int bdAnswerNo) {
		this.bdAnswerNo = bdAnswerNo;
	}
	
	public String getBdCont() {
		return bdCont;
	}
	
	public void setBdCont(String bdCont) {
		this.bdCont = bdCont;
	}
	
	public Date getBdReg() {
		return bdReg;
	}
	
	public void setBdReg(Date bdReg) {
		this.bdReg = bdReg;
	}
	
	public int getBdRepcnt() {
		return bdRepcnt;
	}
	
	public void setBdRepcnt(int bdRepcnt) {
		this.bdRepcnt = bdRepcnt;
	}

	public String getHospNm() {
		return hospNm;
	}

	public void setHospNm(String hospNm) {
		this.hospNm = hospNm;
	}

	public int getBdNo() {
		return bdNo;
	}

	public void setBdNo(int bdNo) {
		this.bdNo = bdNo;
	}

	
	
	
	
}
