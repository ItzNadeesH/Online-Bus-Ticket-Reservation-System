package com.user;

public class User {
	private String fname;
	private String lname;
	private String phone;
	private String type;
	private String username;
	private String email;
	private String password;
	public User(String fname, String lname, String phone, String type, String username, String email, String password) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.phone = phone;
		this.type = type;
		this.username = username;
		this.email = email;
		this.password = password;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
