package kr.or.ddit.board.vo;

import java.util.Date;

public class BoardVO {

	private int bdNo;
	private int bdCateNo;
	private String bdTitle;
	private String bdCont;
	private Date bdReg;
	private int bdHits;
	private int bdRepCnt;
	private String memId;
	private String memNic;
	private long bafId = -1;
	private int rnum;
	private String bdRating;

	public BoardVO() {
	}

	public BoardVO(int bdNo, int bdCateNo, String bdTitle, String memNic, Date bdReg) {
		super();
		this.bdNo = bdNo;
		this.bdCateNo = bdCateNo;
		this.bdTitle = bdTitle;
		this.memNic = memNic;
		this.bdReg = bdReg;
	}

	public BoardVO(int bdNo, String bdTitle, String bdCont) {
		super();
		this.bdNo = bdNo;
		this.bdTitle = bdTitle;
		this.bdCont = bdCont;
	}

	public BoardVO(int bdNo, int bdCateNo, String bdTitle, String bdCont, Date bdReg, int bdHits, int bdRepCnt,
			String memNic, int bafId) {
		super();
		this.bdNo = bdNo;
		this.bdCateNo = bdCateNo;
		this.bdTitle = bdTitle;
		this.bdCont = bdCont;
		this.bdReg = bdReg;
		this.bdHits = bdHits;
		this.bdRepCnt = bdRepCnt;
		this.memNic = memNic;
		this.bafId = bafId;
	}

	public BoardVO(int bdNo, int bdCateNo, String bdTitle, String bdCont, String memId, int bafId) {
		super();
		this.bdNo = bdNo;
		this.bdCateNo = bdCateNo;
		this.bdTitle = bdTitle;
		this.bdCont = bdCont;
		this.memId = memId;
		this.bafId = bafId;
	}

	public BoardVO(int bdCateNo, String bdTitle, String bdCont, String memId, int bafId) {
		super();
		this.bdCateNo = bdCateNo;
		this.bdTitle = bdTitle;
		this.bdCont = bdCont;
		this.memId = memId;
		this.bafId = bafId;
	}

	public BoardVO(int bdCateNo, String memId) {
		super();
		this.bdCateNo = bdCateNo;
		this.memId = memId;
	}

	public BoardVO(int bdCateNo, String bdTitle, String bdCont, String memId) {
		super();
		this.bdCateNo = bdCateNo;
		this.bdTitle = bdTitle;
		this.bdCont = bdCont;
		this.memId = memId;
	}

	public BoardVO(int bdCateNo, String bdTitle, String bdCont, String memId, String bdRating) {
		super();
		this.bdCateNo = bdCateNo;
		this.bdTitle = bdTitle;
		this.bdCont = bdCont;
		this.memId = memId;
		this.bdRating = bdRating;
	}
	
	public BoardVO(int bdCateNo, String bdTitle, String bdCont, Date bdReg, int bdHits, int bdRepCnt, String memId,
			int bafId) {
		super();
		this.bdCateNo = bdCateNo;
		this.bdTitle = bdTitle;
		this.bdCont = bdCont;
		this.bdReg = bdReg;
		this.bdHits = bdHits;
		this.bdRepCnt = bdRepCnt;
		this.memId = memId;
		this.bafId = bafId;
	}

	public BoardVO(String bdTitle, String bdCont) {
		super();
		this.bdTitle = bdTitle;
		this.bdCont = bdCont;
	}
	
	public BoardVO(String bdTitle, String bdCont, String bdRating) {
		super();
		this.bdTitle = bdTitle;
		this.bdCont = bdCont;
		this.bdRating = bdRating;
	}

	public BoardVO(String bdTitle, String bdCont, int bafId) {
		super();
		this.bdTitle = bdTitle;
		this.bdCont = bdCont;
		this.bafId = bafId;
	}

	public BoardVO(int bdNo, String bdTitle, Date bdReg, String memId) {
		super();
		this.bdNo = bdNo;
		this.bdTitle = bdTitle;
		this.bdReg = bdReg;
		this.memId = memId;
	}

	public BoardVO(int bdNo, int bdCateNo, String bdTitle, String bdCont, Date bdReg, int bdHits, int bdRepCnt,
			String memId) {
		super();
		this.bdNo = bdNo;
		this.bdCateNo = bdCateNo;
		this.bdTitle = bdTitle;
		this.bdCont = bdCont;
		this.bdReg = bdReg;
		this.bdHits = bdHits;
		this.bdRepCnt = bdRepCnt;
		this.memId = memId;
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

	public String getBdTitle() {
		return bdTitle;
	}

	public void setBdTitle(String bdTitle) {
		this.bdTitle = bdTitle;
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

	public int getBdHits() {
		return bdHits;
	}

	public void setBdHits(int bdHits) {
		this.bdHits = bdHits;
	}

	public int getBdRepCnt() {
		return bdRepCnt;
	}

	public void setBdRepCnt(int bdRepCnt) {
		this.bdRepCnt = bdRepCnt;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemNic() {
		return memNic;
	}

	public void setMemNic(String memNic) {
		this.memNic = memNic;
	}

	public long getBafId() {
		return bafId;
	}

	public void setBafId(long bafId) {
		this.bafId = bafId;
	}

	public String getBdRating() {
		return bdRating;
	}

	public void setBdRating(String bdRating) {
		this.bdRating = bdRating;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return "BoardVO [bdNo=" + bdNo + ", bdCateNo=" + bdCateNo + ", bdTitle=" + bdTitle + ", bdCont=" + bdCont
				+ ", bdReg=" + bdReg + ", bdHits=" + bdHits + ", bdRepCnt=" + bdRepCnt + ", memId=" + memId
				+ ", memNic=" + memNic + ", bafId=" + bafId + ", rnum=" + rnum + "]";
	}

}
