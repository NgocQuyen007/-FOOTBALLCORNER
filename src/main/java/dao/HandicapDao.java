package dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import entities.Handicap;
import iplms.IHandicap;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
@EnableTransactionManagement
public class HandicapDao implements IHandicap {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Handicap> getHandicaps() {
		Session session = sessionFactory.getCurrentSession();
		String sql = " FROM handicaps";
		Query query = session.createQuery(sql);
		@SuppressWarnings("unchecked")
		List<Handicap> handicaps= query.getResultList();
		return handicaps;
	}

	
}
