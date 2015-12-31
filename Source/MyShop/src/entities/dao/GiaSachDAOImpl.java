package dao;

import java.util.List;



import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entities.GiaSach;



public class GiaSachDAOImpl implements GiaSachDAO {

	private  SessionFactory  sessionFactory = HibernateUtil.getSessionFactory();
	
	@Override
	public void ThemGiaSach(GiaSach giaSach) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		
		try{
			tx = session.beginTransaction();
			session.save(giaSach);
			tx.commit();
		}catch(HibernateException e)
		{
			e.printStackTrace();
		}finally{
			session.close();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GiaSach> FindAll() {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<GiaSach> list = null;
		try{
			tx = session.beginTransaction();
			list = session.createQuery("FROM GiaSach").list();
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

	@SuppressWarnings("unchecked")
	@Override
	public List<GiaSach> ListGiaSachByMaKH(int maKH) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<GiaSach> list = null;
		try{
			tx = session.beginTransaction();
			list = session.createQuery("FROM GiaSach WHERE MaKH='" + maKH +"'").list();
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
	public void DeleteGiaSachs(int maKH) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		
		try{
			tx = session.beginTransaction();
			
			session.createQuery("delete GiaSach where MaKH='" + maKH +"'").executeUpdate();
			
			tx.commit();
		}catch(HibernateException e)
		{
			e.printStackTrace();
		}finally{
			session.close();
		}
		
	}

	@Override
	public void DeleteGiaSach(int maKH, int maSP) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		
		try{
			tx = session.beginTransaction();
			
			session.createQuery("delete GiaSach where MaKH='" + maKH +"' and MaSP='"+ maSP +"'").executeUpdate();
			
			tx.commit();
		}catch(HibernateException e)
		{
			e.printStackTrace();
		}finally{
			session.close();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean checkGiaSach(int maKH, int maSP) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<GiaSach> gs = null;
		try{
			tx = session.beginTransaction();
			gs = session.createQuery(
					"FROM GiaSach where MaKH = '" + maKH + "'AND MaSP = '"
					+ maSP + "'").list();
			tx.commit();
			if(gs.size() >= 1){
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
