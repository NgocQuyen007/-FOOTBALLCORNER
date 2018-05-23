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

@Entity(name = "addresses")
public class Address implements Serializable {
	private static final long serialVersionUID = -1283690123717435093L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String detail;
	
	@Column(name="phone_number")
	private String phoneNumber;
	
	@Column(name="facebook")
	private String facebook;
	
	@Column(name="website")
	private String website;
	
	@Column(name="pemail")
	private String pemail;
	
	@Column(name="created_at")
	private String createdAt;
	
	@Column(name="updated_at")
	private String updatedAt;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "pitch_id", referencedColumnName = "id", nullable = true)
	Pitch pitch;
	
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "dzipcode", referencedColumnName = "zipcode", nullable = true)
	District district;
	
	public Address() {}
	
	public Address(Integer id, String detail, String phoneNumber, String facebook, String website, String pemail,
			String createdAt, String updatedAt, Pitch pitch, District district) {
		super();
		this.id = id;
		this.detail = detail;
		this.phoneNumber = phoneNumber;
		this.facebook = facebook;
		this.website = website;
		this.pemail = pemail;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.pitch = pitch;
		this.district = district;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
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

	public Pitch getPitch() {
		return pitch;
	}

	public String getPemail() {
		return pemail;
	}

	public void setPemail(String pemail) {
		this.pemail = pemail;
	}

	public void setPitch(Pitch pitch) {
		this.pitch = pitch;
	}

	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	@Override
	public String toString() {
		return "Address [id=" + id + ", detail=" + detail + ", phoneNumber=" + phoneNumber + ", facebook=" + facebook
				+ ", website=" + website + ", pemail=" + pemail + ", createdAt=" + createdAt + ", updatedAt="
				+ updatedAt + ", pitch=" + pitch.getId() + ", district=" + district.getZipcode() + "]";
	}

	
	
	
}
