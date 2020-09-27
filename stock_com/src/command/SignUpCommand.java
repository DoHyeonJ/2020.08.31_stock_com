package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Member_DAO;

public class SignUpCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		Member_DAO dao = new Member_DAO();
		
		//입력한 값 받아오기
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		
		//parameter 유효성 검증
		if(name != null && id != null && pw != null && email != null && gender != null && birth != null && phone != null 
				&& name.trim().length() > 0 && id.trim().length() > 0 && pw.trim().length() > 0 && email.trim().length() > 0
				&& gender.trim().length() > 0 && birth.trim().length() > 0 && phone.trim().length() > 0) {
			try {
				cnt = dao.insert(name, id, pw, email, gender, birth, phone);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);
	}
	
}