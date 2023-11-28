package kr.or.ddit.banban.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import kr.or.ddit.service.AtchFileServiceImpl;
//import kr.or.ddit.service.IAtchFileService;
//import kr.or.ddit.vo.AtchFileVO;
import kr.or.ddit.banban.service.IMemberService;
import kr.or.ddit.banban.service.IPetService;
import kr.or.ddit.banban.service.MemberServiceImpl;
import kr.or.ddit.banban.service.PetServiceImpl;
import kr.or.ddit.banban.vo.MemberVO;
import kr.or.ddit.banban.vo.PetVO;

@WebServlet("/PetMypage")
public class PetMypageController extends HttpServlet {

	private IPetService petService;

	public PetMypageController() {
		petService = PetServiceImpl.getInstance();
	}
 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String memId = (String) req.getSession().getAttribute("loginCode");
		List<PetVO> petList = petService.getAllPet(memId);
		for (int i = 0; i < petList.size(); i++) {
			
			if (petList.get(i).getPetRegno() == null) {
				petList.get(i).setPetRegno("000000000000000");
			}
			if (petList.get(i).getPetChip() == null) {
				petList.get(i).setPetChip("N");
			}
			if (petList.get(i).getPetKind() == null) {
				petList.get(i).setPetKind("등록된 정보가 없습니다.");
			}
			if (petList.get(i).getPetGender() == null) {
				petList.get(i).setPetGender("N");
			}
			if (petList.get(i).getPetNeu()== null) {
				petList.get(i).setPetNeu("?");
			}
			if (petList.get(i).getPetBir() != null) {
//				SimpleDateFormat outputFormat = new SimpleDateFormat("yy-MM-dd");
//				try {
//					String petBir = outputFormat.format(outputFormat.parse(petList.get(i).getPetBir()));
//					petList.get(i).setPetBir(petBir);
//				} catch (ParseException e) {
//					e.printStackTrace();
//				}
				petList.get(i).getPetBir();
			}else {
//				petList.get(i).setPetBir("");
				
			}
			if (petList.get(i).getPetEtc() == null) {
				petList.get(i).setPetEtc("등록된 정보가 없습니다.");
			}
			if (petList.get(i).getPetAtchFileName() == null) {
				petList.get(i).setPetAtchFileName("등록된 정보가 없습니다.");
			}
			
		}

		req.setAttribute("petList", petList);

		req.getRequestDispatcher("/views/pet/petMypage.jsp");

		req.getRequestDispatcher("/views/pet/petMypage.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
