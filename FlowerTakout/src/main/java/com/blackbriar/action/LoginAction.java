package com.blackbriar.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.blackbriar.model.User;
import com.blackbriar.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
@Namespace("/")
@ParentPackage("struts-default")
public class LoginAction extends ActionSupport{
	@Autowired
	private UserService userService;
	private User user;
	@Action(value="login",results={
			@Result(name="success",location="/login.jsp"),
			@Result(name="error",location="/error500.jsp")	
	})
	public String login() {
		System.out.println(user);
        if(userService.matching(user)){
        	return SUCCESS;
        }
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
