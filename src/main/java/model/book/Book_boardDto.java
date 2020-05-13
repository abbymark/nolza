package model.book;

import java.util.Date;

public class Book_boardDto {
	private int book_no;
	private String book_id;
	private String book_title;
	private Date book_date;
	private int book_readcount;
	private int book_group;
	private int book_step;
	private int book_indent;
	private String book_content;
	private String book_ip;
	private int book_like;
	private String book_type;
	
	public Book_boardDto() {}

	public int getBook_no() {
		return book_no;
	}

	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}

	public String getBook_id() {
		return book_id;
	}

	public void setBook_id(String book_id) {
		this.book_id = book_id;
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

	public String getBook_type() {
		return book_type;
	}

	public void setBook_type(String book_type) {
		this.book_type = book_type;
	}
	
	
}
