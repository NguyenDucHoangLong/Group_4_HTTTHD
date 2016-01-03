package dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entities.CtdonHang;

public class ChiTietDonHangImpl implements ChiTietDonHangDAO {

	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	@Override
	public void themChiTietDonHang(CtdonHang ctdh) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			session.save(ctdh);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

}
