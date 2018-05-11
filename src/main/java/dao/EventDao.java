package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.internal.SessionImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import entities.Event;
import iplms.IEvent;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
@EnableTransactionManagement
public class EventDao implements IEvent {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Event> getEvents() {
		Session session = sessionFactory.getCurrentSession();
		String sql = " FROM events ORDER BY id DESC";
		Query query = session.createQuery(sql);
		@SuppressWarnings("unchecked")
		List<Event> events= query.getResultList();
		return events;
	}

	@Override
	public int insertEvent(Event event) {
		final Connection conn = getConnection();
		// don't close the Connection ! managed via connection
		final String insertQuery = "INSERT INTO events\n"
				+ "(status, created_at, user_id, level_id, handicap_id, dzipcode, message, pname)\n"
				+ "VALUES (?,?,?,?,?,?,?,?)";
		try {
			try(PreparedStatement pst = conn.prepareStatement(insertQuery)) {
				pst.setInt(1, event.getStatus());
				pst.setString(2, event.getCreatedAt());
				pst.setInt(3, event.getUser().getId());
				pst.setInt(4, event.getLevel().getId());
				pst.setInt(5, event.getHandicap().getId());
				pst.setInt(6, event.getDistrict().getZipcode());
				pst.setString(7, event.getMessage());
				pst.setString(8, event.getPname());
				return pst.executeUpdate();
			}
		} catch (final SQLException e) {
			throw new HibernateException(e);
		}
	}
	
	private Connection getConnection() {
		return ((SessionImpl) sessionFactory.getCurrentSession()).connection();
	}

	
}
