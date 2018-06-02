package entities;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name = "stadium_detail_status")
public class StadiumDetailStatus implements Serializable{
	private static final long serialVersionUID = 7708018877123267469L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "cost_id", referencedColumnName = "id")
	private Cost cost;
	
	@Column(name="matchday")
	private String matchDay;
	
	@Column(name="matchtime")
	private Integer matchTime;
	
	@Column(name="matchdatetime")
	private String matchDateTime;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id", referencedColumnName = "id")
	private User user;
	
	private Integer status;
	
	@Column(name="created_at")
	private String createdAt;
	
	@Column(name="customer_name")
	private String customerName;
	
	@Column(name="phone_number")
	private String phoneNumber;
	
	private String note;
	
	private Integer position;
	
	public StadiumDetailStatus() {}

	public StadiumDetailStatus(Cost cost, String matchDay, Integer matchTime) {
		this.cost = cost;
		this.matchDay = matchDay;
		this.matchTime = matchTime;
	}
	
	public StadiumDetailStatus(int id, Cost cost, String matchDay, Integer matchTime, User user, Integer status,
			String createdAt, String customerName, String phoneNumber, String note) {
		super();
		this.id = id;
		this.cost = cost;
		this.matchDay = matchDay;
		this.matchTime = matchTime;
		this.user = user;
		this.status = status;
		this.createdAt = createdAt;
		this.customerName = customerName;
		this.phoneNumber = phoneNumber;
		this.note = note;
	}
	
	@Override
	public String toString() {
		return "StadiumDetailStatus [id=" + id + ", cost=" + cost.getId() + ", matchDay=" + matchDay + ", matchTime="
				+ matchTime + ", user=" + user.getId() + ", status=" + status + ", createdAt=" + createdAt + ", customerName="
				+ customerName + ", phoneNumber=" + phoneNumber + ", note=" + note + ", positon=" + position + "]";
	}

	public String getMatchDateTime() {
		return matchDateTime;
	}

	public void setMatchDateTime(String matchDateTime) {
		this.matchDateTime = matchDateTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Cost getCost() {
		return cost;
	}

	public void setCost(Cost cost) {
		this.cost = cost;
	}

	public String getMatchDay() {
		return matchDay;
	}

	public void setMatchDay(String matchDay) {
		this.matchDay = matchDay;
	}

	public Integer getMatchTime() {
		return matchTime;
	}

	public void setMatchTime(Integer matchTime) {
		this.matchTime = matchTime;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
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

	public Integer getPosition() {
		return position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}

}
