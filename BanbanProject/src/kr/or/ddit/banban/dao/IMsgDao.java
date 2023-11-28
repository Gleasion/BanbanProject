package kr.or.ddit.banban.dao;

import java.util.List;

import kr.or.ddit.banban.vo.MsgVO;


public interface IMsgDao {
	
	public List<MsgVO> sendAllMsg(String memId);

	public int insertMsg(MsgVO msgvo);
	
	public List<MsgVO> getAllMsg(String memId);
	
	public MsgVO showDetailMsg (String wmNo);
	
	public int deleteMsg (List<String> wmNo);
	
}
	
