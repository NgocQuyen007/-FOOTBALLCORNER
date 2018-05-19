package iplms;

import java.util.List;

import entities.Notification;

public interface INotification {
	/**
	 * Get list notifications in the system
	 * @return costs
	 */
	public List<Notification> getNotifications();
	
	/**
	 * 
	 * @param notification: item add
	 * @return int type
	 */
	public int insertNotification(Notification notification);
	
	/**
	 * @return list notifications in header
	 */
	public List<Notification> getNotificationsByUserId(int userId);
	
	/**
	 * Update notification status khi user click vao noti-icon
	 * update status = 1 where (user_id [event] = sessionUserInfo.getId())
	 * */
	public int updateNotificationStatusToBeSeenByEventUserId(int userId);
}
