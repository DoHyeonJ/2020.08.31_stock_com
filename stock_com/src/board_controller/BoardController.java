package board_controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.board.Command;
import command.board.ListCommand;
import command.board.WriteCommand;

@WebServlet("*.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void actionDo (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo()호출");
		
		request.setCharacterEncoding("UTF-8");
		
		Command command = null; // 어떠한 커맨드 수행할지
		String viewPage = null; // 어떠한 페이지를 열것인지 (view)
		
		//URL 로부터 URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		//테스트 출력
		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com);
		
		// 1.커맨드 객체 수행
		switch (com) {
		case "/boardList.do":
			command = new ListCommand();
			command.execute(request, response);
			viewPage = "WEB-INF/boardList.jsp";
			break;
			
		case "/board_write.do":
			viewPage = "board_write.jsp";
			break;

		case "/boardOk.do":
			command = new WriteCommand();
			command.execute(request, response);
			viewPage = "boardOk.jsp";
			break;
		}
		
		// 2.View(*.jsp) 선택
		
		// 위에서 결정된  view 에 forward 해줌
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
