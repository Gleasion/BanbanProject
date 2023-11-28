package kr.or.ddit.board.vo;

import java.util.Date;

public class CommentVO {
	
	private int bdComNo;
	private int bdNo;
	private int bdCateNo;
	private String bdComCont;
	private int bdComRepcnt;
	private String memId;
	private Date bdComReg;
	private String memNic;
	private String hospCd;
	
	public String getHospCd() {
		return hospCd;
	}

	public void setHospCd(String hospCd) {
		this.hospCd = hospCd;
	}

	public CommentVO() {
		super();
	}
	
	public CommentVO(String bdComCont) {
		super();
		this.bdComCont = bdComCont;
	}

	public CommentVO(String bdComCont, String memId) {
		super();
		this.bdComCont = bdComCont;
		this.memId = memId;
	}
	
	
	
	public CommentVO(int bdComNo, int bdNo, int bdCateNo, String memId) {
		super();
		this.bdComNo = bdComNo;
		this.bdNo = bdNo;
		this.bdCateNo = bdCateNo;
		this.memId = memId;
	}

	public CommentVO(int bdComNo, int bdNo, int bdCateNo, String bdComCont, String memId) {
		super();
		this.bdComNo = bdComNo;
		this.bdNo = bdNo;
		this.bdCateNo = bdCateNo;
		this.bdComCont = bdComCont;
		this.memId = memId;
	}

	
	
	public CommentVO(int bdComNo, int bdNo, int bdCateNo, String bdComCont, int bdComRepcnt, String memId,
			Date bdComReg) {
		super();
		this.bdComNo = bdComNo;
		this.bdNo = bdNo;
		this.bdCateNo = bdCateNo;
		this.bdComCont = bdComCont;
		this.bdComRepcnt = bdComRepcnt;
		this.memId = memId;
		this.bdComReg = bdComReg;
	}

	public CommentVO(int bdComNo, int bdNo, int bdCateNo, String bdComCont, int bdComRepcnt, Date bdComReg,
			String memNic) {
		super();
		this.bdComNo = bdComNo;
		this.bdNo = bdNo;
		this.bdCateNo = bdCateNo;
		this.bdComCont = bdComCont;
		this.bdComRepcnt = bdComRepcnt;
		this.bdComReg = bdComReg;
		this.memNic = memNic;
	}

	public CommentVO(int bdComNo, int bdNo, int bdCateNo, String bdComCont, int bdComRepcnt, String memId,
			Date bdComReg, String memNic) {
		super();
		this.bdComNo = bdComNo;
		this.bdNo = bdNo;
		this.bdCateNo = bdCateNo;
		this.bdComCont = bdComCont;
		this.bdComRepcnt = bdComRepcnt;
		this.memId = memId;
		this.bdComReg = bdComReg;
		this.memNic = memNic;
	}

	public CommentVO(int bdNo, String bdComCont, String memId) {
		super();
		this.bdNo = bdNo;
		this.bdComCont = bdComCont;
		this.memId = memId;
	}

	public CommentVO(int bdNo, int bdCateNo, String bdComCont, String memId) {
		super();
		this.bdNo = bdNo;
		this.bdCateNo = bdCateNo;
		this.bdComCont = bdComCont;
		this.memId = memId;
	}

	public int getBdComNo() {
		return bdComNo;
	}
	
	public void setBdComNo(int bdComNo) {
		this.bdComNo = bdComNo;
	}
	
	public int getBdNo() {
		return bdNo;
	}
	
	public void setBdNo(int bdNo) {
		this.bdNo = bdNo;
	}
	
	public int getBdCateNo() {
		return bdCateNo;
	}
	
	public void setBdCateNo(int bdCateNo) {
		this.bdCateNo = bdCateNo;
	}
	
	public String getBdComCont() {
		return bdComCont;
	}
	
	public void setBdComCont(String bdComCont) {
		this.bdComCont = bdComCont;
	}
	
	public int getBdComRepcnt() {
		return bdComRepcnt;
	}
	
	public void setBdComRepcnt(int bdComRepcnt) {
		this.bdComRepcnt = bdComRepcnt;
	}
	
	public String getMemId() {
		return memId;
	}
	
	public void setMemId(String memId) {
		this.memId = memId;
	}

	public Date getBdComReg() {
		return bdComReg;
	}

	public void setBdComReg(Date bdComReg) {
		this.bdComReg = bdComReg;
	}

	public String getMemNic() {
		return memNic;
	}

	public void setMemNic(String memNic) {
		this.memNic = memNic;
	}
	
	
	
	
}
