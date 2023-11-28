package kr.or.ddit.banban.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import kr.or.ddit.banban.service.MemberServiceImpl;
import kr.or.ddit.banban.service.PetServiceImpl;
import kr.or.ddit.banban.service.IMemberService;
import kr.or.ddit.banban.service.IPetService;
import kr.or.ddit.banban.vo.MemberVO;
import kr.or.ddit.banban.vo.PetVO;

//기존에 있는 정보를 수정하다보니 기존에 있는 데이터를 보여줘야 한다.
@MultipartConfig
@WebServlet("/PetUpdate")
public class UpdatePetController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String memId = (String) req.getSession().getAttribute("loginCode");
		String petNo = req.getParameter("petNo");
		IPetService petService = PetServiceImpl.getInstance();

		PetVO pv = petService.getPet(petNo);
		System.out.println("UpdatePetController->pv : " + pv);
		req.setAttribute("pv", pv);

		req.getRequestDispatcher("/views/pet/petUpdate.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");

		String memId = (String) req.getSession().getAttribute("loginCode");
		String petNo = req.getParameter("petNo");
		String petRegno = req.getParameter("petRegno");
		String petNm = req.getParameter("petNm");
		String petBir = req.getParameter("petBir");
		String petChip = req.getParameter("petChip");
		String petGender = req.getParameter("petGender");
		String petNeu = req.getParameter("petNeu");
		String petKind = req.getParameter("petKind");
		String petEtc = req.getParameter("petEtc");
		String petAtchFileName = req.getParameter("petAtchFile");
		//petAtchFileName(bef) : null
		System.out.println("petAtchFileName(bef) : " + petAtchFileName);
				
		//파일업로드
		try {
			for (Part part : req.getParts()) {
				
				petAtchFileName = part.getSubmittedFileName();
				//petAtchFileName(aft) : null
				System.out.println("petAtchFileName(aft) : " + petAtchFileName);
				if (petAtchFileName != null && !petAtchFileName.equals("")) {
					part.write("D:/4.HighJava/workspace/BanbanProject/WebContent/img/petImg/" + petAtchFileName);
				}
				
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		System.out.println("UpdatePetController->doPost->petBir : " + petBir);

		IPetService petService = PetServiceImpl.getInstance();

		PetVO pv = new PetVO(petNo, memId, petNm, petRegno, petChip, petKind, petGender, petNeu, petBir, petEtc,
				petAtchFileName);
		
		if (pv.getPetRegno() == null) {
			pv.setPetRegno("000000000000000");
		}
		if (pv.getPetKind() == null) {
			pv.setPetKind("등록된 정보가 없습니다.");
		}
//		if (pv.getPetGender() == null) {
//			pv.setPetGender("N");
//		}
//		if (pv.getPetNeu() == null) {
//			pv.setPetNeu("N");
//		}
		if (pv.getPetBir() == null) {
			pv.setPetBir("");
		}
		if (pv.getPetEtc() == null) {
			pv.setPetEtc("등록된 정보가 없습니다.");
		}
		if (pv.getPetAtchFileName() == null) {
			pv.setPetAtchFileName("등록된 정보가 없습니다.");
		}

		int cnt = petService.modifyPet(pv);
		String msg = "";
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";


		}
		HttpSession httpSesion = req.getSession();
		httpSesion.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/PetMypage");
	}
	private String getFileName(Part part) {

		for (String content : part.getHeader("Content-Disposition").split(";")) {
			if (content.trim().startsWith("petAtchfileName")) {
				return content.substring(content.indexOf("=") + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

}