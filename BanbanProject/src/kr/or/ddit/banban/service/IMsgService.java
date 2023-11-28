package kr.or.ddit.banban.service;

import java.util.List;

import kr.or.ddit.banban.vo.MsgVO;


public interface IMsgService {
	
	public List<MsgVO> sendAllMsg(String memId);
	
	public int insertMsg(MsgVO msgvo);
	
	public List<MsgVO> getAllMsg(String memId);
	
	public MsgVO showDetailMsg (String wmNo);
	
	public int deleteMsg (List wmNo);
	
}
