package com.blackbriar.service;

import java.util.List;

import com.blackbriar.model.User;

public interface UserService {
	
	/**
	 * 查询用户
	 */
	public User findByid(Integer id);
	/**
	 * @param user
	 * @return
	 */
	public boolean matching(User user);

	/**
	 * 添加用户
	 * @param user
	 * @return 
	 */
	public boolean add(User user);

	/**
	 * 初始化用户管理
	 * @param string
	 * @param firstIdex
	 * @param i
	 * @return
	 */
	public List<User> initUserDemo(String string, int firstIdex, int i);
	/**
	 * 删除用户
	 */
	public boolean del(User entity);
	/**
	 * 更新用户
	 */
	public boolean update(User entity);
	public User findByColum(String proertyName, String propertyValue);
}
