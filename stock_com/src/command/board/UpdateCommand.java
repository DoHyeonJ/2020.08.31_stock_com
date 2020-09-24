package command.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Board_DAO;

public class UpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		Board_DAO dao = new Board_DAO();
		
		//입력한 값을 받아오기
		int uid = Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//유효성 체크 null 이거나, 빈문자열이면 이전화면으로 돌아가기
		if(title != null && title.trim().length() > 0) {
			try {
				cnt = dao.update(uid, title, content);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}// end if
		
		request.setAttribute("result", cnt);
	} //end execute()
} //end Command