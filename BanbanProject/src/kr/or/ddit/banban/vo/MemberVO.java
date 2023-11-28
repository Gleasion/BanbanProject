package kr.or.ddit.banban.vo;

import java.time.LocalDate;
import java.util.Date;

public class MemberVO {
   private String memId;    //아이디
   private String memPw;   	//비밀번호
   private String memNic;   //닉네임
   private String memNm;  	//이름
   private String memBir;   //생년월일
   private String memAddr;  //주소
   private String memEmail;	//이메일
   private String memTel;   //전화번호
   private String memRepCnt; //신고횟수
   
   public MemberVO() {
   }

   //내 정보 출력에 대한 생성자
   public MemberVO(String memId, String memPw, String memNic, String memNm, String memBir, String memAddr,
         String memEmail, String memTel) {
      super();
      this.memId = memId;
      this.memPw = memPw;
      this.memNic = memNic;
      this.memNm = memNm;
      this.memBir = memBir;
      this.memAddr = memAddr;
      this.memEmail = memEmail;
      this.memTel = memTel;
   }
   
   
   
   public MemberVO(String memId, String memPw, String memNic, String memNm, String memBir, String memAddr, String memEmail,
		String memTel, String memRepCnt) {
	super();
	this.memId = memId;
	this.memPw = memPw;
	this.memNic = memNic;
	this.memNm = memNm;
	this.memBir = memBir;
	this.memAddr = memAddr;
	this.memEmail = memEmail;
	this.memTel = memTel;
	this.memRepCnt = memRepCnt;
}

//멤버 업데이트를 위한 생성자
   public MemberVO(String memId, String memPw, String memNic,String memTel, String memAddr, 
		    String memEmail) {
	      super();
	      this.memId = memId;
	      this.memPw = memPw;
	      this.memNic = memNic;
	      this.memAddr = memAddr;
	      this.memEmail = memEmail;
	      this.memTel = memTel;
	   }

   public String getMemRepCnt() {
	return memRepCnt;
}

public void setMemRepCnt(String memRepCnt) {
	this.memRepCnt = memRepCnt;
}

public String getMemId() {
      return memId;
   }

   public void setMemId(String memId) {
      this.memId = memId;
   }

   public String getMemPw() {
      return memPw;
   }

   public void setMemPw(String memPw) {
      this.memPw = memPw;
   }

   public String getMemNic() {
      return memNic;
   }

   public void setMemNic(String memNic) {
      this.memNic = memNic;
   }

   public String getMemNm() {
      return memNm;
   }

   public void setMemNm(String memNm) {
      this.memNm = memNm;
   }

   public String getMemBir() {
      return memBir;
   }

   public void setMemBir(String memBir) {
      this.memBir = memBir;
   }

   public String getMemAddr() {
      return memAddr;
   }

   public void setMemAddr(String memAddr) {
      this.memAddr = memAddr;
   }

   public String getMemEmail() {
      return memEmail;
   }

   public void setMemEmail(String memEmail) {
      this.memEmail = memEmail;
   }

   public String getMemTel() {
      return memTel;
   }

   public void setMemTel(String memTel) {
      this.memTel = memTel;
   }

   @Override
   public String toString() {
      return "MemberVO [memId=" + memId + ", memPw=" + memPw + ", memNic=" + memNic + ", memNm=" + memNm + ", memBir="
            + memBir + ", memAddr=" + memAddr + ", memEmail=" + memEmail + ", memTel=" + memTel + "]";
   }
   
}