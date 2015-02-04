package com.gl.bookbus.model;

public class Journey{
	
	private int id;
	public String From;
	private String To;
	private String travels;
	private String doj;
	private String time;
	private int fare;
	
	public Journey() {}
	public Journey(int id, String from, String to,String travels,String doj,String time,int fare)
	{
		this.id = id;
		this.From = from;
		this.To = to;		
		this.travels = travels;
		this.doj = doj;
		this.time = time;
		this.fare=fare;
	}
	public int getID()
	{
		return this.id;
	}
	public String getFrom()
	{
		return this.From;
	}
	public String getTo()
	{
		return this.To;
	}
	public String getTravels()
	{
		return this.travels;
	}
	public String getDoj()
	{
		return this.doj;
	}
	public String getTime()
	{
		return this.time;
	}
	public int getFare()
	{ return this.fare; }
	
}
