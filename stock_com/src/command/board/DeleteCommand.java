package command.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Board_DAO;

public class DeleteCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		Board_DAO dao = new Board_DAO();
		
		//입력한 값을 받아오기
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		try {
			cnt = dao.deleteByUid(uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);
		
	} //end execute()
} //end Command