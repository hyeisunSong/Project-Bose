package view.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.vo.BoseMemberVO;

@WebServlet("/loginCheckCtrl.do")
public class LoginCheckCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String path = request.getParameter("path");
		
		BoseMemberVO user = (BoseMemberVO) request.getSession().getAttribute("user");
		if (user != null) {
			response.getWriter().print(1);
		} else {
			request.getSession().setAttribute("logPath", path);
			response.getWriter().print(0);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
