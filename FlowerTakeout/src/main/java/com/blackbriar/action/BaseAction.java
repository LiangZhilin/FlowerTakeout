package com.blackbriar.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.util.ServletContextAware;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements ServletRequestAware,
		ServletContextAware, ServletResponseAware {
	private static final long serialVersionUID = -1040212988363452551L;	
	protected HttpServletRequest request;
	protected ServletContext application;
	protected HttpServletResponse response;
	protected HttpSession session;
	public void setServletRequest(HttpServletRequest arg0) {		
		this.request = arg0;
		session = this.request.getSession();
	}
	public void setServletResponse(HttpServletResponse arg0) {
   		this.response = arg0;
	}
	public void setServletContext(ServletContext arg0) {
		this.application = arg0;
	}
}
