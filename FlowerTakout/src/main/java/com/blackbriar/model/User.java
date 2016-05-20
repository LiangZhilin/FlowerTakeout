package com.blackbriar.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * 
 * */
@Entity
// 声明持久类，该类是要和表进行映射的
@Table(name = "user")
// 声明实体类要映射关联的表，name后的参数即表名。对该对象的操作就是对表的操作，反之亦然，亦然，亦然。。。重要的事情说三遍！！
public class User implements Serializable {
	/**
	 * 用户id
	 */
	@Id
	// 声明主键属性，对应user表中的uId主键
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)//mysql维护id的自动增长
	private int uId;

	/**
	 * 用户名
	 */

	@Column
	// 声明非主键字段，如果属性名和字段名相同，则略掉name参数，否则需要明确说明和表中的哪个字段映射
	private String username;

	/**
	 * 用户真实名
	 */
	@Column
	private String realname;

	/**
	 * 用户登录密码
	 */
	@Column
	private String password;

	/**
	 * 手机
	 */
	@Column
	private String mobile;

	/**
	 * 邮箱
	 */
	@Column
	private String email;

	public Integer getuId() {
		return uId;
	}

	public void setuId(Integer uId) {
		this.uId = uId;
	}

	public String getUsername() {
		return username;
	}

	// @RequiredFieldValidator(type = ValidatorType.FIELD, message = "请输入用户名")
	public void setUsername(String username) {
		this.username = username;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
	
	
	public User(String username, String realname, String password,
			String mobile, String email) {
		super();
		this.username = username;
		this.realname = realname;
		this.password = password;
		this.mobile = mobile;
		this.email = email;
	}

	// 登录验证中需要用到二参构造
	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	// 删除操作中需要用到一参构造
	public User(int uId) {
		this.uId = uId;
	}

	// 如果改写了类的默认构造，一定要补写一个无参构造，切记！！
	public User() {

	}
}
