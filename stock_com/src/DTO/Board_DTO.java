package DTO;

public class Board_DTO {

	// board 테이블
	private int board_uid;
	private String board_title;
	private String board_content;
	private String board_date;
	private int board_viewcnt;

	// 기본생성자
	public Board_DTO() {
		super();
		System.out.println("Board_DTO() 객체생성");
	}
	
	// board 생성자
	public Board_DTO (int board_uid, String board_title, String board_content, 
			int board_viewcnt, String board_date) {
		super();
		this.board_uid = board_uid;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_viewcnt = board_viewcnt;
	}		
	
	// getter /setter

	public int getBoard_uid() {
		return board_uid;
	}

	public void setBoard_uid(int board_uid) {
		this.board_uid = board_uid;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_date() {
		return board_date;
	}

	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}

	public int getBoard_viewcnt() {
		return board_viewcnt;
	}

	public void setBoard_viewcnt(int board_viewcnt) {
		this.board_viewcnt = board_viewcnt;
	}
}