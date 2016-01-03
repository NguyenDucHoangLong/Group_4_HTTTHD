package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entities.DonHang;
import entities.KhachHang;
import entities.SanPham;

public class DonHangImpl implements DonHangDAO {

	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	@Override
	public void themDonHang(DonHang dh) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			session.save(dh);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	

	@Override
	public DonHang getDonHang(int id) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		DonHang donhang = null;
		try{
			tx = session.beginTransaction();
			donhang = (DonHang) session.createQuery("FROM DonHang Where MaDH ="+id+" ORDER BY MaDH DESC").uniqueResult();
			tx.commit();
		}catch(HibernateException e){
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return donhang;
	}

	@Override
	public DonHang getDonHangMoiNhat() {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		DonHang donhang = null;
		try{
			tx = session.beginTransaction();
			donhang = (DonHang) session.createQuery("FROM DonHang ORDER BY MaDH DESC").uniqueResult();
			tx.commit();
		}catch(HibernateException e){
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return donhang;
	}
	@Override
	public DonHang getDonHangMoiNhat(int makh) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		DonHang donhang = null;
		try{
			tx = session.beginTransaction();
			donhang = (DonHang) session.createQuery("FROM DonHang WHERE makh ="+ makh).uniqueResult();
			tx.commit();
		}catch(HibernateException e){
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return donhang;
	}
}
