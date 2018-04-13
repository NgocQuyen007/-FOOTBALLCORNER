package entities;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity(name="rents")
public class Rent implements Serializable{
	private static final long serialVersionUID = 1701103683373982475L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private Timestamp hourSart;
	private Timestamp hourEnd;
	private Date date;
	private int status;
	
	@ManyToOne(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	@JoinColumn(name="mini_pitch_id", referencedColumnName = "id", nullable = false)
	private MiniPitch miniPitch;
	
	@ManyToOne(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	@JoinColumn(name="user_id", referencedColumnName = "id", nullable = false)
	private User user;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="user_id", referencedColumnName = "id")
	private Set<Match> matches;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Timestamp getHourSart() {
		return hourSart;
	}

	public void setHourSart(Timestamp hourSart) {
		this.hourSart = hourSart;
	}

	public Timestamp getHourEnd() {
		return hourEnd;
	}

	public void setHourEnd(Timestamp hourEnd) {
		this.hourEnd = hourEnd;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public MiniPitch getMiniPitch() {
		return miniPitch;
	}

	public void setMiniPitch(MiniPitch miniPitch) {
		this.miniPitch = miniPitch;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<Match> getMatches() {
		return matches;
	}

	public void setMatches(Set<Match> matches) {
		this.matches = matches;
	}
	
}
