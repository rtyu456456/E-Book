package com.fp.eb.model;

import java.util.Date;

public class TradeDTO {
	
	private int t_no;
	private String t_owver;
	private String t_title;
	private String t_book_title;
	private String t_authors;
	private String t_publisher;
	private String t_contents;
	private int t_price;
	private String t_thumbnail;
	private int t_map_lat;
	private int t_map_lng;
	private int t_marker_lat;
	private int t_marker_lng;
	private int t_soldout;
	private Date t_date;
	
	public TradeDTO() {
		// TODO Auto-generated constructor stub
	}

	public TradeDTO(int t_no, String t_owver, String t_title, String t_book_title, String t_authors, String t_publisher,
			String t_contents, int t_price, String t_thumbnail, int t_map_lat, int t_map_lng, int t_marker_lat,
			int t_marker_lng, int t_soldout, Date t_date) {
		super();
		this.t_no = t_no;
		this.t_owver = t_owver;
		this.t_title = t_title;
		this.t_book_title = t_book_title;
		this.t_authors = t_authors;
		this.t_publisher = t_publisher;
		this.t_contents = t_contents;
		this.t_price = t_price;
		this.t_thumbnail = t_thumbnail;
		this.t_map_lat = t_map_lat;
		this.t_map_lng = t_map_lng;
		this.t_marker_lat = t_marker_lat;
		this.t_marker_lng = t_marker_lng;
		this.t_soldout = t_soldout;
		this.t_date = t_date;
	}

	public int getT_no() {
		return t_no;
	}

	public void setT_no(int t_no) {
		this.t_no = t_no;
	}

	public String getT_owver() {
		return t_owver;
	}

	public void setT_owver(String t_owver) {
		this.t_owver = t_owver;
	}

	public String getT_title() {
		return t_title;
	}

	public void setT_title(String t_title) {
		this.t_title = t_title;
	}

	public String getT_book_title() {
		return t_book_title;
	}

	public void setT_book_title(String t_book_title) {
		this.t_book_title = t_book_title;
	}

	public String getT_authors() {
		return t_authors;
	}

	public void setT_authors(String t_authors) {
		this.t_authors = t_authors;
	}

	public String getT_publisher() {
		return t_publisher;
	}

	public void setT_publisher(String t_publisher) {
		this.t_publisher = t_publisher;
	}

	public String getT_contents() {
		return t_contents;
	}

	public void setT_contents(String t_contents) {
		this.t_contents = t_contents;
	}

	public int getT_price() {
		return t_price;
	}

	public void setT_price(int t_price) {
		this.t_price = t_price;
	}

	public String getT_thumbnail() {
		return t_thumbnail;
	}

	public void setT_thumbnail(String t_thumbnail) {
		this.t_thumbnail = t_thumbnail;
	}

	public int getT_map_lat() {
		return t_map_lat;
	}

	public void setT_map_lat(int t_map_lat) {
		this.t_map_lat = t_map_lat;
	}

	public int getT_map_lng() {
		return t_map_lng;
	}

	public void setT_map_lng(int t_map_lng) {
		this.t_map_lng = t_map_lng;
	}

	public int getT_marker_lat() {
		return t_marker_lat;
	}

	public void setT_marker_lat(int t_marker_lat) {
		this.t_marker_lat = t_marker_lat;
	}

	public int getT_marker_lng() {
		return t_marker_lng;
	}

	public void setT_marker_lng(int t_marker_lng) {
		this.t_marker_lng = t_marker_lng;
	}

	public int getT_soldout() {
		return t_soldout;
	}

	public void setT_soldout(int t_soldout) {
		this.t_soldout = t_soldout;
	}

	public Date getT_date() {
		return t_date;
	}

	public void setT_date(Date t_date) {
		this.t_date = t_date;
	}

	@Override
	public String toString() {
		return "TradeDTO [t_no=" + t_no + ", t_owver=" + t_owver + ", t_title=" + t_title + ", t_book_title="
				+ t_book_title + ", t_authors=" + t_authors + ", t_publisher=" + t_publisher + ", t_contents="
				+ t_contents + ", t_price=" + t_price + ", t_thumbnail=" + t_thumbnail + ", t_map_lat=" + t_map_lat
				+ ", t_map_lng=" + t_map_lng + ", t_marker_lat=" + t_marker_lat + ", t_marker_lng=" + t_marker_lng
				+ ", t_soldout=" + t_soldout + ", t_date=" + t_date + "]";
	}

	
	
}
