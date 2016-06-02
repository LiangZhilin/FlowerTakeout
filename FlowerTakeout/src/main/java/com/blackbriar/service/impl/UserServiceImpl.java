package com.blackbriar.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.blackbriar.model.User;
import com.blackbriar.service.UserService;
import com.blackbriar.util.HbHelper;

@Service("UserService")
public class UserServiceImpl implements UserService {

	/*
	 * 用户匹配
	 */
	public boolean matching(User user) {
		String hql = "from User" + " where username=" + "'"
				+ user.getUsername() + "'" + " and " + "password=" + "'"
				+ user.getPassword() + "'";
		List<User> userList = HbHelper.findByHQL(hql);
		System.out.println(userList.size());
		if (userList.size() > 0)
			return true;
		else
			return false;
	}
	/**
	 * 查询用户
	 */
	public User findByid(Integer id) {
		return (User) HbHelper.findById(User.class, id);
	}

	/**
	 * 初始化用户列表
	 */
	public List<User> initUserDemo(String name, int firstIdex, int resultSize) {
		List<User> user = HbHelper.findByPage(name, firstIdex, resultSize);
		return user;

	}

	/**
	 * 添加用户
	 */
	public boolean add(User entity) {
		boolean isadd = false;
		try {

			isadd = HbHelper.addDate(entity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isadd;

	}

	/**
	 * 删除用户
	 */
	public boolean del(User entity) {
		boolean isdel = false;
		try {
			isdel = HbHelper.delDate(entity);
		} catch (Exception e) {
		}
		return isdel;

	}

	/**
	 * 更新用户
	 */
	public boolean update(User entity) {
		try {
			HbHelper.update(entity);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public User findByColum(String proertyName, String propertyValue) {
		return (User) HbHelper.findByColunm("User", proertyName, propertyValue).get(0);
		
	}

}
