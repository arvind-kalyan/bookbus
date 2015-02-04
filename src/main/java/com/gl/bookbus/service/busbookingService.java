package com.gl.bookbus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gl.bookbus.model.busbookingModel;
import com.gl.bookbus.model.Journey;

@Service
public class busbookingService{
	
	@Autowired
	private busbookingModel mod;
	
	@Transactional
	public String transferToRepo(String a, String b,String toDO,String tableName) throws Exception
	{
		if(toDO.equals("CHECK"))
		{
			System.out.println("check login ");
			String x = mod.checkLogin(a,b,tableName);
			return x;
		}
		else return "NOOP";
	}
	@Transactional
	public String insert(String name, String age,String email, String pass,String tableName) throws Exception
	{
		
			//System.out.println("check login ");
			String x = mod.insertRepo(name,age,email,pass,tableName);
			return x;
		
		
	}
	@Transactional
	public List<Journey> getSearchResults(String from, String to,String doj,String tname) throws Exception
	{
		
			//System.out.println("check login ");
			List<Journey> J= mod.getfromTable(from,to,doj,tname);
			return J;
		
		
	}
	
	
}