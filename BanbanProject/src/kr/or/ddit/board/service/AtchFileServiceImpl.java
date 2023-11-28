package kr.or.ddit.board.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import kr.or.ddit.board.dao.AtchFileDaoImpl;
import kr.or.ddit.board.dao.IAtchFileDao;
import kr.or.ddit.board.vo.AtchFileVO;

public class AtchFileServiceImpl implements IAtchFileService{

	private IAtchFileDao atchFileDao;
	
	private static IAtchFileService fileService;
	
	public AtchFileServiceImpl() {
		atchFileDao = AtchFileDaoImpl.getInstance();
	}

	public static IAtchFileService getInstance() {
		if(fileService == null) {
			fileService = new AtchFileServiceImpl();
		}
		return fileService;
	}

	@Override
	public AtchFileVO saveAtchFileList(HttpServletRequest req) {
		
//		String uploadPath = "C:/Users/nammj/4. HighJava/workdspace/BanbanProject/WebContent/img/fileImg";
		String uploadPath = req.getServletContext().getRealPath("/") + "/img/fileImg";
		
		File uploadDir = new File(uploadPath);
		
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		AtchFileVO atchFileVO = null;
		
		boolean isFristFile = true;
		
		try {
			
			for(Part part : req.getParts()) {
				
				String fileName = part.getSubmittedFileName();
				
				if(fileName != null && !fileName.equals("")) {
					
					if(isFristFile) {
						
						isFristFile = false;
						
						atchFileVO = new AtchFileVO();
						
						atchFileDao.insertAtchFile(atchFileVO);
					}

					String bafdOrinm = fileName;
					long bafdSize = part.getSize();
					String bafdSavenm = "";
					String bafdCours = "";
					String bdfdCn = "";
					
					bafdSavenm = UUID.randomUUID().toString().replace("-", "");
					bafdCours = uploadDir + "/" + bafdSavenm;
					
					String bafdExtsn = bafdOrinm.lastIndexOf(".") < 0 ? "" :
										bafdOrinm.substring(bafdOrinm.lastIndexOf(".") + 1);
					
					part.write(bafdCours);
					
					atchFileVO.setBafdSavenm(bafdSavenm);
					atchFileVO.setBafdSize(bafdSize);
					atchFileVO.setBafdOrinm(bafdOrinm);
					atchFileVO.setBafdCours(bafdCours);
					atchFileVO.setBafdExtsn(bafdExtsn);
					atchFileVO.setBafdCn(bdfdCn);
					
					atchFileDao.insertAtchFileDetail(atchFileVO);
					
					part.delete();
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return atchFileVO;
	}
	
	@Override
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO) {
		return atchFileDao.getAtchFileList(atchFileVO);
	}
	
	@Override
	public AtchFileVO getAtchFileDetail(AtchFileVO atchFileVO) {
		return atchFileDao.getAtchFileDetail(atchFileVO);
	}

	@Override
	public int insertAtchFile(AtchFileVO atchFileVO) {
		return atchFileDao.getAtchFile(atchFileVO);
	}

	
}
