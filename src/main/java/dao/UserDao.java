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
import org.springframework.util.StringUtils;

import entities.User;
import iplms.IUser;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
@EnableTransactionManagement
public class UserDao implements IUser {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public User login(User user) {
		Session session = sessionFactory.getCurrentSession();
		String sql =  " FROM users" 
					+ " WHERE email = :email AND password = :password";
		Query sqlQ = session.createQuery(sql);
		sqlQ.setParameter("email", user.getEmail());
		sqlQ.setParameter("password", user.getPassword());

		try {
			user = (User) sqlQ.getSingleResult();
			if (!StringUtils.isEmpty(user)) {
				return user;
			}
		} catch (Exception ex) {}
		
		return null;
	}

	@Override
	public int addUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(user);
		return 0;
	}

	@Override
	public int updateUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.update(user);
		return 0;
	}

	@Override
	public int delUser(int id) {
		Session session = sessionFactory.getCurrentSession();
		User user = session.load(User.class, new Integer(id));
		if (user != null) {
			session.delete(user);
		}
		return 0;
	}

	@Override
	public List<User> getUsers() {
		Session session = sessionFactory.getCurrentSession();
		String sql = " FROM user LIMIT 1000";
		Query query = session.createQuery(sql);
		@SuppressWarnings("unchecked")
		List<User> users = query.getResultList();
		return users;
	}

	@Override
	public User getUserById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		User user = (User) session.load(User.class, new Integer(id));
		return user;
	}

}
