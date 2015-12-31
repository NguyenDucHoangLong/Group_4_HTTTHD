package dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entities.LienHe;

public class LienHeDAOImpl implements LienHeDAO {

	private  SessionFactory  sessionFactory = HibernateUtil.getSessionFactory();
	
	@Override
	public void ThemLienHe(LienHe lienHe) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		
		try{
			tx = session.beginTransaction();
			session.save(lienHe);
			tx.commit();
		}catch(HibernateException e)
		{
			e.printStackTrace();
		}finally{
			session.close();
		}
	}

}
