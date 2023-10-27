package com.bus;

public class Bus {
	private int busid;
	private String from;
	private String to;
	private String dtime;
	private String atime;
	private String type;
	private String price;
	public Bus(int busid, String from, String to, String dtime, String atime, String type, String price) {
		super();
		this.busid = busid;
		this.from = from;
		this.to = to;
		this.dtime = dtime;
		this.atime = atime;
		this.type = type;
		this.price = price;
	}
	public int getBusid() {
		return busid;
	}
	public void setBusid(int busid) {
		this.busid = busid;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getDtime() {
		return dtime;
	}
	public void setDtime(String dtime) {
		this.dtime = dtime;
	}
	public String getAtime() {
		return atime;
	}
	public void setAtime(String atime) {
		this.atime = atime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
}
