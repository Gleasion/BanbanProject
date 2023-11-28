package kr.or.ddit.banban.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.banban.service.IMsgService;
import kr.or.ddit.banban.service.MsgServiceImpl;
import kr.or.ddit.banban.vo.MsgVO;

@WebServlet("/selectMsg.do")
public class SelectMsgController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.getSession().getAttribute("loginCode");
//		String memId = req.getParameter("memId");
		
		String wmNo = req.getParameter("wmNo");
//		System.out.println("wmNo : " + wmNo);
		IMsgService msgService = MsgServiceImpl.getInstance();
		
		MsgVO vo = msgService.showDetailMsg(wmNo);
//		System.out.println("result : " + vo.getMemId() + ", " + vo.getWmReceiveId() + ", " + vo.getWmMsg());
		
		req.setAttribute("msgVO", vo);
		RequestDispatcher rd = req.getRequestDispatcher("/views/msg/showDetailMsg.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
