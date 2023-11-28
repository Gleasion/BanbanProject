package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PasingVO;

public interface IPasingService {

	public int countList();

	public List<BoardVO> pagingList(Map<String, Object> map);
	
}
