package com.blackbriar.service;

import com.blackbriar.model.User;

public interface UserService {
	public User find(String className, String colunmName,
			String colunm);

	public boolean matching(User user);

}
