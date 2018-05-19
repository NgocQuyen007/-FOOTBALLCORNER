package iplms;

import java.util.List;

import entities.Event;

public interface IEvent {
	
	/**
	 * @param event: event info
	 * Them event 
	 * Tìm đối thủ gửi thông tin đến sân bóng
	 * @return int type
	 */
	public int insertEvent(Event event);
	
	/**
	 * get List Events
	 * @return events
	 */
	public List<Event> getEvents();
	
	/**
	 * get List Events
	 * @return events
	 */
	public List<Event> getEvents(int offset, int rowcount, String keyword, String created_at);
	
	/**
	 * count all rows
	 */
	public int countAllRows();
	
	/**
	 * count all rows
	 */
	public int countAllRows(String keyword, String created_at);
	
	/**
	 * When click 'Gửi' button
	 * 1. insert notification
	 * 2. update event's status to 2 : Đang bắt đối ....
	 * @return
	 */
	public int updateStatusToBe2(int eventId) ;
	
}
