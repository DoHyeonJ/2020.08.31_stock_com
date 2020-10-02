package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import command.DeleteCommand;
import command.ListCommand;
import command.SelectCommand;
import command.SignUpCommand;
import command.UpdateCommand;
import command.ViewCommand;
import command.WriteCommand;


@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Controller() {
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
			
		case "/boardWrite.do":
			viewPage = "boardWrite.jsp";
			break;

		case "/boardWriteOk.do":
			command = new WriteCommand();
			command.execute(request, response);
			viewPage = "boardWriteOk.jsp";
			break;
			
		case "/boardView.do":
			command = new ViewCommand();
			command.execute(request, response);
			viewPage = "boardView.jsp";
			break;
			
		case "/boardUpdate.do":
			command = new SelectCommand();
			command.execute(request, response);
			viewPage = "boardUpdate.jsp";
			break;
			
		case "/boardUpdateOk.do":
			command = new UpdateCommand();
			command.execute(request, response);
			viewPage = "boardUpdateOk.jsp";
			break;
			
		case "/boardDeleteOk.do":
			command = new DeleteCommand();
			command.execute(request, response);
			viewPage = "boardDeleteOk.jsp";
			break;
			
		case "/memberSignUp.do":
			viewPage = "memberSignUp.jsp";
			break;
			
		case "/memberSignOk.do":
			command = new SignUpCommand();
			command.execute(request, response);
			viewPage = "memberSignOk.jsp";
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
