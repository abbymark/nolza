package model.fb;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class FM_boardDTO {
	
	private int fm_no;
	private String mem_id;
	private String mem_nick;	
	private String fm_detail;
	private String fm_img;
	private String fm_ip;
	private String fm_type;
	private String fm_category;
	private String fm_time;
	private String fm_place;
	private String fm_teamhome;
	private String fm_teamaway;
	private String fm_winner;

	private String fm_location;
	private String fm_score;
	private String fm_mdate;
	
	private Date fm_date;
	private int fm_readcount;
	
	private int fm_cmt_cnt;

	private int fm_group; //답글그룹
	private int fm_step;  //글순서
	private int fm_indent;  //글깊이 

	public FM_boardDTO() {}

	public String getFm_winner() {
		return fm_winner;
	}
	
	public void setFm_winner(String fm_winner) {
		this.fm_winner = fm_winner;
	}

	public int getFm_cmt_cnt() {
		return fm_cmt_cnt;
	}
	
	public void setFm_cmt_cnt(int fm_cmt_cnt) {
		this.fm_cmt_cnt = fm_cmt_cnt;
	}
	

	public int getFm_no() {
		return fm_no;
	}

	public void setFm_no(int fm_no) {
		this.fm_no = fm_no;
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

	public String getFm_detail() {
		return fm_detail;
	}

	public void setFm_detail(String fm_detail) {
		this.fm_detail = fm_detail;
	}

	public String getFm_img() {
		return fm_img;
	}

	public void setFm_img(String fm_img) {
		this.fm_img = fm_img;
	}

	public String getFm_ip() {
		return fm_ip;
	}

	public void setFm_ip(String fm_ip) {
		this.fm_ip = fm_ip;
	}

	public String getFm_type() {
		return fm_type;
	}

	public void setFm_type(String fm_type) {
		this.fm_type = fm_type;
	}

	public String getFm_category() {
		return fm_category;
	}

	public void setFm_category(String fm_category) {
		this.fm_category = fm_category;
	}

	public String getFm_time() {
		return fm_time;
	}

	public void setFm_time(String fm_time) {
		this.fm_time = fm_time;
	}

	public String getFm_place() {
		return fm_place;
	}

	public void setFm_place(String fm_place) {
		this.fm_place = fm_place;
	}

	public String getFm_teamhome() {
		return fm_teamhome;
	}

	public void setFm_teamhome(String fm_teamhome) {
		this.fm_teamhome = fm_teamhome;
	}

	public String getFm_teamaway() {
		return fm_teamaway;
	}

	public void setFm_teamaway(String fm_teamaway) {
		this.fm_teamaway = fm_teamaway;
	}

	public String getFm_location() {
		return fm_location;
	}

	public void setFm_location(String fm_location) {
		this.fm_location = fm_location;
	}

	public String getFm_score() {
		return fm_score;
	}

	public void setFm_score(String fm_score) {
		this.fm_score = fm_score;
	}

	public String getFm_mdate() {
		return fm_mdate;
	}

	public void setFm_mdate(String fm_mdate) {
		this.fm_mdate = fm_mdate;
	}

	public Date getFm_date() {
		return fm_date;
	}

	public void setFm_date(Date fm_date) {
		this.fm_date = fm_date;
	}

	public int getFm_readcount() {
		return fm_readcount;
	}

	public void setFm_readcount(int fm_readcount) {
		this.fm_readcount = fm_readcount;
	}

	public int getFm_group() {
		return fm_group;
	}

	public void setFm_group(int fm_group) {
		this.fm_group = fm_group;
	}

	public int getFm_step() {
		return fm_step;
	}

	public void setFm_step(int fm_step) {
		this.fm_step = fm_step;
	}

	public int getFm_indent() {
		return fm_indent;
	}

	public void setFm_indent(int fm_indent) {
		this.fm_indent = fm_indent;
	}

}
