package entities;

import java.io.Serializable;
import java.sql.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity(name = "pitches")
public class Pitch implements Serializable {
	private static final long serialVersionUID = 5405125909962974770L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String name;
	private Integer status;
	
	@Column(name="cover_avatar")
	private String coverAvatar;
	
	private String description;
	
	@Column(name="hour_start")
	private Integer hourStart;
	
	@Column(name="hour_end")
	private Integer hourEnd;
	
	@Column(name="average_rating")
	private Float averageRating;
	
	@Column(name="time_auto_reject")
	private Date timeAutoReject;
	
	@Column(name="created_at")
	private String createdAt;
	
	@Column(name="updated_at")
	private String updatedAt;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "pitch_id", referencedColumnName = "id")
	Set<Address> addresses;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "pitch_id", referencedColumnName = "id")
	Set<PitchDetail> pitchDetails;
	
	@ManyToOne(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "owner_id", referencedColumnName = "id", nullable = false)
	User user;
	
	public Pitch() {}
	
	public Pitch(Integer id, String name, Integer status, String coverAvatar, String description, Integer hourStart,
			Integer hourEnd, Float averageRating, Date timeAutoReject, String createdAt, String updatedAt) {
		super();
		this.id = id;
		this.name = name;
		this.status = status;
		this.coverAvatar = coverAvatar;
		this.description = description;
		this.hourStart = hourStart;
		this.hourEnd = hourEnd;
		this.averageRating = averageRating;
		this.timeAutoReject = timeAutoReject;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getCoverAvatar() {
		return coverAvatar;
	}

	public void setCoverAvatar(String coverAvatar) {
		this.coverAvatar = coverAvatar;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public Integer getHourStart() {
		return hourStart;
	}

	public void setHourStart(Integer hourStart) {
		this.hourStart = hourStart;
	}

	public Integer getHourEnd() {
		return hourEnd;
	}

	public void setHourEnd(Integer hourEnd) {
		this.hourEnd = hourEnd;
	}

	public Float getAverageRating() {
		return averageRating;
	}

	public void setAverageRating(Float averageRating) {
		this.averageRating = averageRating;
	}

	public Date getTimeAutoReject() {
		return timeAutoReject;
	}

	public void setTimeAutoReject(Date timeAutoReject) {
		this.timeAutoReject = timeAutoReject;
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

	public Set<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(Set<Address> addresses) {
		this.addresses = addresses;
	}

	public Set<PitchDetail> getPitchDetails() {
		return pitchDetails;
	}

	public void setPitchDetails(Set<PitchDetail> pitchDetails) {
		this.pitchDetails = pitchDetails;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Pitch [id=" + id + ", name=" + name + ", status=" + status + ", coverAvatar=" + coverAvatar
				+ ", description=" + description + ", hourStart=" + hourStart + ", hourEnd=" + hourEnd
				+ ", averageRating=" + averageRating + ", timeAutoReject=" + timeAutoReject + ", createdAt=" + createdAt
				+ ", updatedAt=" + updatedAt + "]";
	}

	

	
}
