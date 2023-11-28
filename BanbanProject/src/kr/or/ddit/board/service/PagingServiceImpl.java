package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.IPasingDao;
import kr.or.ddit.board.dao.PasingDaoImpl;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PasingVO;


public class PagingServiceImpl implements IPasingService {

	private IPasingDao dao;
	private static IPasingService service;

	private PagingServiceImpl() {
		 dao = PasingDaoImpl.getInstance();
	}
	
	public static IPasingService getInstance() {
		if(service == null) service = new PagingServiceImpl();
		return service;
	}
	
	@Override
	public int countList() {
		int countList = 0;
		try {
			countList = dao.countList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countList;
	}
	
	@Override
	public List<BoardVO> pagingList(Map<String, Object> map) {
		
		List<BoardVO> list = null;
		
		try {
			
			list = dao.pagingList(map);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
