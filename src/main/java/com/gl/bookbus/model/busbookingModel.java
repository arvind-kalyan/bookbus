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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class busbookingModel{
	
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	
	public String checkLogin(String usrname,String passwd,String tableName) throws Exception
	{
		conn = Util.establishConnection();
		stmt = conn.createStatement();
		System.out.println("got conn");
		String sql = "SELECT COUNT(*) from "+tableName+" where username= '"+usrname+"' and password= '"+passwd+"'";
		System.out.println(sql);
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println("11111111111");
		  while(rs.next())
		  {
			  int ct = rs.getInt("count(*)");
			  System.out.println("2222222" + ct);
			  if(ct == 1)
			  {
				  System.out.println("inside rs");
				  conn.close();
				  return "SUCCESS";
			  }
			  else
			  {
				  return "FAILURE";
				  
			  }
		  }	 
		return "ERROR";
	}
	
	public String insertRepo(String usrname,String uage, String uemail,String passwd,String tableName) throws Exception
	{
		conn = Util.establishConnection();
		stmt = conn.createStatement();
		System.out.println("got conn");
		String sql = "INSERT into "+tableName+" values('"+usrname+"','"+uage+"','"+uemail+"','"+passwd+"')";
		System.out.println(sql);
		stmt.executeUpdate(sql);
		return "SUCCESS";
	}
	public List<Journey> getfromTable(String from, String to, String doj,String tableName) throws Exception
	{
		List<Journey> empl = new ArrayList<Journey>();
		conn = Util.establishConnection();
		System.out.println("inside REPOgetEmployeeList()");
		stmt = conn.createStatement();
		String sql = "SELECT * from "+tableName+ " where jfrom = '"+from+"' and jto = '"+to+ "' and doj = '"+doj+"'";
		System.out.println(sql);
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next())
		{
			int id = rs.getInt("id");
			String age = rs.getString("doj");
			String time = rs.getString("time");
			String travels = rs.getString("travels");
			int fare = rs.getInt("fare");
			Journey E = new Journey(id,from,to,travels,age.toString(),time.toString(),fare);
			empl.add(E);			
		}
		conn.close();
		return empl;
		
	}
	
}