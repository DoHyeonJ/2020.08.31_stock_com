package command.write;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Command ���������� : ��ü�� Ư�� ����� �ٷ� �����ϰų� ���߿� Ʈ���� �Ҷ�, �ʿ��� ��� ������ ĸ��ȭ�ϴ� �ൿ ����
public interface Command {
	void execute(HttpServletRequest request, HttpServletResponse response);
}