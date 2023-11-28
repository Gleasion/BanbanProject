package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PasingVO;

public interface IPasingDao {

	public int countList() throws SQLException;
	
	public List<BoardVO> pagingList(Map<String, Object> map) throws SQLException;
	
}
