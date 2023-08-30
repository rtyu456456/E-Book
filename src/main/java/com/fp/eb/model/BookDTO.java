package com.fp.eb.model;


public class BookDTO {
	private int b_no;
	private String b_title;
	private String b_contents;
	private String b_url;
	private String b_isbn;
	private String b_authors;
	private String b_publisher;
	private int b_page;
	private int b_price;
	private String b_thumbnail;
	private int positive_percentage;
	
	private int bookmarkCheck;

	
	public int getBookmarkCheck() {
		return bookmarkCheck;
	}

	public void setBookmarkCheck(int bookmarkCheck) {
		this.bookmarkCheck = bookmarkCheck;
	}

	public BookDTO() {
		// TODO Auto-generated constructor stub
	}

	public BookDTO(int b_no, String b_title, String b_contents, String b_url, String b_isbn, String b_authors,
			String b_publisher, int b_page, int b_price, String b_thumbnail, int positive_percentage) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_contents = b_contents;
		this.b_url = b_url;
		this.b_isbn = b_isbn;
		this.b_authors = b_authors;
		this.b_publisher = b_publisher;
		this.b_page = b_page;
		this.b_price = b_price;
		this.b_thumbnail = b_thumbnail;
		this.positive_percentage = positive_percentage;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_contents() {
		return b_contents;
	}

	public void setB_contents(String b_contents) {
		this.b_contents = b_contents;
	}

	public String getB_url() {
		return b_url;
	}

	public void setB_url(String b_url) {
		this.b_url = b_url;
	}

	public String getB_isbn() {
		return b_isbn;
	}

	public void setB_isbn(String b_isbn) {
		this.b_isbn = b_isbn;
	}

	public String getB_authors() {
		return b_authors;
	}

	public void setB_authors(String b_authors) {
		this.b_authors = b_authors;
	}

	public String getB_publisher() {
		return b_publisher;
	}

	public void setB_publisher(String b_publisher) {
		this.b_publisher = b_publisher;
	}

	public int getB_page() {
		return b_page;
	}

	public void setB_page(int b_page) {
		this.b_page = b_page;
	}

	public int getB_price() {
		return b_price;
	}

	public void setB_price(int b_price) {
		this.b_price = b_price;
	}

	public String getB_thumbnail() {
		return b_thumbnail;
	}

	public void setB_thumbnail(String b_thumbnail) {
		this.b_thumbnail = b_thumbnail;
	}

	public int getPositive_percentage() {
		return positive_percentage;
	}

	public void setPositive_percentage(int positive_percentage) {
		this.positive_percentage = positive_percentage;
	}

	@Override
	public String toString() {
		return "BookDTO [b_no=" + b_no + ", b_title=" + b_title + ", b_contents=" + b_contents + ", b_url=" + b_url
				+ ", b_isbn=" + b_isbn + ", b_authors=" + b_authors + ", b_publisher=" + b_publisher + ", b_page="
				+ b_page + ", b_price=" + b_price + ", b_thumbnail=" + b_thumbnail + ", positive_percentage="
				+ positive_percentage + "]";
	}
	
	
	
	
}
