package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.service.IPasingService;
import kr.or.ddit.board.service.PagingServiceImpl;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PasingVO;

@WebServlet("/board/paging")
public class PagingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PagingController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bdCateNo = Integer.parseInt(request.getParameter("bdCateNo"));

		IBoardService bdService = BoardServiceImpl.getInstance();
				
		int currentPage = 1;
		currentPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		IPasingService boardService = PagingServiceImpl.getInstance();
		
		int countList = boardService.countList();

		int perPage = 5;
		
		int perList = 10;
		
		int totalPage = (int)Math.ceil((double)countList / (double)perList);  
		
		int start = (currentPage - 1) * perList + 1;

		int end = start + perList - 1;
		if(end > countList) end = countList; 
		
		int startPage = ((currentPage - 1) / perPage * perPage) + 1;
		
		int endPage = startPage + perPage - 1;
		if(endPage > totalPage) endPage = totalPage;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("bdCateNo", bdCateNo);
		map.put("currentPage", currentPage);

		List<BoardVO> list = boardService.pagingList(map); 
		
		request.setAttribute("list", list);
		request.setAttribute("sPage", startPage);
		request.setAttribute("ePage", endPage);
		request.setAttribute("ttPage", totalPage);
		request.setAttribute("cPage", currentPage);
		
		String viewPath = "";
	    if (bdCateNo == 100) {
			viewPath = "notice";
		} else if (bdCateNo == 200) {
			viewPath = "ask";
		} else if (bdCateNo == 300) {
			viewPath = "review";
		} else if (bdCateNo == 400) {
			viewPath = "dona";
		} else if (bdCateNo == 500) {
			viewPath = "free";
		} else if (bdCateNo == 600) {
			viewPath = "adv";
		}
		
		request.getRequestDispatcher("/views/board/" + viewPath + "List.jsp?page=" + currentPage).forward(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("두포스트");
		doGet(req, resp);
	}

}
