package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Comment_DAO;

public class CommentWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		Comment_DAO dao = new Comment_DAO();
		
		//입력한 값 받아오기
		int boardUid = Integer.parseInt(request.getParameter("boardUid"));
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		
		//parameter 유효성 검증
		if(id!= null && id.trim().length() > 0 && content != null && content.trim().length() > 0) {
			try {
				cnt = dao.insert(boardUid, id, content);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);
	}
	
}