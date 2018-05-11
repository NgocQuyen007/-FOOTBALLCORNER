package entities;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity(name = "levels")
public class Level implements Serializable{
	private static final long serialVersionUID = -2140450265059522025L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "level_id", referencedColumnName = "id")
	Set<Team> teams;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "level_id", referencedColumnName = "id")
	Set<Event> events;

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

	public Set<Team> getTeams() {
		return teams;
	}

	public void setTeams(Set<Team> teams) {
		this.teams = teams;
	}
	
}
