package command.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.St_DAO;
import com.lec.beans.St_DTO;

public class ListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		St_DAO dao = new St_DAO();
		St_DTO [] arr = null;
		
		try {
			arr = dao.select();
			request.setAttribute("list", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
