package com.blackbriar.util;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.blackbriar.model.User;
public class HbHelper {
	private static SessionFactory sessionFactory;
	/*
	 * 用hql语句查询
	 */
	public static <T> List<T> findByHQL(String hql){
		Session session = null;
		List<T> list = null;
		try {
			session = openSession();
			Query query = session.createQuery(hql);
			list = query.list();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
				closeSession(session);
		}
		return list;
	}
	
	/*
	 * 用hql语句分页查询
	 */
	public static <T> List<T> findByHQL(String hql,int firstIdex,
			int resultSize){
		Session session = null;
		List<T> list = null;
		try {
			session = openSession();
			Query query = session.createQuery(hql).setFirstResult(firstIdex).setMaxResults(resultSize);
			list = query.list();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
				closeSession(session);
		}
		return list;
	}
	
	/*
	 * 用sql语句查询
	 */
	public static <T> List<T> findBySQL(String sql){
		Session session = null;
		List<T> list = null;
		try {
			session = openSession();
			Query query = session.createSQLQuery(sql);
			list = query.list();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
				closeSession(session);
		}
		return list;
	}
	
	/*
	 * 用hql语句分页查询
	 */
	public static <T> List<T> findBySQL(String sql,int firstIdex,
			int resultSize){
		Session session = null;
		List<T> list = null;
		try {
			session = openSession();
			Query query = session.createSQLQuery(sql).setFirstResult(firstIdex).setMaxResults(resultSize);
			list = query.list();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
				closeSession(session);
		}
		return list;
	}
	
	/*
	 * 查询一页数据,不按条件查询
	 */
	@SuppressWarnings({ "unchecked", "unused" })
	public static <T> List<T> findByPage(String className, int firstIdex,
			int resultSize) {
		Session session = null;
		List<T> list = null;
		try {
			session = openSession();
			String hql = "from " + className;
			Query query = session.createQuery("from " + className)
					.setFirstResult(firstIdex).setMaxResults(resultSize);
			list = query.list();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
				closeSession(session);
		}
		return list;
	}

	/*
	 *  按条件查询数据个数
	 */
	@SuppressWarnings("unused")
	public static int getCount(String className, String propertyName, String propertyValue) {
		List<?> list = findByColunm(className, propertyName, propertyValue);
		return list.size()+1;
	}
	/*
	 *  查询表数据总数
	 */
	@SuppressWarnings("unused")
	public static int getCount(String className) {
		List<?> list=findAll(className);
		return list.size()+1;
	}
	
	/*
	 * 新增数据
	 */
	public static boolean addDate(Object entity) {
		boolean result = false;
		Transaction ts = null;
		Session session = null;
		try {
			session = openSession();
			ts = beginTransaction(session);
			session.save(entity);
			commitTransaction(ts);
			result = true;
		} catch (Exception e) {
			if (ts != null) {
				// 事务回滚
				ts.rollback();
			}
		} finally {
			closeSession(session);
		}
		return result;
	}

	/*
	 * 更改数据
	 */
	public static boolean update(Object entity) {
		boolean result = false;
		Transaction ts = null;
		Session session = null;
		try {
			session = openSession();
			ts = beginTransaction(session);
			session.update(entity);
			commitTransaction(ts);
			result = true;
		} catch (Exception e) {
			if (ts != null) {
				// 事务回滚
				ts.rollback();
			}
		} finally {
				closeSession(session);
		}
		return result;
	}

	/*
	 * 删除数据*
	 */
	public static boolean delDate(Object entity) {
		boolean result = false;
		Transaction ts = null;
		Session session = null;
		try {
			session = openSession();
			ts = beginTransaction(session);
			session.delete(entity);
			commitTransaction(ts);
			result = true;
		} catch (Exception e) {
			if (ts != null) {
				// 事务回滚
				ts.rollback();
			}
		} finally {
				closeSession(session);
		}
		return result;
	}

	/*
	 * 根据主键id查找
	 */
	public static Object findById(Class entityClass, int id) {
		Session session = null;
		Object bean = null;
		try {
			session = openSession();
			bean = session.get(entityClass, id);
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			closeSession(session);
		}
		return bean;
	}

	/*
	 * 根据列的字段值查找
	 */
	@SuppressWarnings("unchecked")
	public static <T> List<T> findByColunm(String className, String propertyName,
			String propertyValue) {
		Session session = null;
		List<T> list = null;
		try {
			session = openSession();
			Query query = session.createQuery("from " + className + " where "
					+ propertyName + "=" +"'"+ propertyValue+"'");
			list = query.list();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
				closeSession(session);
		}
		if (list != null) {
			return list;
		}
		return null;
	}

	/*
	 * 查询该表所有数据
	 */
	@SuppressWarnings("unchecked")
	public static <T> List<T> findAll(String className) {

		Session session = null;
		List<T> list = null;
		try {
			session = openSession();
			Query query = session.createQuery("from " + className);
			list = query.list();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
				closeSession(session);
		}
		return list;
	}

	

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	// 提交事务
	private static void commitTransaction(Transaction ts) {
		ts.commit();
	}

	// 开始事务
	private static Transaction beginTransaction(Session session) {
		Transaction ts = session.beginTransaction();
		return ts;
	}

	// 关闭Session
	private static void closeSession(Session session) {
		if(session!=null) session.close();
	}

	// 开启Session
	private static Session openSession() {
		Session session = sessionFactory.openSession();
		return session;
	}
}
