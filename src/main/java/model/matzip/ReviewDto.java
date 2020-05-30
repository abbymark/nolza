package model.matzip;

import java.util.Date;

public class ReviewDto {

	private String bread_name; 
	private int rev_score; 
	private int rev_like; 
	private int rev_star; 
	
	private Date rev_date; 
	private String rev_content;
	
	private int rev_no; 
	
	private String mem_id;
	private String mem_nick;
	
	

	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getBread_name() {
		return bread_name;
	}
	public void setBread_name(String bread_name) {
		this.bread_name = bread_name;
	}
	public int getRev_score() {
		return rev_score;
	}
	public void setRev_score(int rev_score) {
		this.rev_score = rev_score;
	}
	public int getRev_like() {
		return rev_like;
	}
	public void setRev_like(int rev_like) {
		this.rev_like = rev_like;
	}
	public int getRev_star() {
		return rev_star;
	}
	public void setRev_star(int rev_star) {
		this.rev_star = rev_star;
	}
	public Date getRev_date() {
		return rev_date;
	}
	public void setRev_date(Date rev_date) {
		this.rev_date = rev_date;
	}
	public String getRev_content() {
		return rev_content;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	
	public int getRev_no() {
		return rev_no;
	}
	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}
	
	
	@Override
	public String toString() {
		return "ReviewDto [bread_name=" + bread_name + ", rev_score=" + rev_score + ", rev_like=" + rev_like
				+ ", rev_star=" + rev_star + ", rev_date=" + rev_date + ", rev_content=" + rev_content + ", rev_no="
				+ rev_no + ", mem_id=" + mem_id + ", mem_nick=" + mem_nick + ", getMem_id()=" + getMem_id()
				+ ", getMem_nick()=" + getMem_nick() + ", getBread_name()=" + getBread_name() + ", getRev_score()="
				+ getRev_score() + ", getRev_like()=" + getRev_like() + ", getRev_star()=" + getRev_star()
				+ ", getRev_date()=" + getRev_date() + ", getRev_content()=" + getRev_content() + ", getRev_no()="
				+ getRev_no() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
	
	
}




