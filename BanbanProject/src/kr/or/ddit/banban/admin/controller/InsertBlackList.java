package kr.or.ddit.banban.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.banban.admin.service.BlackListCheckServiceImpl;
import kr.or.ddit.banban.admin.service.IBlackListCheckService;
import kr.or.ddit.banban.vo.MemberVO;
@WebServlet("/admin/insertBlackList.do")
public class InsertBlackList extends HttpServlet{
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      IBlackListCheckService bcService = BlackListCheckServiceImpl.getInstance();
      
      String memId = req.getParameter("memId");
      System.out.println("컨트롤러에서 getMemId : "+memId);
      
   
      
      int cnt = bcService.insertBlackList(memId);

      String msg = "";
      if (cnt > 0) {
         // 성공
         msg = "블랙리스트 추가 완료.";
      } else {
         // 실패
         msg = "블랙리스트 추가 실패.";
      }

      HttpSession httpSession = req.getSession();
      httpSession.setAttribute("msg", msg);

      
      System.out.println("컨트롤러에서 cnt : "+cnt);
      
      resp.sendRedirect(req.getContextPath() +  "/admin/showBlackList.do");
     
      
      
      
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
   doGet(req, resp);
   
   }
}