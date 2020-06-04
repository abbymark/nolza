package model.matzip;

import java.util.Date;

public class BreadDto {

	private String bread_name;
	private String bread_menu;
	private String bread_loc;
	private String bread_tel;

	
	private String mem_id;
	private String mem_grade;
	private String mem_nick;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_grade() {
		return mem_grade;
	}
	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
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
	public String getBread_menu() {
		return bread_menu;
	}
	public void setBread_menu(String bread_menu) {
		this.bread_menu = bread_menu;
	}
	public String getBread_loc() {
		return bread_loc;
	}
	public void setBread_loc(String bread_loc) {
		this.bread_loc = bread_loc;
	}
	
	public String getBread_tel() {
		return bread_tel;
	}
	public void setBread_tel(String bread_tel) {
		this.bread_tel = bread_tel;
	}
	
	@Override
	public String toString() {
		return "BreadDto [bread_name=" + bread_name + ", bread_menu=" + bread_menu + ", bread_loc=" + bread_loc
				+ ", bread_tel=" + bread_tel + ", mem_id=" + mem_id + ", mem_grade=" + mem_grade + ", mem_nick="
				+ mem_nick + ", getMem_id()=" + getMem_id() + ", getMem_grade()=" + getMem_grade() + ", getMem_nick()="
				+ getMem_nick() + ", getBread_name()=" + getBread_name() + ", getBread_menu()=" + getBread_menu()
				+ ", getBread_loc()=" + getBread_loc() + ", getBread_tel()=" + getBread_tel() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	

	
}
