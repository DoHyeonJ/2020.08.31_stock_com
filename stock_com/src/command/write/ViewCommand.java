package command.write;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.*;

public class ViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		St_DAO dao = new St_DAO();
		St_DTO [] arr = null;
		//매개변수 검증필요
		int uid = Integer.parseInt(request.getParameter("uid")); 
		
		try {
			//읽기 + 조회수 증가
			arr = dao.readByUid(uid); 
			request.setAttribute("list", arr);
			// 만약 ConnectionPool 을 사용한다면 여기서 NamingException 도 catch 해야 한다. 
		} catch (Exception e) {  
			e.printStackTrace();
		}
	}

		
}
