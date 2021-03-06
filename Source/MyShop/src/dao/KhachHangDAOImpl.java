package dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entities.KhachHang;
import entities.TaiKhoan;


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
	
	public KhachHang getKhachHangByUsername(String user) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		KhachHang kh = null;
		TaiKhoan tk = null;
		
		try{
			tx = session.beginTransaction();
			tk = (TaiKhoan) session.createQuery("FROM TaiKhoan WHERE TenTaiKhoan = '"+user+"'").setMaxResults(1).uniqueResult();
			if(tk != null)
			{
				kh = (KhachHang) session.createQuery("FROM KhachHang WHERE MaND = '"+tk.getMaNd()+"'").setMaxResults(1).uniqueResult();
			}
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
