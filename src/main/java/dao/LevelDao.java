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

import entities.Level;
import iplms.ILevel;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
@EnableTransactionManagement
public class LevelDao implements ILevel {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Level> getLevels() {
		Session session = sessionFactory.getCurrentSession();
		String sql = " FROM levels";
		Query query = session.createQuery(sql);
		@SuppressWarnings("unchecked")
		List<Level> levels= query.getResultList();
		return levels;
	}

	
}
