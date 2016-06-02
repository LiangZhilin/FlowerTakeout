package com.blackbriar.action;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.blackbriar.model.User;
import com.blackbriar.service.UserService;

@SuppressWarnings("serial")
@Namespace("/")
@ParentPackage("struts-default")
public class LoginAction extends BaseAction{
	@Autowired
	private UserService userService;
	private User user;
	@Action(value="login")
	public void login() {
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}  
        if(userService.matching(user)){
        	System.out.println(user.getUsername());
        	user=userService.findByColum("username",user.getUsername());
        	session.setAttribute("currentuser", user);
        	writer.write("success");
        }
        else
        writer.write("error");
	}
	@Action(value="login2")
	public void login2() {
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
			System.out.println(user.getUsername());
			
			writer.write("success");
		
			writer.write("error");
	}
	@Action(value = "loginOut", results = {
			@Result(name = "success", location = "/login.jsp")
			 })
	public String loginOut(){
		session.removeAttribute("currentuser");
		return SUCCESS;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
  
}
