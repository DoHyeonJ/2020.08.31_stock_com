package command.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Command 디자인패턴 : 객체가 특정 기능을 바로 수정하거나 나중에 트리거 할때, 필요한 모든 정보를 캡슐화하는 행동 패턴
public interface Command {
	void execute(HttpServletRequest request, HttpServletResponse response);
}