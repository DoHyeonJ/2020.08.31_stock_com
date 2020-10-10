package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Comment_DAO;

public class CommentDeleteCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		Comment_DAO dao = new Comment_DAO();
		
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