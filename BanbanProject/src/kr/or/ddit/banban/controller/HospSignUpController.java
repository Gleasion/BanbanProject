package kr.or.ddit.banban.controller;

import java.io.IOException;

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

@WebServlet("/hospSignup.do")
public class HospSignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/views/hospital/hospSignUp.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setCharacterEncoding("UTF-8");
	    req.setCharacterEncoding("UTF-8");
	      
		// 1. 요청 파라미터 정보 가져오기
		String hospCd = req.getParameter("hospCd");
		String hospPw = req.getParameter("hospPw");
		String hospNm = req.getParameter("hospNm");
		String hospEntNo = req.getParameter("hospEntNo");
		String hospPsStart = req.getParameter("hospPsStart");
		String hospPsEnd = req.getParameter("hospPsEnd");
		String hospAddr = req.getParameter("hospAddr");
		String hospTel = req.getParameter("hospTel");
		
		
		System.out.println(hospCd+ hospPw+ hospNm+ hospEntNo+ hospPsStart+ hospPsEnd+ hospAddr+ hospTel);
		// 2. 서비스 객체 생성하기
		IHospService hospService = HospServiceImpl.getInstance();

		// 3. 회원정보 등록
		HospitalVO hv = new HospitalVO(hospCd, hospPw, hospNm, hospEntNo, hospPsStart, hospPsEnd, hospAddr, hospTel);
		
		int cnt = hospService.registerHosp(hv);

		String msg = "";
		if (cnt > 0) {
			// 성공
			msg = "병원 회원가입이 완료되었습니다.";
		} else {
			// 실패
			msg = "실패";
		}

		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);

		// 4. 목록 조회화면으로 이동하기
//		req.getRequestDispatcher("/member/list.do").forward(req, resp);
		resp.sendRedirect(req.getContextPath() + "/Index.jsp ");
	}

}
