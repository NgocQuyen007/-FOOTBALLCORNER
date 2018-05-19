package entities;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity(name = "users")
public class User implements Serializable {
	private static final long serialVersionUID = 8048316863241179933L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String fullname;
	private String account;
	
	@NotEmpty(message="Password cannot be empty!")
	private String password;
	
	@Email(regexp="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", message="Invalid email!")
	@NotEmpty(message="Email cannot be empty!")
	private String email;
	
	@Column(name="phone_number")
	private String phoneNumber;
	
	private String avatar;
	
	@Column(name="created_at")
	private Timestamp createdAt;
	
	@Column(name="updated_at")
	private Timestamp updatedAt;
	
	private Boolean status;

	@Column(name = "reset_password_token")
	private String resetPasswordToken;

	/*@Column(name = "reset_password_send_at")
	private String resetPasswordSendAt;*/

	@Column(name = "current_sign_in_at")
	private String currentSigninAt;

	@Column(name = "last_sign_in_at")
	private String lastSigninAt;

	@Column(name = "current_sign_in_ip")
	private String currentSigninIP;

	@Column(name = "last_sign_in_ip")
	private String lastSigninIP;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "user_permission_id", referencedColumnName = "id", nullable = false)
	UserPermission userPermission;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id", referencedColumnName = "id")
	Set<Event> events;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id", referencedColumnName = "id")
	Set<MatchUser> matchUsers;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id", referencedColumnName = "id")
	Set<Notification> comments;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id", referencedColumnName = "id")
	Set<Rent> rents;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "owner_id", referencedColumnName = "id")
	Set<Pitch> pitches;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable( name = "teamplayers",
			joinColumns = {@JoinColumn(name = "user_id", referencedColumnName = "id")}, 
	    inverseJoinColumns = {@JoinColumn(name = "team_id",  referencedColumnName = "id") } )
	Set<Team> teams;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
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

	public Boolean isStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public String getResetPasswordToken() {
		return resetPasswordToken;
	}

	public void setResetPasswordToken(String resetPasswordToken) {
		this.resetPasswordToken = resetPasswordToken;
	}

	/*public String getResetPasswordSendAt() {
		return resetPasswordSendAt;
	}

	public void setResetPasswordSendAt(String resetPasswordSendAt) {
		this.resetPasswordSendAt = resetPasswordSendAt;
	}*/

	public String getCurrentSigninAt() {
		return currentSigninAt;
	}

	public void setCurrentSigninAt(String currentSigninAt) {
		this.currentSigninAt = currentSigninAt;
	}

	public String getLastSigninAt() {
		return lastSigninAt;
	}

	public void setLastSigninAt(String lastSigninAt) {
		this.lastSigninAt = lastSigninAt;
	}

	public String getCurrentSigninIP() {
		return currentSigninIP;
	}

	public void setCurrentSigninIP(String currentSigninIP) {
		this.currentSigninIP = currentSigninIP;
	}

	public String getLastSigninIP() {
		return lastSigninIP;
	}

	public void setLastSigninIP(String lastSigninIP) {
		this.lastSigninIP = lastSigninIP;
	}

	public UserPermission getUserPermission() {
		return userPermission;
	}

	public void setUserPermission(UserPermission userPermission) {
		this.userPermission = userPermission;
	}

	public Set<Event> getEvents() {
		return events;
	}

	public void setEvents(Set<Event> events) {
		this.events = events;
	}

	public Set<MatchUser> getMatchUsers() {
		return matchUsers;
	}

	public void setMatchUsers(Set<MatchUser> matchUsers) {
		this.matchUsers = matchUsers;
	}

	public Set<Notification> getComments() {
		return comments;
	}

	public void setComments(Set<Notification> comments) {
		this.comments = comments;
	}

	public Set<Rent> getRents() {
		return rents;
	}

	public void setRents(Set<Rent> rents) {
		this.rents = rents;
	}

	public Set<Pitch> getPitches() {
		return pitches;
	}

	public void setPitches(Set<Pitch> pitches) {
		this.pitches = pitches;
	}

	public Set<Team> getTeams() {
		return teams;
	}

	public void setTeams(Set<Team> teams) {
		this.teams = teams;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", fullname=" + fullname + ", account=" + account + ", password=" + password
				+ ", email=" + email + ", phoneNumber=" + phoneNumber + ", avatar=" + avatar + ", createdAt="
				+ createdAt + ", updatedAt=" + updatedAt + ", status=" + status + ", teams=" + teams + "]";
	}
	
	
	
}
