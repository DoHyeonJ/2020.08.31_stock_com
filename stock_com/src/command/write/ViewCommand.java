package command.write;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.*;

public class ViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		St_DAO dao = new St_DAO();
		St_DTO [] arr = null;
		//�Ű����� �����ʿ�
		int uid = Integer.parseInt(request.getParameter("uid")); 
		
		try {
			//�б� + ��ȸ�� ����
			arr = dao.readByUid(uid); 
			request.setAttribute("list", arr);
			// ���� ConnectionPool �� ����Ѵٸ� ���⼭ NamingException �� catch �ؾ� �Ѵ�. 
		} catch (Exception e) {  
			e.printStackTrace();
		}
	}

		
}
