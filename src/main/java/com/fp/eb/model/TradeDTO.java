package com.fp.eb.model;

import java.math.BigDecimal;
import java.util.Date;

public class TradeDTO {
	
	private int t_no;
	private String t_owner;
	private String t_title;
	private String t_book_title;
	private String t_authors;
	private String t_publisher;
	private String t_contents;
	private int t_price;
	private String t_thumbnail;
	private BigDecimal t_map_lat;
	private BigDecimal t_map_lng;
	private BigDecimal t_marker_lat;
	private BigDecimal t_marker_lng;
	private int t_soldout;
	private Date t_date;
	

	public int getT_no() {
		return t_no;
	}
	public void setT_no(int t_no) {
		this.t_no = t_no;
	}
	public String getT_owner() {
		return t_owner;
	}
	public void setT_owner(String t_owner) {
		this.t_owner = t_owner;
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
	public BigDecimal getT_map_lat() {
		return t_map_lat;
	}
	public void setT_map_lat(BigDecimal t_map_lat) {
		this.t_map_lat = t_map_lat;
	}
	public BigDecimal getT_map_lng() {
		return t_map_lng;
	}
	public void setT_map_lng(BigDecimal t_map_lng) {
		this.t_map_lng = t_map_lng;
	}
	public BigDecimal getT_marker_lat() {
		return t_marker_lat;
	}
	public void setT_marker_lat(BigDecimal t_marker_lat) {
		this.t_marker_lat = t_marker_lat;
	}
	public BigDecimal getT_marker_lng() {
		return t_marker_lng;
	}
	public void setT_marker_lng(BigDecimal t_marker_lng) {
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
	
	
	
	}
