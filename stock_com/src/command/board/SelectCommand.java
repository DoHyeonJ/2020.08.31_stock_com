package command.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.Board_DAO;
import com.lec.beans.Board_DTO;

public class SelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Board_DAO dao = new Board_DAO();
		Board_DTO [] arr = null;		
		//매개변수 검증 필요
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		try {
			// 읽기 only 
			arr = dao.selectByuid(uid);
			request.setAttribute("list", arr);
			//만약 ConnectionPool 을 사용한다면 여기서 NamingException 도 catch 해야 한다
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} // end execute()
} // end Command