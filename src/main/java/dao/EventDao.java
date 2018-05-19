package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.internal.SessionImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.util.StringUtils;

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
	public List<Event> getEvents(int offset, int rowcount, String keyword, String keytime) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " FROM events WHERE 1=1 ";
		if (!StringUtils.isEmpty(keyword)) {
			sql += " AND pname LIKE :pname" ;
		}
		
		if (!StringUtils.isEmpty(keytime)) {
			sql += " AND created_at LIKE :created_at" ;
		}
		
		sql += " ORDER BY id DESC ";
		
		Query query = session.createQuery(sql);
		
		if (!StringUtils.isEmpty(keyword)) {
			query.setParameter("pname", '%'+keyword+'%');
		}
		
		if (!StringUtils.isEmpty(keytime)) {
			query.setParameter("created_at", '%'+keytime+'%');
		}
		query.setFirstResult(offset).setMaxResults(rowcount);
		
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
	
	@Override
	public int countAllRows() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Event.class).setProjection(Projections.rowCount());
		return Integer.parseInt(criteria.uniqueResult().toString());
	}
	
	@Override
	public int countAllRows(String keyword, String created_at) {
		int rows = 0;
		final Connection conn = getConnection();
		final String queryString =  " SELECT *"
							+ " FROM events "
							+ " WHERE pname LIKE ? AND created_at LIKE ?";
		try {
			try(PreparedStatement pst = conn.prepareStatement(queryString)) {
				pst.setString(1, '%'+keyword+'%');
				pst.setString(2, '%'+created_at+'%');
				ResultSet rs = pst.executeQuery();
				while(rs.next()) {
					rows++;
				}
				return rows;
			}
		} catch (final SQLException e) {
			throw new HibernateException(e);
		}
		
	}
	
	@Override
	public int updateStatusToBe2(int eventId) {
		final Connection conn = getConnection();
		// don't close the Connection ! managed via connection
		final String updateQuery = " UPDATE events "
							+ " SET status = 2"
							+ " WHERE id = ?";
		try {
			try (PreparedStatement pst = conn.prepareStatement(updateQuery)) {
				pst.setInt(1, eventId);
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
