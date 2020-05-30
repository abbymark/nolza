package model.dto;

public class MemberDto {
	private String mem_id;
	private String mem_pw;
	private String mem_nick;
		
	private String mem_email;
	private String mem_login_state;
	private String mem_grade;
	private int mem_article_cnt;
	private int mem_reply_cnt;
	private int mem_login_cnt;
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_login_state() {
		return mem_login_state;
	}
	public void setMem_login_state(String mem_login_state) {
		this.mem_login_state = mem_login_state;
	}
	public String getMem_grade() {
		return mem_grade;
	}
	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
	}
	public int getMem_article_cnt() {
		return mem_article_cnt;
	}
	public void setMem_article_cnt(int mem_article_cnt) {
		this.mem_article_cnt = mem_article_cnt;
	}
	public int getMem_reply_cnt() {
		return mem_reply_cnt;
	}
	public void setMem_reply_cnt(int mem_reply_cnt) {
		this.mem_reply_cnt = mem_reply_cnt;
	}
	public int getMem_login_cnt() {
		return mem_login_cnt;
	}
	public void setMem_login_cnt(int mem_login_cnt) {
		this.mem_login_cnt = mem_login_cnt;
	}
	

}//class end
