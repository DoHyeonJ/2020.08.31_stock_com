package DTO;

public class Comment_DTO {

	// comment 테이블
	private int comment_uid;
	private int comment_con_num;
	private String comment_name;
	private String comment_pw;
	private String comment_content;
	private String comment_date;
	
	// 기본생성자
	public Comment_DTO() {
		super();
		System.out.println("Comment_DTO() 객체생성");
	}
	
	// comment 생성자
	public Comment_DTO (int comment_uid, int comment_con_num,String comment_name, String comment_pw, 
			String comment_content, String comment_date) {
		super();
		this.comment_uid = comment_uid;
		this.comment_con_num = comment_con_num;
		this.comment_name = comment_name;
		this.comment_pw = comment_pw;
		this.comment_content = comment_content;
		this.comment_date = comment_date;
	}

	public int getComment_uid() {
		return comment_uid;
	}

	public void setComment_uid(int comment_uid) {
		this.comment_uid = comment_uid;
	}

	public int getComment_con_num() {
		return comment_con_num;
	}

	public void setComment_con_num(int comment_con_num) {
		this.comment_con_num = comment_con_num;
	}

	public String getComment_name() {
		return comment_name;
	}

	public void setComment_name(String comment_name) {
		this.comment_name = comment_name;
	}

	public String getComment_pw() {
		return comment_pw;
	}

	public void setComment_pw(String comment_pw) {
		this.comment_pw = comment_pw;
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