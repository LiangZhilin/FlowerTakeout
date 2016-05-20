package com.blackbriar.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.blackbriar.model.User;
import com.blackbriar.service.UserService;
import com.blackbriar.util.HbHelper;
@Service("UserService")
public class UserServiceImpl implements UserService{

	/*public User find(String username) {
		User currentUser = (User) HbHelper.findByColunm("User", "username", username);
		System.out.println(currentUser.getUsername()+currentUser.getPassword());
		return null;
	}
*/
	public User find(String className, String colunmName,
			String colunm) {
		
		User currentUser = (User) HbHelper.findByColunm(className, colunmName, colunm).get(0);
		return currentUser;
	}

	public boolean matching(User user) {
		String hql = "from User"+" where username=" +"'"+ user.getUsername()+"'" + " and " +"password="+"'"+user.getPassword()+"'";
		List<User> userList=  HbHelper.findByHQL(hql);
		System.out.println(userList.size());
		if(userList.size()>0)
		   return true;
		else return false;
	}
    
}
