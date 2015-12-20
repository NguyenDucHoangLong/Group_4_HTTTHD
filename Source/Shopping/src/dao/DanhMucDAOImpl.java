package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entities.DanhMuc;


public class DanhMucDAOImpl implements DanhMucDao {

	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<DanhMuc> getCategoryByParent() {
		Session session = sessionFactory.openSession();
		Transaction tx = null;

		List<DanhMuc> lstDanhMuc = null;
		try{
			tx = session.beginTransaction();
			lstDanhMuc = session.createQuery("FROM DanhMuc WHERE MaDanhMucCha = 0").list();
			tx.commit();
		}catch(HibernateException e){
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return lstDanhMuc;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DanhMuc> getCategoryByChildren(int parent) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<DanhMuc> list = null;
		try{
			tx = session.beginTransaction();
			list = session.createQuery("FROM DanhMuc WHERE MaDanhMucCha='" + parent +"'").list();
			tx.commit();
		}catch(HibernateException e){
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}

	@Override
	public DanhMuc getCategoryById(int maDanhMuc) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		DanhMuc c = null;
		try{
			tx = session.beginTransaction();
			c = (DanhMuc)session.createQuery("FROM DanhMuc WHERE MaDanhMuc='" 
			+ maDanhMuc +"'").uniqueResult();
			tx.commit();
		}catch(HibernateException e){
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return c;
	}

}
