package com.gl.bookbus.model;
 
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.tomcat.util.http.fileupload.util.Closeable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
 
@Repository
public class Util
{
	private static Connection connect = null;
	private static String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	private static String DB_URL = "jdbc:mysql://localhost/busbookingdb";
	private static String USER = "root";
	private static String PASS = "root";
	
    public static Connection establishConnection()
    {

    	System.out.println("inside establishconn()");
    	try{

		      Class.forName("com.mysql.jdbc.Driver");
		      System.out.println("Connecting to a selected database...");
		   try{   
		      connect = DriverManager.getConnection(DB_URL, USER, PASS);
		      System.out.println("Connected database successfully...");    
		   }catch(SQLException se){
		     
		     System.out.println("Failed to create database connection.");
		   }
    	}catch(ClassNotFoundException ex)
    	{
    		
    		System.out.println("Driver not found!");
    	}

    	return connect;
    }
   
}