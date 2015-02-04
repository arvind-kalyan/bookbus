package com.gl.bookbus.controller;

import java.util.Iterator;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gl.bookbus.service.busbookingService;
import com.gl.bookbus.model.Journey;

@Controller
public class busbookingController{
	
	@Autowired
	private busbookingService callService;
	
	@RequestMapping(value = "/loginsubmit", method = RequestMethod.POST)
	public @ResponseBody
	String checkLogin(@RequestBody String Data) throws Exception {		
		
		System.out.println("inside");
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(Data);
		JSONObject array = (JSONObject) obj;
		String name = (String) array.get("name");
		String pass = (String) array.get("pass");		
		String ans = callService.transferToRepo(name,pass,"CHECK","Accounts");
		return ans;		
	}
	
	@RequestMapping(value = "/regsubmit", method = RequestMethod.POST)
	public @ResponseBody
	String insertIntoTable(@RequestBody String Data) throws Exception {		
		
		System.out.println("inside insertIntoTable");
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(Data);
		JSONObject array = (JSONObject) obj;
		String name = (String) array.get("name");
		String pass = (String) array.get("pass");
		String age = (String) array.get("age");
		String email = (String) array.get("email");
		String ans = callService.insert(name,age,email,pass,"Accounts");
		return ans;		
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public @ResponseBody
	JSONArray search(@RequestBody String Data) throws Exception {
	 
		System.out.println("inside search");
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(Data);
		JSONObject array = (JSONObject) obj;
		String from = (String) array.get("from");
		String to = (String) array.get("to");		
		String doj = (String) array.get("doj");
		
		System.out.println("after parse");
		
		JSONArray J = new JSONArray();
		List<Journey> emp = callService.getSearchResults(from,to,doj,"journey");
		Iterator<Journey> it = emp.iterator();
		int ct = 0;
		while(it.hasNext())
		{
			ct++;
			Journey E = it.next();
			JSONObject obj1 = new JSONObject();
			obj1.put("id", E.getID());
		    obj1.put("from", E.getFrom());
		    obj1.put("to", E.getTo());
		    obj1.put("travels", E.getTravels());
		    obj1.put("doj", E.getDoj());
		    obj1.put("time", E.getTime());
		    obj1.put("fare", E.getFare());
		    J.add(obj1);
		   // System.out.println("id : "+E.getID()+" name : "+E.getName());
				
		}
		if(ct == 0) return null;
		System.out.println("inside refreshDB before return");
		return J;
	}
	
	
}
	