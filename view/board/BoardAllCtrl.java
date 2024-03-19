package view.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.dao.BoseBoardDAO;
import biz.vo.BoseBoardVO;
import biz.vo.BoseCateVO;

@WebServlet("/boardAllCtrl.do")
public class BoardAllCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// #1. 페이징 처리 = (추후에 구현)
		// 화면에 보여질 게시글의 갯수를 지정
		int pageSize = 10;
		// 현재 보여지고 있는 페이지의 넘버값을 읽어들임
		String pageNum = request.getParameter("pageNum");
		// null 처리 = 처음 로딩시 값이 없으므로
		if (pageNum == null) pageNum = "1";
		
		// 전체 게시글의 갯수 = 이전, 이후 버튼이 필요한지 안 할지에 사용
		int count = 0;
		// JSP페이지 내에서 보여질 페이징 숫자값을 저장하는 변수
		int number = 0;
		// 현재 보여지고 있는 페이지 문자 -> 숫자형 캐스팅
		int currentPage = Integer.parseInt(pageNum);
		
		// 시작
		int startRow = (currentPage - 1) * pageSize + 1;
		// 끝
		int endRow = currentPage * pageSize;
		
		// 파라미터
		String cateNoStr = request.getParameter("cate_no");
		if (cateNoStr == null) cateNoStr = "-1";
		int cateNo = Integer.parseInt(cateNoStr);
		request.setAttribute("cateNo", cateNo);
		
		// 검색관련
		String searchText = request.getParameter("searchText");
		
		BoseBoardDAO dao = new BoseBoardDAO();
		List<BoseBoardVO> list = dao.selectAllBoard(startRow, endRow, cateNo, searchText);
		List<BoseCateVO> cate = dao.getAllCategory();
		count = dao.totalBoardCnt(cateNo, searchText);
		
		// 페이징 숫자 = 화면에 보일 페이징 숫자
		number = count - (currentPage - 1) * pageSize;
		
		// 바인딩
		request.setAttribute("list"			, list);		// 최신글 10개
		request.setAttribute("cate"			, cate);		// 카테고리 목록
		request.setAttribute("number"		, number); 		// 페이징 갯수
		request.setAttribute("pageSize"		, pageSize); 	// 화면에 보여질 게시글 갯수
		request.setAttribute("count"		, count);		// 전체 게시글 갯수 = 이걸 알아야 페이징 계산가능
		request.setAttribute("currentPage"	, currentPage); // 현재 페이지
		
		request.getRequestDispatcher("index.jsp?content=noticeboard.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
