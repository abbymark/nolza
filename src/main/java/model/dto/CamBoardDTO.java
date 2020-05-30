package model.dto;

import java.util.*;

public class CamBoardDTO {
	private int cam_no;
	private String cam_id;
	
	private String cam_title;
	
	private Date cam_date;
		
	private int cam_readcount;
	private int cam_like;
	
	private String cam_content;
	private String cam_ip;
	private String cam_type;
			
	private int cam_group; 
	private int cam_step;
	private int cam_indent;
	public int getCam_no() {
		return cam_no;
	}
	public void setCam_no(int cam_no) {
		this.cam_no = cam_no;
	}
	public String getCam_id() {
		return cam_id;
	}
	public void setCam_id(String cam_id) {
		this.cam_id = cam_id;
	}
	
	public String getCam_title() {
		return cam_title;
	}
	public void setCam_title(String cam_title) {
		this.cam_title = cam_title;
	}
	public Date getCam_date() {
		return cam_date;
	}
	public void setCam_date(Date cam_date) {
		this.cam_date = cam_date;
	}
	public int getCam_readcount() {
		return cam_readcount;
	}
	public void setCam_readcount(int cam_readcount) {
		this.cam_readcount = cam_readcount;
	}
	public int getCam_like() {
		return cam_like;
	}
	public void setCam_like(int cam_like) {
		this.cam_like = cam_like;
	}
	public String getCam_content() {
		return cam_content;
	}
	public void setCam_content(String cam_content) {
		this.cam_content = cam_content;
	}
	public String getCam_ip() {
		return cam_ip;
	}
	public void setCam_ip(String cam_ip) {
		this.cam_ip = cam_ip;
	}
	public String getCam_type() {
		return cam_type;
	}
	public void setCam_type(String cam_type) {
		this.cam_type = cam_type;
	}
	public int getCam_group() {
		return cam_group;
	}
	public void setCam_group(int cam_group) {
		this.cam_group = cam_group;
	}
	public int getCam_step() {
		return cam_step;
	}
	public void setCam_step(int cam_step) {
		this.cam_step = cam_step;
	}
	public int getCam_indent() {
		return cam_indent;
	}
	public void setCam_indent(int cam_indent) {
		this.cam_indent = cam_indent;
	}
	
	
	
}
