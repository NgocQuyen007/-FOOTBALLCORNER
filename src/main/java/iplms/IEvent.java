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
	
}
