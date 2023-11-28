package kr.or.ddit.board.vo;

import java.util.Date;

public class AtchFileVO {
	
	private long bafId = -1;
	private Date bafCdt;
	private String bafUat;
	private int bafdNo = 1;
	private String bafdCours;
	private String bafdSavenm;
	private String bafdOrinm;
	private String bafdExtsn;
	private String bafdCn;
	private long bafdSize = 0;
	
	
	
	public AtchFileVO() {
		super();
	}

	public long getBafId() {
		return bafId;
	}
	
	public void setBafId(long bafId) {
		this.bafId = bafId;
	}
	
	public Date getBafCdt() {
		return bafCdt;
	}
	
	public void setBafCdt(Date bafCdt) {
		this.bafCdt = bafCdt;
	}
	
	public String getBafUat() {
		return bafUat;
	}
	
	public void setBafUat(String bafUat) {
		this.bafUat = bafUat;
	}
	
	public int getBafdNo() {
		return bafdNo;
	}
	
	public void setBafdNo(int bafdNo) {
		this.bafdNo = bafdNo;
	}
	
	public String getBafdCours() {
		return bafdCours;
	}
	
	public void setBafdCours(String bafdCours) {
		this.bafdCours = bafdCours;
	}
	
	public String getBafdSavenm() {
		return bafdSavenm;
	}
	
	public void setBafdSavenm(String bafdSavenm) {
		this.bafdSavenm = bafdSavenm;
	}
	
	public String getBafdOrinm() {
		return bafdOrinm;
	}
	
	public void setBafdOrinm(String bafdOrinm) {
		this.bafdOrinm = bafdOrinm;
	}
	public String getBafdExtsn() {
		return bafdExtsn;
	}
	
	public void setBafdExtsn(String bafdExtsn) {
		this.bafdExtsn = bafdExtsn;
	}
	
	public String getBafdCn() {
		return bafdCn;
	}
	
	public void setBafdCn(String bafdCn) {
		this.bafdCn = bafdCn;
	}
	
	public long getBafdSize() {
		return bafdSize;
	}
	
	public void setBafdSize(long bafdSize) {
		this.bafdSize = bafdSize;
	}

	
	
	
	
}
