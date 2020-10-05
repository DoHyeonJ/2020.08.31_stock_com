package DTO;

public class Comment_DTO {

	// comment 테이블
	private int comment_uid;
	private int comment_boardUid;
	private String comment_id;
	private String comment_content;
	private String comment_date;
	
	// 기본생성자
	public Comment_DTO() {
		super();
		System.out.println("Comment_DTO() 객체생성");
	}
	
	// comment 생성자
	public Comment_DTO (int comment_uid, int comment_boardUid,String comment_id,
			String comment_content, String comment_date) {
		super();
		this.comment_uid = comment_uid;
		this.comment_boardUid = comment_boardUid;
		this.comment_id = comment_id;
		this.comment_content = comment_content;
		this.comment_date = comment_date;
	}

	public int getComment_uid() {
		return comment_uid;
	}

	public void setComment_uid(int comment_uid) {
		this.comment_uid = comment_uid;
	}

	public int getComment_boardUid() {
		return comment_boardUid;
	}

	public void setComment_boardUid(int comment_boardUid) {
		this.comment_boardUid = comment_boardUid;
	}

	public String getComment_id() {
		return comment_id;
	}

	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public String getComment_date() {
		return comment_date;
	}

	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
}