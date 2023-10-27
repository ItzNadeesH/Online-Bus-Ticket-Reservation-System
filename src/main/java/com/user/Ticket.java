package com.user;

public class Ticket {
	private int TicketID;
	private String StartingPoint;
	private String DroppingPoint;
	private String Date;
	private String Seats;
	private String Fare;
	private String Status;
	private String Username;
	public Ticket(int ticketID, String startingPoint, String droppingPoint, String date, String seats, String fare, String status, String username) {
		super();
		TicketID = ticketID;
		StartingPoint = startingPoint;
		DroppingPoint = droppingPoint;
		Date = date;
		Seats = seats;
		Fare = fare;
		Status = status;
		Username = username;
	}
	public int getTicketID() {
		return TicketID;
	}
	public void setTicketID(int ticketID) {
		TicketID = ticketID;
	}
	public String getStartingPoint() {
		return StartingPoint;
	}
	public void setStartingPoint(String startingPoint) {
		StartingPoint = startingPoint;
	}
	public String getDroppingPoint() {
		return DroppingPoint;
	}
	public void setDroppingPoint(String droppingPoint) {
		DroppingPoint = droppingPoint;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public String getSeats() {
		return Seats;
	}
	public void setSeats(String seats) {
		Seats = seats;
	}
	public String getFare() {
		return Fare;
	}
	public void setFare(String fare) {
		Fare = fare;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
}
