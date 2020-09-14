package com.lec.beans;

public class St_DTO {

	// member 테이블
	private int member_uid;
	private String member_name;
	private String member_id;
	private String member_pw;
	private String member_email;
	private String member_gender;
	private String member_birth;
	private String member_phone;

	// borad 테이블
	private int borad_uid;
	private String borad_name;
	private String borad_title;
	private String borad_content;
	private String borad_date;
	private int borad_viewcnt;

	// comment 테이블
	private int comment_uid;
	private int comment_con_num;
	private String comment_name;
	private String comment_pw;
	private String comment_content;
	private String comment_date;

	// 기본생성자
	public St_DTO() {
		super();
		System.out.println("St_DTO() 객체생성");
	}
	
	// member 생성자 (매개변수 받는 생성자)
	public St_DTO (int member_uid, String member_name, String member_id, String member_pw, 
			String member_email, String member_gender, String member_birth, String member_phone){
		super();
		this.member_uid = member_uid;
		this.member_name = member_name;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_email = member_email;
		this.member_gender = member_gender;
		this.member_birth = member_birth;
		this.member_phone = member_phone;
	}
	// borad 생성자
	public St_DTO (int borad_uid, String borad_name, String borad_title, String borad_content, 
			String borad_date, int borad_viewcnt) {
		super();
		this.borad_uid = borad_uid;
		this.borad_name = borad_name;
		this.borad_title = borad_title;
		this.borad_content = borad_content;
		this.borad_date = borad_date;
		this.borad_viewcnt = borad_viewcnt;
	}
	
	// comment 생성자
	public St_DTO (int comment_uid, int comment_con_num,String comment_name, String comment_pw, 
			String comment_content, String comment_date) {
		super();
		this.comment_uid = comment_uid;
		this.comment_con_num = comment_con_num;
		this.comment_name = comment_name;
		this.comment_pw = comment_pw;
		this.comment_content = comment_content;
		this.comment_date = comment_date;
	}
	
	
	// getter /setter
	public int getMember_uid() {
		return member_uid;
	}

	public void setMember_uid(int member_uid) {
		this.member_uid = member_uid;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public int getBorad_uid() {
		return borad_uid;
	}

	public void setBorad_uid(int borad_uid) {
		this.borad_uid = borad_uid;
	}

	public String getBorad_name() {
		return borad_name;
	}

	public void setBorad_name(String borad_name) {
		this.borad_name = borad_name;
	}

	public String getBorad_title() {
		return borad_title;
	}

	public void setBorad_title(String borad_title) {
		this.borad_title = borad_title;
	}

	public String getBorad_content() {
		return borad_content;
	}

	public void setBorad_content(String borad_content) {
		this.borad_content = borad_content;
	}

	public String getBorad_date() {
		return borad_date;
	}

	public void setBorad_date(String borad_date) {
		this.borad_date = borad_date;
	}

	public int getBorad_viewcnt() {
		return borad_viewcnt;
	}

	public void setBorad_viewcnt(int borad_viewcnt) {
		this.borad_viewcnt = borad_viewcnt;
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
