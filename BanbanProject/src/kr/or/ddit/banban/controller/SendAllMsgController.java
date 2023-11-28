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

@WebServlet("/sendAllMsg.do")
public class SendAllMsgController extends HttpServlet {
	
	//보낸메시지들 (발신함)
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		String memId = req.getParameter("memId");
		String memId = String.valueOf(req.getSession().getAttribute("loginCode"));
		System.out.println("memId : " + memId);
		
		IMsgService msgService = MsgServiceImpl.getInstance();
		
		List<MsgVO> msgList = msgService.sendAllMsg(memId);
		System.out.println("msgList : " + msgList);
		
		req.setAttribute("msgList", msgList);
		//req.getRequestDispatcher("/는 rootContext : http://localhost:8888/ZMidMsg/까지");
		RequestDispatcher rd = req.getRequestDispatcher("/views/msg/sendAllMessage.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
