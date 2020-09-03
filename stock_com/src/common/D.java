package common;

public class D {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
		
	//회원가입, 로그인 관련 쿼리문
	public static final String SQL_MEMBER_INSERT =
			"INSERT INTO st_member"
			+"(member_uid, member_name, member_id, member_pw, member_email,"
			+" member_gender, member_birth, member_phone)"
			+"VALUES"
			+"(?, ?, ?, ?, ?, ?, ?, ?)";
	
	//게시글 관련 쿼리문
	public static final String SQL_BORAD_INSERT =
			"INSERT INTO st_board"
			+"(board_uid, board_name, board_title, board_content, board_date, board_viewcnt)"
			+"VALUES"
			+"(?, ?, ?, ?, ?, ?)";
	//댓글 관련 쿼리문
	public static final String SQL_COMMENT_INSERT =
			"INSERT INTO st_comment"
			+"(comment_uid, comment_con_num, comment_name, comment_pw, comment_content, comment_date)"
			+"VALUES"
			+"(?, ?, ?, ?, ?, ?)";

}