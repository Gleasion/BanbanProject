package kr.or.ddit.banban.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.banban.service.IPetService;
import kr.or.ddit.banban.service.PetServiceImpl;


@WebServlet("/DeletePet")
public class DeletePetController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String petNo = (String) req.getParameter("petNo");
		
		IPetService petService = PetServiceImpl.getInstance();
		int cnt = petService.removePet(petNo);	

		String msg = "";
		if(cnt > 0) {
			//성공
			msg = "반려동물 삭제가 정상적으로 진행 되었습니다.";
		}else {
			//실패
			msg = "반려동물 삭제가 정상적으로 이뤄지지 않았습니다.";
		}
		
		HttpSession httpSesion = req.getSession();
		httpSesion.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/PetMypage");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
