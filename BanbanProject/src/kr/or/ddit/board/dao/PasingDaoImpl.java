package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.banban.dao.MyBatisDao;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PasingVO;

public class PasingDaoImpl extends MyBatisDao implements IPasingDao {

	private static IPasingDao dao;

	private PasingDaoImpl () {}
	
	public static IPasingDao getInstance() {
		if(dao == null) dao = new PasingDaoImpl();
		return dao;
	}

	@Override
	public int countList() throws SQLException {
		return selectOne("board.countList");
	}

	@Override
	public List<BoardVO> pagingList(Map<String, Object> map) throws SQLException {
		return selectList("board.pagingList", map);
	}
	
}
