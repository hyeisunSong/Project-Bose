package view.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import biz.dao.BoseBoardDAO;
import biz.vo.BoseCateVO;

@WebServlet("/boardCategory.do")
public class BoardCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		BoseBoardDAO dao = new BoseBoardDAO();
		List<BoseCateVO> cate = dao.getAllCategory();
		
		JSONArray arr = new JSONArray(cate);
		response.getWriter().print(arr.toString());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
