package kr.or.ddit.banban.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.banban.service.MemberServiceImpl;
import kr.or.ddit.banban.vo.HospitalVO;
import kr.or.ddit.banban.service.HospServiceImpl;
import kr.or.ddit.banban.service.IHospService;
import kr.or.ddit.banban.service.IMemberService;

@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/Login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uId = request.getParameter("userId");
		String uPw = request.getParameter("userPw");

		Map<String, Object> LoginMap = new HashMap<String, Object>();
		LoginMap.put("memId", uId);
		LoginMap.put("memPw", uPw);
		LoginMap.put("hospCd", uId);
		LoginMap.put("hospPw", uPw);
		System.out.println("loginMap : " + LoginMap);

		IMemberService memService = MemberServiceImpl.getInstance();
		IHospService hospService = HospServiceImpl.getInstance();
		String memId = memService.checkLogin(LoginMap);
		String hospCd = hospService.checkHospLogin(LoginMap);
		System.out.println("db조회결과 >> " + memId);
		System.out.println("db조회결과 >> " + hospCd);

		String msg = "";
		HttpSession session = request.getSession();

		if (memId != null) {
			System.out.println("if 1통과");
			// 세션에 정보를 담아서 메인페이지로 이동

			session.setAttribute("loginCode", memId);

			msg = memId + "님 환영합니다.";

			session.setAttribute("msg", msg);

			// root 적용시 >> contextroot하위 webContent 위치를 나타냄(index페이지로 이동...)
			request.getRequestDispatcher("/Index.jsp").forward(request, response); // 해당 위치로 페이지 변경

		} else if (hospCd != null) {
			System.out.println("로그인 병원 코드 도착 :" + hospCd);

			session.setAttribute("hospCode", hospCd);
			session.setAttribute("loginCode", hospCd);
			HospitalVO hospVo = hospService.getHosp(hospCd);

			msg = hospVo.getHospNm() + "님 환영합니다.";

			session.setAttribute("msg", msg);

			request.getRequestDispatcher("/Index.jsp").forward(request, response);
		} else {

			msg = "아이디와 비밀번호가 일치하지 않습니다.";
			session.setAttribute("msg", msg);

			// 기존 페이지(login.html)에 머무르기...
			response.sendRedirect("Login.jsp"); // 새로운 url을 요청

		}
	}
}
