package model.matzip;

import java.util.Date;

public class BreadDto {

	private String bread_name;
	private String bread_menu;
	private String bread_loc;
	private String bread_tel;
	
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
				+ ", bread_tel=" + bread_tel + "]";
	}
	
	
	
}
