package kr.or.ddit.banban.service;

import java.util.List;

import kr.or.ddit.banban.dao.IMsgDao;
import kr.or.ddit.banban.dao.MsgDaoImpl;
import kr.or.ddit.banban.vo.MsgVO;


public class MsgServiceImpl implements IMsgService{

	private IMsgDao	msgDao;
	
	private static IMsgService msgService;
	
	public MsgServiceImpl() {
		msgDao = MsgDaoImpl.getInstance();
	}
	
	public static IMsgService getInstance() {
		if (msgService == null) {
			msgService = new MsgServiceImpl();
		}
		return msgService;
	}
	
	@Override
	public List<MsgVO> sendAllMsg(String memId) {
		
		return msgDao.sendAllMsg(memId);
	}

	@Override
	public int insertMsg(MsgVO msgvo) {
		
		return msgDao.insertMsg(msgvo);
	}

	@Override
	public List<MsgVO> getAllMsg(String memId) {
		return msgDao.getAllMsg(memId);
	}

	@Override
	public MsgVO showDetailMsg(String wmNo) {
		return msgDao.showDetailMsg(wmNo);
	}

	@Override
	public int deleteMsg(List wmNo) {
		return msgDao.deleteMsg(wmNo);
	}

}
