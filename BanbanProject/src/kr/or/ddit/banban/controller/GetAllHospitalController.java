package kr.or.ddit.banban.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.banban.service.HospServiceImpl;
import kr.or.ddit.banban.service.IHospService;
import kr.or.ddit.banban.vo.HospitalVO;
import kr.or.ddit.banban.vo.MsgVO;

@WebServlet("/getAllHosp.do")
public class GetAllHospitalController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String hospCd =  String.valueOf(req.getSession().getAttribute("loginCode"));
		
		IHospService hospService = HospServiceImpl.getInstance();
		
		List<HospitalVO> hospList = hospService.getAllHosp();
		
		req.setAttribute("hospList", hospList);
		//req.getRequestDispatcher("/는 rootContext : http://localhost:8888/ZMidMsg/까지");
		RequestDispatcher rd = req.getRequestDispatcher("/views/hospital/getAllHosp.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
