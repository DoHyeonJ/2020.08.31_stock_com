package command.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.Board_DAO;

public class WriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		Board_DAO dao = new Board_DAO();
		
		//입력한 값 받아오기
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//parameter 유효성 검증
		if(title != null && title.trim().length() > 0) {
			try {
				cnt = dao.insert(title, content);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);
	}
	
}