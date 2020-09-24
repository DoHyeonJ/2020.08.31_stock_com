package DTO;

public class Member_DTO {

	// member 테이블
	private int member_uid;
	private String member_name;
	private String member_id;
	private String member_pw;
	private String member_email;
	private String member_gender;
	private String member_birth;
	private String member_phone;
	
	// 기본생성자
	public Member_DTO() {
		super();
		System.out.println("Member_DTO() 객체생성");
	}

	// member 생성자 (매개변수 받는 생성자)
	public Member_DTO (int member_uid, String member_name, String member_id, String member_pw, 
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
}

