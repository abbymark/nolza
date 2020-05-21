package model.book;

import java.util.Date;

public class Book_cmtDto {
	private int cmt_no;
	private int book_no;
	private String mem_id;
	private String mem_nick;
	private String cmt_content;
	private Date cmt_date;
	private String cmt_ip;
	private int cmt_group;
	private int cmt_step;
	private int cmt_indent;
	
	
	public Book_cmtDto() {
		super();
	}


	public int getCmt_no() {
		return cmt_no;
	}


	public void setCmt_no(int cmt_no) {
		this.cmt_no = cmt_no;
	}


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


	public String getCmt_content() {
		return cmt_content;
	}


	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}


	public Date getCmt_date() {
		return cmt_date;
	}


	public void setCmt_date(Date cmt_date) {
		this.cmt_date = cmt_date;
	}


	public String getCmt_ip() {
		return cmt_ip;
	}


	public void setCmt_ip(String cmt_ip) {
		this.cmt_ip = cmt_ip;
	}


	public int getCmt_group() {
		return cmt_group;
	}


	public void setCmt_group(int cmt_group) {
		this.cmt_group = cmt_group;
	}


	public int getCmt_step() {
		return cmt_step;
	}


	public void setCmt_step(int cmt_step) {
		this.cmt_step = cmt_step;
	}


	public int getCmt_indent() {
		return cmt_indent;
	}


	public void setCmt_indent(int cmt_indent) {
		this.cmt_indent = cmt_indent;
	}
	
	
}
