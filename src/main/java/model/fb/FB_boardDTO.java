package model.fb;
import java.util.*;

public class FB_boardDTO {

	private int fb_no;
	private String mem_id;
	private String mem_nick;	
	private String fb_title;
	private String fb_content;
	private String fb_img;
	private String fb_ip;
	private String fb_type;
	private String fb_category;
	
	private Date fb_date;
	private int fb_readcount;
	
	private int fb_like;
	private int fb_cmt_cnt;
	

	private int fb_group; //댓글그룹
	private int fb_step;  //댓글 단 
	private int fb_indent;  //댓글순서 
	
	public FB_boardDTO() {} //생성자

	
	public int getFb_cmt_cnt() {
		return fb_cmt_cnt;
	}
	
	public void setFb_cmt_int(int fb_cmt_cnt) {
		this.fb_cmt_cnt = fb_cmt_cnt;
	}

	public int getFb_no() {
		return fb_no;
	}

	public void setFb_no(int fb_no) {
		this.fb_no = fb_no;
	}

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

	public String getFb_title() {
		return fb_title;
	}

	public void setFb_title(String fb_title) {
		this.fb_title = fb_title;
	}

	public String getFb_content() {
		return fb_content;
	}

	public void setFb_content(String fb_content) {
		this.fb_content = fb_content;
	}

	public String getFb_img() {
		return fb_img;
	}

	public void setFb_img(String fb_img) {
		this.fb_img = fb_img;
	}

	public String getFb_ip() {
		return fb_ip;
	}

	public void setFb_ip(String fb_ip) {
		this.fb_ip = fb_ip;
	}

	public String getFb_type() {
		return fb_type;
	}

	public void setFb_type(String fb_type) {
		this.fb_type = fb_type;
	}

	public String getFb_category() {
		return fb_category;
	}

	public void setFb_category(String fb_category) {
		this.fb_category = fb_category;
	}

	public Date getFb_date() {
		return fb_date;
	}

	public void setFb_date(Date fb_date) {
		this.fb_date = fb_date;
	}

	public int getFb_readcount() {
		return fb_readcount;
	}

	public void setFb_readcount(int fb_readcount) {
		this.fb_readcount = fb_readcount;
	}

	public int getFb_like() {
		return fb_like;
	}

	public void setFb_like(int fb_like) {
		this.fb_like = fb_like;
	}

	public int getFb_group() {
		return fb_group;
	}

	public void setFb_group(int fb_group) {
		this.fb_group = fb_group;
	}

	public int getFb_step() {
		return fb_step;
	}

	public void setFb_step(int fb_step) {
		this.fb_step = fb_step;
	}

	public int getFb_indent() {
		return fb_indent;
	}

	public void setFb_indent(int fb_indent) {
		this.fb_indent = fb_indent;
	}




}//class end 
