package model.song;
import java.util.*;
public class Song_boardDTO {
	
	private int no;
	private String mem_id;
	private String title;
	private String content;
	private String s_type;
	private String ip;
	
	private Date date;
	
	private int readcount;
	private int s_like;
	private int s_group;
	private int s_step;
	private int s_indent;
		
	public Song_boardDTO() {}//����Ʈ ������

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getS_type() {
		return s_type;
	}

	public void setS_type(String s_type) {
		this.s_type = s_type;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getS_like() {
		return s_like;
	}

	public void setS_like(int s_like) {
		this.s_like = s_like;
	}

	public int getS_group() {
		return s_group;
	}

	public void setS_group(int s_group) {
		this.s_group = s_group;
	}

	public int getS_step() {
		return s_step;
	}

	public void setS_step(int s_step) {
		this.s_step = s_step;
	}

	public int getS_indent() {
		return s_indent;
	}

	public void setS_indent(int s_indent) {
		this.s_indent = s_indent;
	}

}//class end
