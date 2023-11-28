package kr.or.ddit.banban.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.banban.dao.FIndDaoImpl;
import kr.or.ddit.banban.dao.IFIndDao;
import kr.or.ddit.banban.vo.MemberVO;

public class FindServiceImpl implements IFindService {

	private IFIndDao dao;
	private static IFindService service;

	private FindServiceImpl() {
		dao = FIndDaoImpl.getInstance();
	}

	public static IFindService getInstance() {
		if (service == null) {
			service = new FindServiceImpl();
		}
		return service;
	}

	@Override
	public MemberVO getFindId(MemberVO mv) {
		return dao.getFindId(mv);
	}

	@Override
	public MemberVO getFindPw(MemberVO mv) {
		return dao.getFindPw(mv);
	}
}
