package model.dto;

import java.util.*;

public class CaminfoDTO {
	private int caminfo_no;
	private String caminfo_id;
	private String mem_nick;
	private String mem_id;
	private String caminfo_title;
	
	private Date caminfo_date;
		
	private int caminfo_readcount;
	private int caminfo_like;
	
	private String caminfo_content;
	private String caminfo_ip;
	private String caminfo_type;
			
	private int caminfo_group; 
	private int caminfo_step;
	private int caminfo_indent;
	public int getCaminfo_no() {
		return caminfo_no;
	}
	
	
	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public void setCaminfo_no(int caminfo_no) {
		this.caminfo_no = caminfo_no;
	}
	public String getCaminfo_id() {
		return caminfo_id;
	}
	public void setCaminfo_id(String caminfo_id) {
		this.caminfo_id = caminfo_id;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getCaminfo_title() {
		return caminfo_title;
	}
	public void setCaminfo_title(String caminfo_title) {
		this.caminfo_title = caminfo_title;
	}
	public Date getCaminfo_date() {
		return caminfo_date;
	}
	public void setCaminfo_date(Date caminfo_date) {
		this.caminfo_date = caminfo_date;
	}
	public int getCaminfo_readcount() {
		return caminfo_readcount;
	}
	public void setCaminfo_readcount(int caminfo_readcount) {
		this.caminfo_readcount = caminfo_readcount;
	}
	public int getCaminfo_like() {
		return caminfo_like;
	}
	public void setCaminfo_like(int caminfo_like) {
		this.caminfo_like = caminfo_like;
	}
	public String getCaminfo_content() {
		return caminfo_content;
	}
	public void setCaminfo_content(String caminfo_content) {
		this.caminfo_content = caminfo_content;
	}
	public String getCaminfo_ip() {
		return caminfo_ip;
	}
	public void setCaminfo_ip(String caminfo_ip) {
		this.caminfo_ip = caminfo_ip;
	}
	public String getCaminfo_type() {
		return caminfo_type;
	}
	public void setCaminfo_type(String caminfo_type) {
		this.caminfo_type = caminfo_type;
	}
	public int getCaminfo_group() {
		return caminfo_group;
	}
	public void setCaminfo_group(int caminfo_group) {
		this.caminfo_group = caminfo_group;
	}
	public int getCaminfo_step() {
		return caminfo_step;
	}
	public void setCaminfo_step(int caminfo_step) {
		this.caminfo_step = caminfo_step;
	}
	public int getCaminfo_indent() {
		return caminfo_indent;
	}
	public void setCaminfo_indent(int caminfo_indent) {
		this.caminfo_indent = caminfo_indent;
	}
	
	
}
