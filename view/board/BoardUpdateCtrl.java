package view.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.dao.BoseBoardDAO;
import biz.vo.BoseBoardVO;

@WebServlet("/boardUpdateCtrl.do")
public class BoardUpdateCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		BoseBoardDAO dao = new BoseBoardDAO();
		BoseBoardVO vo = dao.selectOneBoard(seq);
		
		request.setAttribute("vo", vo);
		request.getRequestDispatcher("index.jsp?content=noticeboard_update.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
