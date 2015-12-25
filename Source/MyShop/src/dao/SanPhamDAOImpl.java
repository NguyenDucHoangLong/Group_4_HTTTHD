package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entities.SanPham;


public class SanPhamDAOImpl implements SanPhamDAO{
	
	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	
	@SuppressWarnings("unchecked")
	@Override
	public List<SanPham> getListProduct() {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<SanPham> list = null;
		try{
			tx = session.beginTransaction();
			list = session.createQuery("FROM SanPham ORDER BY MaSP DESC").list();
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
	public List<SanPham> getListProductByCategory(int maDanhMuc) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<SanPham> lst = null;
		try{
			tx = session.beginTransaction();
			lst = session.createQuery("FROM SanPham WHERE MaDanhMuc ='" 
					+ maDanhMuc + "'ORDER BY MaSP DESC").list();
			tx.commit();
		}catch(HibernateException e){
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return lst;
	}

	@Override
	public SanPham getProduct(int maSanPham) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		SanPham p = null;
		try{
			tx = session.beginTransaction();
			p = (SanPham) session.createQuery("FROM SanPham WHERE MaSP = '" 
			+ maSanPham + "'").uniqueResult();
		}catch(HibernateException e){
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return p;
	}
	@Override
	public List<SanPham> getListProductByPagination(List<SanPham> list,
			int start, int end) {
		List<SanPham> result = new ArrayList<SanPham>();
		for (int i = start; i < end; i++) {
			result.add(list.get(i));
		}
		return result;
	}
}
