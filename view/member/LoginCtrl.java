package view.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.dao.BoseMemberDAO;
import biz.vo.BoseMemberVO;

@WebServlet("/loginCtrl.do")
public class LoginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		BoseMemberDAO dao = new BoseMemberDAO();
		BoseMemberVO user = dao.login(id, pw);
		if (user != null) {
			request.getSession().setAttribute("user", user);
			String path = "index.jsp";
			String logPath = (String) request.getSession().getAttribute("logPath");
			if (logPath != null) path = logPath;
			response.sendRedirect(path);
			request.getSession().removeAttribute("logPath");
		} else {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('등록되지 않은 아이디이거나,\\n아이디 또는 비밀번호를 잘못 입력했습니다.');history.back()</script>");
			out.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}