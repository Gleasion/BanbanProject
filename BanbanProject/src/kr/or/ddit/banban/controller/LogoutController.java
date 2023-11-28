package kr.or.ddit.banban.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LogoutController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		
		String msg = "로그아웃 되었습니다.";
		
		HttpSession httpSesion = request.getSession();
		httpSesion.setAttribute("msg", msg);
	
		response.sendRedirect(request.getContextPath()+"Index.jsp"); //contextroot정도 얻음 >> 하위 defualt페이지인 index.jsp로 이동시킴
	}


}
