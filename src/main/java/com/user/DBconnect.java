package com.user;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	private static String url = "jdbc:mysql://localhost:3306/busticketexpressdb?useSSL=false";
	private static String username = "root";
	private static String password = "sql123";
	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, username, password);
		}
		catch(Exception e) {
			System.out.println("Something went wrong!");
		}
		
		return con;
	}
}
