package service;

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
		return eventDao.getEvents();
	}

	

}
