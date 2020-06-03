package model.song;
import java.util.Date;
public class Song_albumDTO {
	
	private int a_no;
	private String mem_id;
	private String a_picture;
	private String a_title;
	private String a_artist;
	private String a_style;
	private String a_sales;
	private String a_manage;
	private String a_main;
	private String a_content;
	private String a_date;
	
	private Date date;
	
	private int a_readcount;
			
	public Song_albumDTO() {}//����Ʈ ������

	public int getA_no() {
		return a_no;
	}

	public void setA_no(int a_no) {
		this.a_no = a_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getA_picture() {
		return a_picture;
	}

	public void setA_picture(String a_picture) {
		this.a_picture = a_picture;
	}

	public String getA_title() {
		return a_title;
	}

	public void setA_title(String a_title) {
		this.a_title = a_title;
	}

	public String getA_artist() {
		return a_artist;
	}

	public void setA_artist(String a_artist) {
		this.a_artist = a_artist;
	}

	public String getA_style() {
		return a_style;
	}

	public void setA_style(String a_style) {
		this.a_style = a_style;
	}

	public String getA_sales() {
		return a_sales;
	}

	public void setA_sales(String a_sales) {
		this.a_sales = a_sales;
	}

	public String getA_manage() {
		return a_manage;
	}

	public void setA_manage(String a_manage) {
		this.a_manage = a_manage;
	}

	public String getA_main() {
		return a_main;
	}

	public void setA_main(String a_main) {
		this.a_main = a_main;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	public String getA_date() {
		return a_date;
	}

	public void setA_date(String a_date) {
		this.a_date = a_date;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getA_readcount() {
		return a_readcount;
	}

	public void setA_readcount(int a_readcount) {
		this.a_readcount = a_readcount;
	}


}//class end
