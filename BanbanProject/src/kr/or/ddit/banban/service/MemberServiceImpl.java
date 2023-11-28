package kr.or.ddit.banban.service;

import java.util.List;
import java.util.Map;
import kr.or.ddit.banban.vo.MemberVO;
import kr.or.ddit.banban.dao.IMemberDao;
import kr.or.ddit.banban.dao.MemberDaoImpl;
import kr.or.ddit.banban.vo.MemberVO;

public class MemberServiceImpl implements IMemberService{

		private static IMemberService memService;
		
		private IMemberDao memDao;
		
		private MemberServiceImpl() {
			memDao = MemberDaoImpl.getInstance();
		}
		
		public static IMemberService getInstance() {
			if(memService == null) {
				memService = new MemberServiceImpl();
			}
			
			return memService;
		}
		
		@Override
		public int registerMember(MemberVO mv) {
			
			return memDao.insertMember(mv);
		}

		@Override
		public int checkMember(String memId) {
			return memDao.checkMember(memId);
		}

		@Override
		public List<MemberVO> getAllMember() {
			return memDao.getAllMember();
		}

		@Override
		public int modifyMember(MemberVO mv) {
			return memDao.updateMember(mv);
		}

		@Override
		public int removeMember(String memId) {
			return memDao.deleteMember(memId);
		}

		@Override
		public List<MemberVO> searchMember(MemberVO mv) {
			return memDao.searchMember(mv);
		}

		@Override
		public MemberVO getMember(String memId) {
			return memDao.getMember(memId);
		}
		
		

		@Override
		public String checkLogin(Map<String, Object> loginMap) {
			return memDao.checkLogin(loginMap);
		}

	}
