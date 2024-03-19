package view.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.dao.BoseBoardDAO;
import biz.vo.BoseBoardVO;
import biz.vo.BoseMemberVO;

@WebServlet("/boardInsertCtrl.do")
public class BoardInsertCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		BoseMemberVO user = (BoseMemberVO) request.getSession().getAttribute("user");
		if (user == null) {
			response.sendRedirect("index.jsp?content=login.jsp");
			return;
		}
		
		int cate_no = Integer.parseInt(request.getParameter("cate_no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String password = request.getParameter("password");
		
		BoseBoardVO vo = new BoseBoardVO();
		vo.setTitle(title);
		vo.setWriter(user.getName());
		vo.setContent(content);
		vo.setPassword(password);
		vo.setId(user.getId());
		vo.setCate_no(cate_no);
		
		BoseBoardDAO dao = new BoseBoardDAO();
		dao.insertBoard(vo);
		
		response.sendRedirect("boardAllCtrl.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
