package entities;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name = "notifications")
public class Notification implements Serializable {

	private static final long serialVersionUID = 2426344274948531956L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String information;
	private String message;
	
	private Integer status;
	
	@Column(name="created_at")
	private String createdAt;
	
	@Column(name="updated_at")
	private String updatedAt;
	
	@ManyToOne(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	@JoinColumn(name = "event_id", referencedColumnName = "id", nullable = false)
	Event event;
	
	@ManyToOne(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	@JoinColumn(name = "sent_user_id", referencedColumnName = "id", nullable = false)
	User user;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public String getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(String updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Notification() {
	}
	
	public Notification(int id, String information, String message, Integer status, String createdAt, String updatedAt,
			Event event, User user) {
		super();
		this.id = id;
		this.information = information;
		this.message = message;
		this.status = status;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.event = event;
		this.user = user;
	}

	@Override
	public String toString() {
		return "Notification [id=" + id + ", information=" + information + ", message=" + message + ", status=" + status
				+ ", createdAt=" + createdAt + ", updateddAt=" + updatedAt + ", event=" + event + ", user=" + user
				+ "]";
	}
	
}
