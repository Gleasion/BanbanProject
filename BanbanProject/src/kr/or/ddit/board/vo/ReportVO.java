package kr.or.ddit.board.vo;

public class ReportVO {
	
	private String memId;
	private int bdNo;
	private int bdComNo;
	private String bllstRsn;
	private String reporter;
	private String repCate;
	
	
	public ReportVO() {
		super();
	}
	
	public ReportVO(String memId, int bdNo, String bllstRsn, String reporter, String repCate) {
		super();
		this.memId = memId;
		this.bdNo = bdNo;
		this.bllstRsn = bllstRsn;
		this.reporter = reporter;
		this.repCate = repCate;
	}


	public ReportVO(String memId, String bllstRsn, String reporter, String repCate) {
		super();
		this.memId = memId;
		this.bllstRsn = bllstRsn;
		this.reporter = reporter;
		this.repCate = repCate;
	}

	public ReportVO(String bllstRsn, String reporter, String repCate) {
		super();
		this.bllstRsn = bllstRsn;
		this.reporter = reporter;
		this.repCate = repCate;
	
	}

	public String getMemId() {
		return memId;
	}
	
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	public int getBdNo() {
		return bdNo;
	}
	
	public void setBdNo(int bdNo) {
		this.bdNo = bdNo;
	}
	
	public String getBllstRsn() {
		return bllstRsn;
	}
	
	public void setBllstRsn(String bllstRsn) {
		this.bllstRsn = bllstRsn;
	}
	
	public String getReporter() {
		return reporter;
	}
	
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	
	public String getRepCate() {
		return repCate;
	}
	
	public void setRepCate(String repCate) {
		this.repCate = repCate;
	}

	public int getBdComNo() {
		return bdComNo;
	}

	public void setBdComNo(int bdComNo) {
		this.bdComNo = bdComNo;
	}

	@Override
	public String toString() {
		return "ReportVO [memId=" + memId + ", bdNo=" + bdNo + ", bdComNo=" + bdComNo + ", bllstRsn=" + bllstRsn
				+ ", reporter=" + reporter + ", repCate=" + repCate + "]";
	}
	
	
	
	
	
	
	
	
}
