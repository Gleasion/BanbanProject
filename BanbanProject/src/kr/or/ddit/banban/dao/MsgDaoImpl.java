package kr.or.ddit.banban.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.banban.vo.MsgVO;
import kr.or.ddit.util.MyBatisUtil;


public class MsgDaoImpl implements IMsgDao {
	
	private static IMsgDao msgDao;
	
	public static IMsgDao getInstance() {
		
		if(msgDao == null) {
			msgDao = new MsgDaoImpl();
		}
		return msgDao;
	}
	
	
	@Override
	public List<MsgVO> sendAllMsg(String memId) {
		
		List<MsgVO> msgList = new ArrayList<MsgVO>();
		
		SqlSession session = MyBatisUtil.getInstance(true);
		
		try {
			MsgVO msgVO = new MsgVO();
			msgVO.setMemId(memId);
			
			msgList = session.selectList("Msg.sendAllMsg",msgVO);
		}catch(PersistenceException ex){
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return msgList;
	}

	@Override
	public int insertMsg(MsgVO msgvo) {
		
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance(true);
		
		try {
			
			cnt = session.insert("Msg.insertMsg", msgvo);
			
		}catch(PersistenceException ex){
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}


	@Override
	public List<MsgVO> getAllMsg(String memId) {
		List<MsgVO> msgList = new ArrayList<MsgVO>();
		
		SqlSession session = MyBatisUtil.getInstance(true);
		
		try {
			MsgVO msgVO = new MsgVO();
			msgVO.setMemId(memId);
			
			msgList = session.selectList("Msg.getAllMsg",msgVO);
		}catch(PersistenceException ex){
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return msgList;
	}


	@Override
	public MsgVO showDetailMsg(String wmNo) {
		MsgVO vo = new MsgVO();
		
		SqlSession session = MyBatisUtil.getInstance(true);
		
		try {
			MsgVO msgVO = new MsgVO();
			msgVO.setWmNo(Integer.parseInt(wmNo));
			
			vo = session.selectOne("Msg.showDetailMsg",msgVO);
		}catch(PersistenceException ex){
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return vo;
	}


	@Override
	public int deleteMsg(List<String> wmNo) {
		int cnt = 0;
		SqlSession session = MyBatisUtil.getInstance(true);
		
		try {
			for(String str : wmNo) {
				cnt += session.delete("Msg.deleteMsg", str);
			}
		}catch(PersistenceException ex){
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

}
