package com.user;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;

public class UserDButil {	
    public static boolean authenticateUser(String username, String password) {
        Connection connection = DBconnect.getConnection();
        String query = "SELECT * FROM user WHERE username = ? AND password = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public static boolean createUser(User user) {
        Connection connection = DBconnect.getConnection();
        String query = "INSERT INTO user (fname, lname, phone, type, username, email, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
        	PreparedStatement preparedStatement = connection.prepareStatement(query);
        	preparedStatement.setString(1, user.getFname());
            preparedStatement.setString(2, user.getLname());
            preparedStatement.setString(3, user.getPhone());
            preparedStatement.setString(4, user.getType());
            preparedStatement.setString(5, user.getUsername());
            preparedStatement.setString(6, user.getEmail());
            preparedStatement.setString(7, user.getPassword());
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
        	e.printStackTrace();
        	return false;
        }
    }
    public static ArrayList<Ticket> getTickets(String username) {
    	Connection connection = DBconnect.getConnection();
    	ArrayList<Ticket> dataList = new ArrayList<>();
    	String query = "SELECT * FROM reservation WHERE userid = ?";
    	try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int ticketID = resultSet.getInt("ticketid");
                String startingPoint = resultSet.getString("starting_point");
                String droppingPoint = resultSet.getString("dropping_point");
                String date = resultSet.getString("date");
                String seats = resultSet.getString("seats");
                String fare = resultSet.getString("fare");
                String status = resultSet.getString("status");
                String userid = resultSet.getString("userid");
                
                Ticket t = new Ticket(ticketID, startingPoint, droppingPoint, date, seats, fare, status, userid);
                dataList.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    	return dataList;
    }
    public static User getUser(String username) {
    	Connection connection = DBconnect.getConnection();
    	String query = "SELECT * FROM user WHERE username = ?";
    	try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String fname = resultSet.getString("fname");
                String lname = resultSet.getString("lname");
                String phone = resultSet.getString("phone");
                String type = resultSet.getString("type");
                String userid = resultSet.getString("username");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                
                User user = new User(fname, lname, phone, type, userid, email, password);
                
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    	return null;
    }
    public static boolean bookTicket(Ticket t) {
    	boolean isSuccess = false;
    	Connection connection = DBconnect.getConnection();
        String query = "INSERT INTO reservation (ticketid,starting_point, dropping_point, date, seats, fare, status, userid) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
        	PreparedStatement preparedStatement = connection.prepareStatement(query);
        	preparedStatement.setInt(1, 0);
        	preparedStatement.setString(2, t.getStartingPoint());
            preparedStatement.setString(3, t.getDroppingPoint());
            preparedStatement.setString(4, t.getDate());
            preparedStatement.setString(5, t.getSeats());
            preparedStatement.setString(6, t.getFare());
            preparedStatement.setString(7, t.getStatus());
            preparedStatement.setString(8, t.getUsername());
            preparedStatement.executeUpdate();
            isSuccess = true;
        } catch (SQLException e) {
        	e.printStackTrace();
        	return false;
        }
    	return isSuccess;
    }
    public static boolean deleteTicket(String ticketId) {
    	boolean isSuccess = false;
    	Connection connection = DBconnect.getConnection();
        String query = "DELETE FROM reservation WHERE ticketid = ?";
        try {
        	PreparedStatement preparedStatement = connection.prepareStatement(query);
        	preparedStatement.setString(1, ticketId);
            preparedStatement.executeUpdate();
            isSuccess = true;
        } catch (SQLException e) {
        	e.printStackTrace();
        	return false;
        }
    	return isSuccess;
    }
    public static Ticket getTicketbyId(int ticketId) {
    	Ticket ticket = null;
    	Connection connection = DBconnect.getConnection();
        String query = "SELECT * FROM reservation WHERE ticketid = ?";
        try {
        	PreparedStatement preparedStatement = connection.prepareStatement(query);
        	preparedStatement.setInt(1, ticketId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String startingPoint = resultSet.getString("starting_point");
                String droppingPoint = resultSet.getString("dropping_point");
                String date = resultSet.getString("date");
                String seats = resultSet.getString("seats");
                String fare = resultSet.getString("fare");
                String status = resultSet.getString("status");
                String userid = resultSet.getString("userid");
                
                ticket = new Ticket(ticketId, startingPoint, droppingPoint, date, seats, fare, status, userid);
            }
        } catch (SQLException e) {
        	e.printStackTrace();
        }
    	
    	return ticket;
    }
    public static boolean updateTicket(Ticket ticket) {
    	boolean isSuccess = false;
    	Connection connection = DBconnect.getConnection();
        String query = "UPDATE reservation SET date = ?, seats = ? WHERE ticketid = ?";
        try {
        	PreparedStatement preparedStatement = connection.prepareStatement(query);
        	preparedStatement.setString(1, ticket.getDate());
        	preparedStatement.setString(2, ticket.getSeats());
        	preparedStatement.setInt(3, ticket.getTicketID());
            preparedStatement.executeUpdate();
            isSuccess = true;
        } catch (SQLException e) {
        	e.printStackTrace();
        }
    	return isSuccess;
    }
    public static boolean updateUserDetails(String fname, String lname, String mobile, String email, String username) {
    	boolean isSuccess = false;
    	Connection connection = DBconnect.getConnection();
        String query = "UPDATE user SET fname = ?, lname = ?, phone = ?, email = ? WHERE username = ?";
        try {
        	PreparedStatement preparedStatement = connection.prepareStatement(query);
        	preparedStatement.setString(1, fname);
        	preparedStatement.setString(2, lname);
        	preparedStatement.setString(3, mobile);
        	preparedStatement.setString(4, email);
        	preparedStatement.setString(5, username);
            preparedStatement.executeUpdate();
            isSuccess = true;
        } catch (SQLException e) {
        	e.printStackTrace();
        }
    	return isSuccess;
    }
    public static String[] getStatus(String username) {
        String[] result = new String[3];
        Connection connection = DBconnect.getConnection();

        String query1 = "SELECT COUNT(*) AS count FROM reservation WHERE userid = ? AND status = ?";
        String query2 = "SELECT COUNT(*) AS count FROM reservation WHERE userid = ? AND status = ?";
        String query3 = "SELECT COUNT(*) AS count FROM reservation WHERE userid = ? AND status = ?";

        try {
            PreparedStatement preparedStatement1 = connection.prepareStatement(query1);
            preparedStatement1.setString(1, username);
            preparedStatement1.setString(2, "Rejected");
            ResultSet resultSet1 = preparedStatement1.executeQuery();
            if (resultSet1.next()) {
                result[0] = resultSet1.getString("count");
            }

            PreparedStatement preparedStatement2 = connection.prepareStatement(query2);
            preparedStatement2.setString(1, username);
            preparedStatement2.setString(2, "Pending");
            ResultSet resultSet2 = preparedStatement2.executeQuery();
            if (resultSet2.next()) {
                result[1] = resultSet2.getString("count");
            }

            PreparedStatement preparedStatement3 = connection.prepareStatement(query3);
            preparedStatement3.setString(1, username);
            preparedStatement3.setString(2, "Accepted");
            ResultSet resultSet3 = preparedStatement3.executeQuery();
            if (resultSet3.next()) {
                result[2] = resultSet3.getString("count");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public static boolean updatePassword(String newpwd, String crtpwd, String username) {
        boolean isSuccess = false;
        Connection connection = DBconnect.getConnection();
        String selectQuery = "SELECT * FROM user WHERE username = ?";
        String updateQuery = "UPDATE user SET password = ? WHERE username = ?";
        
        try {
            PreparedStatement selectStatement = connection.prepareStatement(selectQuery);
            selectStatement.setString(1, username);
            ResultSet resultSet = selectStatement.executeQuery();
            
            if (resultSet.next()) {
                String currentPassword = resultSet.getString("password");
                
                if (currentPassword.equals(crtpwd)) {
                    PreparedStatement updateStatement = connection.prepareStatement(updateQuery);
                    updateStatement.setString(1, newpwd);
                    updateStatement.setString(2, username);
                    int rowsAffected = updateStatement.executeUpdate();
                    
                    if (rowsAffected > 0) {
                        isSuccess = true;
                        System.out.println("Password updated successfully!");
                    }
                } else {
                    System.out.println("Incorrect current password.");
                }
            } else {
                System.out.println("User not found.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return isSuccess;
    }
}
