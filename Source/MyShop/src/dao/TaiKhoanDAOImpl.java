package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entities.TaiKhoan;

public class TaiKhoanDAOImpl implements TaiKhoanDAO {

	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<TaiKhoan> FindAll() {
		
		Session session = sessionFactory.openSession();
		Transaction tx = null;

		List<TaiKhoan> lstTaiKhoan = null;
		try{
			tx = session.beginTransaction();
			lstTaiKhoan = session.createCriteria(entities.TaiKhoan.class).list();
			tx.commit();
		}catch(HibernateException e){
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return lstTaiKhoan;
	}


	@Override
	public void insertUser(TaiKhoan tk) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try
		{
			tx = session.beginTransaction();
			session.save(tk);
			tx.commit();
		}catch(HibernateException e){
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
	}


	@Override
	public TaiKhoan getUser(int id) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		TaiKhoan tk = null;
		try{
			tx = session.beginTransaction();
			tk = (TaiKhoan) session.createQuery("FROM TaiKhoan WHERE ID = '" 
			+ id + "'").uniqueResult();
		}catch(HibernateException e){
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return tk;
	}


	@SuppressWarnings("unchecked")
	@Override
	public boolean checkLogin(String username, String password) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<TaiKhoan> tk = null;
		try{
			tx = session.beginTransaction();
			tk = session.createQuery(
					"FROM TaiKhoan where TenTaiKhoan = '" + username + "'AND MatKhau = '"
					+ password + "'").list();
			tx.commit();
			if(tk.size() >= 1){
				return true;
			}
		}catch(HibernateException e){
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return false;
	}


	@SuppressWarnings("unchecked")
	@Override
	public boolean checkUsername(String username) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<TaiKhoan> tk = null;
		try{
			tx = session.beginTransaction();
			tk = session.createQuery(
					"FROM TaiKhoan where TenTaiKhoan = '" + username +  "'").list();
			tx.commit();
			if(tk.size() >= 1){
				return true;
			}
		}catch(HibernateException e){
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return false;
	}
	

}
