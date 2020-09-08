package command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.*;

public class ViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		St_DAO dao = new St_DAO();
		St_DTO [] arr = null;
		int uid = Integer.parseInt(request.getParameter("uid"));  // �Ű����� ���� �ʿ�
		
		try {
			arr = dao.readByUid(uid);  // �б� + ��ȸ�� ����
			request.setAttribute("list", arr);
		} catch (SQLException e) { // ���� ConnectionPool �� ����Ѵٸ� ���⼭ NamingException �� catch �ؾ� �Ѵ�  
			e.printStackTrace();
		}
	} //end execute()
} // end Command
