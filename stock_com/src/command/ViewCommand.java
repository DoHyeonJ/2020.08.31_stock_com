package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.*;
import DTO.Board_DTO;
import DTO.Comment_DTO;

public class ViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Board_DAO dao = new Board_DAO();
		Board_DTO [] arr = null;
		Comment_DAO comDao = new Comment_DAO();
		Comment_DTO [] comArr = null;
		
		//매개변수 검증필요
		int uid = Integer.parseInt(request.getParameter("uid")); 
		
		try {
			//읽기 + 조회수 증가
			arr = dao.readByUid(uid); 
			request.setAttribute("list", arr);
			//댓글 읽기
			comArr = comDao.readByUid(uid);
			request.setAttribute("comList", comArr);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

		
}
