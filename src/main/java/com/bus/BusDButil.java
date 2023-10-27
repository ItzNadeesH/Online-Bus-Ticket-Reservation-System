package com.bus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.user.DBconnect;

public class BusDButil {
	public static ArrayList<Bus> getBuses() {
		Connection connection = DBconnect.getConnection();
        String query = "SELECT * FROM bus";
        
        ArrayList<Bus> busList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
            	int busid = resultSet.getInt("busid");
                String from = resultSet.getString("from");
                String to = resultSet.getString("to");
                String dtime = resultSet.getString("dtime");
                String atime = resultSet.getString("atime");
                String type = resultSet.getString("type");
                String price = resultSet.getString("price");
            	Bus bus = new Bus(busid, from, to, dtime, atime, type, price);
            	busList.add(bus);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return busList;
	}
	public static String[] getStartingLocations() {
		Connection connection = DBconnect.getConnection();
        String query = "SELECT DISTINCT starting_point FROM bus";
        
        ArrayList<String> loc = new ArrayList<>(); 
        
        try {
        	PreparedStatement preparedStatement = connection.prepareStatement(query);
        	ResultSet resultset = preparedStatement.executeQuery();
        	while(resultset.next()) {
        		String from = resultset.getString("starting_point");
        		loc.add(from);
        	}
        } catch(Exception e) {
        	e.printStackTrace();
        }
        String[] stringArray = loc.toArray(new String[loc.size()]);
        return stringArray;
	}
	public static ArrayList<Bus> searchBuses(String spoint, String dpoint) {
		Connection connection = DBconnect.getConnection();
        String query = "SELECT * FROM bus WHERE from = ? AND to = ?";
        ArrayList<Bus> busList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, spoint);
            preparedStatement.setString(2, dpoint);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
            	int busid = resultSet.getInt("busid");
                String from = resultSet.getString("from");
                String to = resultSet.getString("to");
                String dtime = resultSet.getString("dtime");
                String atime = resultSet.getString("atime");
                String type = resultSet.getString("type");
                String price = resultSet.getString("price");
            	Bus bus = new Bus(busid, from, to, dtime, atime, type, price);
            	busList.add(bus);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return busList;
	}
	public static Bus getBusById(int busId) {
		Bus bus = null;
		Connection connection = DBconnect.getConnection();
        String query = "SELECT * FROM bus WHERE busid = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, busId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
            	int busid = resultSet.getInt("busid");
                String from = resultSet.getString("from");
                String to = resultSet.getString("to");
                String dtime = resultSet.getString("dtime");
                String atime = resultSet.getString("atime");
                String type = resultSet.getString("type");
                String price = resultSet.getString("price");
            	bus = new Bus(busid, from, to, dtime, atime, type, price);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return bus;
	}
	public static ArrayList<Bus> seatchBus(String spoint, String dpoint) {
		ArrayList<Bus> busList = new ArrayList<>();
		Connection connection = DBconnect.getConnection();
        String query = "SELECT * FROM bus WHERE starting_point = ? AND dropping_point = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, spoint);
            preparedStatement.setString(2, dpoint);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
            	int busid = resultSet.getInt("busid");
                String from = resultSet.getString("from");
                String to = resultSet.getString("to");
                String dtime = resultSet.getString("dtime");
                String atime = resultSet.getString("atime");
                String type = resultSet.getString("type");
                String price = resultSet.getString("price");
            	Bus bus = new Bus(busid, from, to, dtime, atime, type, price);
            	busList.add(bus);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
		return busList;
	}
}
