package model.song;
import java.util.Date;
public class Song_noticeDTO {
	
	private int n_no;
	private String mem_id;
	private String n_title;
	private String n_content;
	private String n_type;
	
	private Date n_date;
	
	private int n_readcount;
			
	public Song_noticeDTO() {}//����Ʈ ������

	public int getN_no() {
		return n_no;
	}

	public void setN_no(int n_no) {
		this.n_no = n_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getN_type() {
		return n_type;
	}

	public void setN_type(String n_type) {
		this.n_type = n_type;
	}

	public Date getN_date() {
		return n_date;
	}

	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}

	public int getN_readcount() {
		return n_readcount;
	}

	public void setN_readcount(int n_readcount) {
		this.n_readcount = n_readcount;
	}

}//class end
