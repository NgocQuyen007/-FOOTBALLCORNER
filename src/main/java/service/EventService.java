package service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.EventDao;
import entities.Event;
import iplms.IEvent;

@Service
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class EventService implements IEvent {

	@Autowired
	EventDao eventDao;
	
	@Override
	@Transactional
	public int insertEvent(Event event) {
		return eventDao.insertEvent(event);
	}

	@Override
	@Transactional
	public List<Event> getEvents() {
		final List<Event> events = eventDao.getEvents();
		return events.size() > 0 ? events : Collections.emptyList();
	}

	@Override
	@Transactional
	public int countAllRows() {
		return eventDao.countAllRows();
	}

	@Override
	@Transactional
	public List<Event> getEvents(int offset, int rowcount, String keyword, String created_at) {
		final List<Event> events = eventDao.getEvents(offset, rowcount, keyword, created_at);
		return events.size() > 0 ? events : Collections.emptyList();
	}

	@Override
	@Transactional
	public int countAllRows(String keyword, String created_at) {
		return eventDao.countAllRows(keyword, created_at);
	}

	

}
