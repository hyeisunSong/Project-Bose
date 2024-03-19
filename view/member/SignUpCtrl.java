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

@WebServlet("/signUpCtrl.do")
public class SignUpCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String id 		= request.getParameter("id");
		String pass1 	= request.getParameter("pass1");
		String pass2 	= request.getParameter("pass2");
		String name 	= request.getParameter("name");
		String birth 	= request.getParameter("birth");
		String gender 	= request.getParameter("gender");
		String phone 	= request.getParameter("phone");
		id		= id.toLowerCase();
		phone 	= phone.replaceAll("-", "");
		birth 	= birth.replaceAll("-", "");
		
		if (pass1.equals(pass2)) {
			BoseMemberVO vo = new BoseMemberVO();
			vo.setId(id);
			vo.setPassword(pass1);
			vo.setName(name);
			vo.setBirth(birth);
			vo.setGender(gender);
			vo.setPhone(phone);
			
			BoseMemberDAO dao = new BoseMemberDAO();
			int result = dao.insertMember(vo);
			if (result > 0) {
				//response.sendRedirect("index.jsp?content=login.jsp");
				PrintWriter out = response.getWriter();
				out.print("<script>alert('회원가입을 축하드립니다.\\n로그인후 이용해 주세요.');location.href='index.jsp?content=login.jsp';</script>");
				out.close();
			} else {
				response.sendRedirect("index.jsp?content=join.jsp");
			}
		} else {
			response.sendRedirect("index.jsp?content=join.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
