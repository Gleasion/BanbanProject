package kr.or.ddit.banban.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.banban.service.HospServiceImpl;
import kr.or.ddit.banban.service.IHospService;
import kr.or.ddit.banban.vo.HospitalVO;

@WebServlet("/getHosp.do")
public class HospitalDetailController extends HttpServlet {
	private IHospService hospService;

	public HospitalDetailController() {
		hospService = HospServiceImpl.getInstance();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String hospCd = (String) req.getParameter("hospCd");
System.out.println("@@ @:@@ " + hospCd);
		HospitalVO hv = hospService.getHosp(hospCd);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		req.setAttribute("hv", hv);

		RequestDispatcher rd = req.getRequestDispatcher("/views/hospital/HospDetail.jsp");
		rd.forward(req, resp);
			
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}