package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
import entities.Notification;
import iplms.INotification;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
@EnableTransactionManagement
public class NotificationDao implements INotification {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Notification> getNotifications() {
		Session session = sessionFactory.getCurrentSession();
		String sql = " FROM notifications ORDER BY id DESC";
		Query query = session.createQuery(sql);
		@SuppressWarnings("unchecked")
		List<Notification> events= query.getResultList();
		return events;
	}
	
	@Override
	public List<Notification> getNotificationsByUserId(int userId) {
		final Connection conn = getConnection();
		List<Notification> notifications = new ArrayList<>();
		String queryString = "SELECT noti.id, noti.event_id, noti.information "
				+ ", noti.message, noti.message, noti.status "
				+ ", noti.created_at, noti.updated_at "
				+ ", event.status, event.user_id, event.created_at "
				+ "FROM notifications noti "
				+ "JOIN events event ON noti.event_id = event.id "
				+ "where event.user_id = ? and noti.status = 0";
		try {
			PreparedStatement pst = conn.prepareStatement(queryString);
			pst.setInt(1, userId);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Event event = new Event();
				event.setStatus(rs.getInt("event.status"));
				event.setCreatedAt(rs.getString("event.created_at"));
				Notification notification = new Notification(rs.getInt("noti.id"), rs.getString("noti.information"), 
						rs.getString("noti.message"), rs.getInt("noti.status"), rs.getString("noti.created_at"), rs.getString("noti.updated_at"), event, null);
				notifications.add(notification);
			}
		} catch (final SQLException e) {
			throw new HibernateException(e);
		}
		
		return notifications;
	}
	
	@Override
	public int insertNotification(Notification notification) {
		final Connection conn = getConnection();
		// don't close the Connection ! managed via connection
		final String insertQuery = 
				  "INSERT INTO notifications\n"
				+ "(event_id, sent_user_id, information, message, status, created_at, updated_at)\n"
				+ "VALUES (?,?,?,?,?,?,?)";
		try {
			try(PreparedStatement pst = conn.prepareStatement(insertQuery)) {
				pst.setInt(1, notification.getEvent().getId());
				pst.setInt(2, notification.getUser().getId());
				pst.setString(3, notification.getInformation());
				pst.setString(4, notification.getMessage());
				pst.setInt(5, notification.getStatus());
				pst.setString(6, notification.getCreatedAt());
				pst.setString(7, notification.getUpdatedAt());
				return pst.executeUpdate();
			}
		} catch (final SQLException e) {
			throw new HibernateException(e);
		}
	}
	
	private Connection getConnection() {
		return ((SessionImpl) sessionFactory.getCurrentSession()).connection();
	}

	@Override
	public int updateNotificationStatusToBeSeenByEventUserId(int userId) {
		System.out.println("pêppepepepepepepe");
		final Connection conn = getConnection();
		// don't close the Connection ! managed via connection
		final String preffix = " SET SQL_SAFE_UPDATES = 0 " ;
		final String updateQuery = 
						  " update notifications noti "
						+ " join events event on event.id = noti.event_id "
						+ " set noti.status = 1 "
						+ " where event.user_id = " + userId;
		final String suffix = " SET SQL_SAFE_UPDATES = 1 ";
		try {
			try(PreparedStatement pst = conn.prepareStatement(updateQuery)) {
				pst.addBatch(preffix);
				pst.addBatch(updateQuery);
				pst.addBatch(suffix);
				return pst.executeBatch()[2];
			}
		} catch (final SQLException e) {
			throw new HibernateException(e);
		}
	}

}
