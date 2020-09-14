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
	//게시글 선택
	public static final String SQL_BORAD_SELECT_BY_UID =
			"SELECT * FROM st_board WHERE board_uid = ?";
	//게시글 조회수
	public static final String SQL_BORAD_VIEWCNT =
			"UPDATE st_board SET board_viewcnt = board_viewcnt + 1 WHERE borad_uid = ?";
	//게시물 교유번호 내림차순. (선택) ASC(오름차순), DESC(내림차순)
	public static final String SQL_BORAD_SELECT =
			"SELECT * FROM st_board ORDER BY board_uid DESC"; 
	//게시글 삭제
	public static final String SQL_BORAD_DELETE_BY_UID =
			"DELETE FROM st_board WHERE board_uid = ?";
	//게시글 수정
	public static final String SQL_BORAD_UPDATE =
			"UPDATE st_borad SET borad_title = ?, borad_content = ? WHERE borad_uid = ?";
}