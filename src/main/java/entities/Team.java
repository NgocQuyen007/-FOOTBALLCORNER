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

@Entity(name = "teams")
public class Team implements Serializable {
	private static final long serialVersionUID = -3969113757173900017L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String name;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "dzipcode", referencedColumnName = "zipcode", nullable = false)
	private District district;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "level_id", referencedColumnName = "id", nullable = false)
	private Level level;

	private String logo;
	
	@Column(name="team_image")
	private String teamImage;
	
	@Column(name="min_age")
	private int minAge;
	
	@Column(name="max_age")
	private int maxAge;
	
	private String description;
	
	@Column(name="created_at")
	private Timestamp createdAt;

	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable( name = "teamplayers",
			joinColumns = {@JoinColumn(name = "team_id", referencedColumnName = "id")}, 
	    inverseJoinColumns = {@JoinColumn(name = "user_id",  referencedColumnName = "id") } )
	Set<User> users;

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

	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public Level getLevel() {
		return level;
	}

	public void setLevel(Level level) {
		this.level = level;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getTeamImage() {
		return teamImage;
	}

	public void setTeamImage(String teamImage) {
		this.teamImage = teamImage;
	}

	public int getMinAge() {
		return minAge;
	}

	public void setMinAge(int minAge) {
		this.minAge = minAge;
	}

	public int getMaxAge() {
		return maxAge;
	}

	public void setMaxAge(int maxAge) {
		this.maxAge = maxAge;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "Team [id=" + id + ", name=" + name + ", district=" + district + ", level=" + level + ", logo=" + logo
				+ ", teamImage=" + teamImage + ", minAge=" + minAge + ", maxAge=" + maxAge + ", description="
				+ description + ", createdAt=" + createdAt + ", users=" + users + "]";
	}
	
}
