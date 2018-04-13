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

@Entity(name = "pitches")
public class Pitch implements Serializable {
	private static final long serialVersionUID = 5405125909962974770L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;
	private int status;
	private String coverAvatar;
	private String description;
	private float averageRating;
	private Date timeAutoReject;
	private Timestamp createdAt;
	private Timestamp updatedAt;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "pitch_id", referencedColumnName = "id")
	Set<Address> addresses;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "pitch_id", referencedColumnName = "id")
	Set<PitchDetail> pitchDetails;
	
	@ManyToOne(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "owner_id", referencedColumnName = "id", nullable = false)
	User user;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
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

	public float getAverageRating() {
		return averageRating;
	}

	public void setAverageRating(float averageRating) {
		this.averageRating = averageRating;
	}

	public Date getTimeAutoReject() {
		return timeAutoReject;
	}

	public void setTimeAutoReject(Date timeAutoReject) {
		this.timeAutoReject = timeAutoReject;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Timestamp getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
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
	
}
