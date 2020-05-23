package model.book;

import java.util.Date;

public class Book_boardDto {
	private int book_no;
	private String mem_id;
	private String mem_nick;
	private String book_title;
	private Date book_date;
	private int book_readcount;
	private int book_group;
	private int book_step;
	private int book_indent;
	private String book_content;
	private String book_ip;
	private int book_like;
	private int book_like_cnt;
	private int book_dislike_cnt;
	private String book_type;
	private int book_cmt_cnt;
	
	public Book_boardDto() {}

	public int getBook_no() {
		return book_no;
	}

	public void setBook_no(int book_no) {
		this.book_no = book_no;
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

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public Date getBook_date() {
		return book_date;
	}

	public void setBook_date(Date book_date) {
		this.book_date = book_date;
	}

	public int getBook_readcount() {
		return book_readcount;
	}

	public void setBook_readcount(int book_readcount) {
		this.book_readcount = book_readcount;
	}

	public int getBook_group() {
		return book_group;
	}

	public void setBook_group(int book_group) {
		this.book_group = book_group;
	}

	public int getBook_step() {
		return book_step;
	}

	public void setBook_step(int book_step) {
		this.book_step = book_step;
	}

	public int getBook_indent() {
		return book_indent;
	}

	public void setBook_indent(int book_indent) {
		this.book_indent = book_indent;
	}

	public String getBook_content() {
		return book_content;
	}

	public void setBook_content(String book_content) {
		this.book_content = book_content;
	}

	public String getBook_ip() {
		return book_ip;
	}

	public void setBook_ip(String book_ip) {
		this.book_ip = book_ip;
	}

	public int getBook_like() {
		return book_like;
	}

	public void setBook_like(int book_like) {
		this.book_like = book_like;
	}

	public int getBook_like_cnt() {
		return book_like_cnt;
	}

	public void setBook_like_cnt(int book_like_cnt) {
		this.book_like_cnt = book_like_cnt;
	}

	public int getBook_dislike_cnt() {
		return book_dislike_cnt;
	}

	public void setBook_dislike_cnt(int book_dislike_cnt) {
		this.book_dislike_cnt = book_dislike_cnt;
	}

	public String getBook_type() {
		return book_type;
	}

	public void setBook_type(String book_type) {
		this.book_type = book_type;
	}

	public int getBook_cmt_cnt() {
		return book_cmt_cnt;
	}

	public void setBook_cmt_cnt(int book_cmt_cnt) {
		this.book_cmt_cnt = book_cmt_cnt;
	}

	
}
