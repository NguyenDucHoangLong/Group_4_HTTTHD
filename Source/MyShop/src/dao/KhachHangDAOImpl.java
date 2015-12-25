package dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entities.KhachHang;


public class KhachHangDAOImpl implements KhachHangDAO {

	private  SessionFactory  sessionFactory = HibernateUtil.getSessionFactory();
	
	@Override
	public void insertKhachHang(KhachHang kh) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		
		try{
			tx = session.beginTransaction();
			session.save(kh);
			tx.commit();
		}catch(HibernateException e)
		{
			e.printStackTrace();
		}finally{
			session.close();
		}
	}

	@Override
	public KhachHang getKhachHang(int maKH) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		KhachHang kh = null;
		
		try{
			tx = session.beginTransaction();
			kh = (KhachHang) session.createQuery("FROM KhachHang WHERE MaKH = '" 
			+ maKH + "'").uniqueResult();
		}catch(HibernateException e){
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return kh;
	}

	@Override
	public KhachHang getMaxKhachHang() {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		KhachHang kh = null;
		
		try{
			tx = session.beginTransaction();
			kh = (KhachHang) session.createQuery("FROM KhachHang ORDER BY MaKH DESC").setMaxResults(1).uniqueResult();
		}catch(HibernateException e){
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return kh;
	}

}
