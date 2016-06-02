package com.blackbriar.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 用户实体类
 * */
@Entity
@Table(name = "t_user")
public class User implements Serializable {
	/**
	 * 用户id
	 */
	@Id
	// 声明主键属性，对应user表中的uId主键
	@Column(name="f_userid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)//mysql维护id的自动增长
	private int uId;

	/**
	 * 用户名
	 */
	@Column(name="f_username")
	// 声明非主键字段，如果属性名和字段名相同，则略掉name参数，否则需要明确说明和表中的哪个字段映射
	private String username;

	/**
	 * 用户真实名
	 */
	@Column(name="f_sureName")
	private String realname;

	/**
	 * 用户登录密码
	 */
	@Column(name="f_password")
	private String password;
	/**
	 * 手机
	 */
	@Column(name="f_phone")
	private String mobile;
	/**
	 * 性别
	 */
	@Column(name="f_sex")
	private String sex;
	/**
	 * 邮箱
	 */
	@Column(name="f_email")
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

	
	
	
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}


	public void setuId(int uId) {
		this.uId = uId;
	}

	

	public User(int uId, String username, String realname, String password,
			String mobile, String sex, String email, String rid) {
		super();
		this.uId = uId;
		this.username = username;
		this.realname = realname;
		this.password = password;
		this.mobile = mobile;
		this.sex = sex;
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
