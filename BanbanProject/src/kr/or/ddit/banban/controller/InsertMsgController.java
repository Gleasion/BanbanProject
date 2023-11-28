package kr.or.ddit.banban.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.banban.service.IMsgService;
import kr.or.ddit.banban.service.MsgServiceImpl;
import kr.or.ddit.banban.vo.MsgVO;


@WebServlet("/insertMsg.do")
public class InsertMsgController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, javax.servlet.http.HttpServletResponse resp)
			throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/views/msg/insertMsg.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		String memId = String.valueOf(req.getSession().getAttribute("loginCode"));
//		String memId = req.getParameter("memId");
		String wmReceiveId = req.getParameter("wmReceiveId");
		String wmMsg = req.getParameter("wmMsg");

		MsgVO msgvo = new MsgVO(memId, wmReceiveId, wmMsg);

		IMsgService msgService = MsgServiceImpl.getInstance();

		int cnt = msgService.insertMsg(msgvo);

		String sfmsg = "";
		if (cnt > 0) {
			sfmsg = "메시지 전송 성공";
		} else {
			sfmsg = "메시지 전송 실패";
		}

		HttpSession httpsession = req.getSession();
		httpsession.setAttribute("sfmsg", sfmsg);

		resp.sendRedirect(req.getContextPath() + "/sendAllMsg.do?memId=" + memId);

	}

}
