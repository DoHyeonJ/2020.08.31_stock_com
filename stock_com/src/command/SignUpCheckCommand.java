package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Member_DAO;

public class SignUpCheckCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		boolean check = false;
		Member_DAO dao = new Member_DAO();
		
		//입력한 값 받아오기
		String id = request.getParameter("id");
		try {
			check = dao.idCheck(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", check);
	}
}




