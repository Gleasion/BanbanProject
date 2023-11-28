package kr.or.ddit.banban.controller;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/deleteMsg.do")
public class DeleteMsgController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String wmNo = req.getParameter("checked");
		String[] wmNos = wmNo.split(",");
		List wmNoList = new ArrayList();
		for(int i=0;i<wmNos.length;i++) {
			wmNoList.add(wmNos[i]);
		}
		
//		String memId = String.valueOf(req.getSession().getAttribute("loginCode"));
		System.out.println("wmNo : " + wmNo);
		
		IMsgService msgService = MsgServiceImpl.getInstance();
		
		int resultCnt = msgService.deleteMsg(wmNoList);
//		System.out.println("msgList : " + msgList);
//		
//		req.setAttribute("msgList", msgList);
		
		RequestDispatcher rd = req.getRequestDispatcher("/getAllMsg.do");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
