package kr.or.ddit.banban.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import kr.or.ddit.banban.service.IMemberService;
import kr.or.ddit.banban.service.IPetService;
import kr.or.ddit.banban.service.MemberServiceImpl;
import kr.or.ddit.banban.service.PetServiceImpl;
import kr.or.ddit.banban.vo.MemberVO;
import kr.or.ddit.banban.vo.PetVO;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 3, maxFileSize = 1024 * 1024 * 40)
@WebServlet(value = "/InsertPet")
public class InsertPetController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/views/pet/petInsert.jsp");
		rd.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		String memId = (String) req.getSession().getAttribute("loginCode");

		String petNo = req.getParameter("petNo");
		String petNm = req.getParameter("petNm");
		String petRegno = req.getParameter("petRegno");
		String petChip = req.getParameter("petChip");
		String petKind = req.getParameter("petKind");
		String petGender = req.getParameter("petGender");
		String petNeu = req.getParameter("petNeu");
		String petBir = req.getParameter("petBir");
		String petEtc = req.getParameter("petEtc");
		IPetService petService = PetServiceImpl.getInstance();
		String petAtchFileName = "";
		try {
			for (Part part : req.getParts()) {

				petAtchFileName = part.getSubmittedFileName();
				if (petAtchFileName != null && !petAtchFileName.equals("")) {
					part.write("D:/4.HighJava/workspace/BanbanProject/WebContent/img/petImg/" + petAtchFileName);
				}
				
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		PetVO pv = new PetVO(petNo, memId, petNm, petRegno, petChip, petKind, petGender, petNeu, petBir, petEtc,
				petAtchFileName);

		int cnt = petService.registerPet(pv);
		String msg = "";
		if (cnt > 0) {
			msg = "반려동물이 등록되었습니다.";
		} else {
			msg = "반려동물 등록에 실패했습니다.";
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
