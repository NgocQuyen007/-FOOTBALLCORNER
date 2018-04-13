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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity(name = "users")
public class User implements Serializable {
	private static final long serialVersionUID = 8048316863241179933L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String fullname;
	private String account;
	private String password;
	private String email;
	private String phoneNumber;
	private String avatar;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private boolean status;

	@Column(name = "reset_password_token", nullable = true)
	private String resetPasswordToken;

	@Column(name = "reset_password_send_at", nullable = true)
	private String resetPasswordSendAt;

	@Column(name = "current_sign_in_at", nullable = true)
	private String currentSigninAt;

	@Column(name = "last_sign_in_at", nullable = true)
	private String lastSigninAt;

	@Column(name = "current_sign_in_ip", nullable = true)
	private String currentSigninIP;

	@Column(name = "last_sign_in_ip", nullable = true)
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
	Set<Comment> comments;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id", referencedColumnName = "id")
	Set<Rent> rents;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "owner_id", referencedColumnName = "id")
	Set<Pitch> pitches;

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

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getResetPasswordToken() {
		return resetPasswordToken;
	}

	public void setResetPasswordToken(String resetPasswordToken) {
		this.resetPasswordToken = resetPasswordToken;
	}

	public String getResetPasswordSendAt() {
		return resetPasswordSendAt;
	}

	public void setResetPasswordSendAt(String resetPasswordSendAt) {
		this.resetPasswordSendAt = resetPasswordSendAt;
	}

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

	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
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
	
}
