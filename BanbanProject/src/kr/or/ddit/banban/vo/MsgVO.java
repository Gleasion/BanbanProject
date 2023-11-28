package kr.or.ddit.banban.vo;

public class MsgVO {

	private int wmNo;
	private String memId;
	private String wmReceiveId;
	private String wmMsg;
	private String wmMdate;
	
	public MsgVO() {
	}
	
	public MsgVO(String memId) {
		super();
		this.memId = memId;
	}
	
	public MsgVO(String memId, String wmReceiveId, String wmMsg) {
		super();
		this.memId = memId;
		this.wmReceiveId = wmReceiveId;
		this.wmMsg = wmMsg;
	}

	public MsgVO(int wmNo, String memId, String wmReceiveId, String wmMsg, String wmMdate) {
		super();
		this.wmNo = wmNo;
		this.memId = memId;
		this.wmReceiveId = wmReceiveId;
		this.wmMsg = wmMsg;
		this.wmMdate = wmMdate;
	}
	
	public int getWmNo() {
		return wmNo;
	}
	
	public void setWmNo(int wmNo) {
		this.wmNo = wmNo;
	}
	
	public String getMemId() {
		return memId;
	}
	
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	public String getWmReceiveId() {
		return wmReceiveId;
	}
	
	public void setWmReceiveId(String wmReceiveId) {
		this.wmReceiveId = wmReceiveId;
	}
	
	public String getWmMsg() {
		return wmMsg;
	}
	
	public void setWmMsg(String wmMsg) {
		this.wmMsg = wmMsg;
	}
	
	public String getWmMdate() {
		return wmMdate;
	}
	
	public void setWmMdate(String wmMdate) {
		this.wmMdate = wmMdate;
	}

	@Override
	public String toString() {
		return "MsgVO [wmNo=" + wmNo + ", memId=" + memId + ", wmReceiveId=" + wmReceiveId + ", wmMsg=" + wmMsg
				+ ", wmMdate=" + wmMdate + "]";
	}
	
    private String getLoginId(){
    	return "1";
    }
	
}