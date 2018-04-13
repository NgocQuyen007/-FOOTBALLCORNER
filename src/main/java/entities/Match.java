package entities;

import java.io.Serializable;
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

@Entity(name = "matches")
public class Match implements Serializable{
	private static final long serialVersionUID = 270863940759776256L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="available_quantity")
	private int availableQuantity;
	
	private int maxQuantity;
	
	@ManyToOne(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	@JoinColumn(name="rent_id", referencedColumnName = "id", nullable = false)
	private Rent rent;
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="match_id", referencedColumnName = "id")
	Set<MatchUser> matchUsers;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAvailableQuantity() {
		return availableQuantity;
	}

	public void setAvailableQuantity(int availableQuantity) {
		this.availableQuantity = availableQuantity;
	}

	public int getMaxQuantity() {
		return maxQuantity;
	}

	public void setMaxQuantity(int maxQuantity) {
		this.maxQuantity = maxQuantity;
	}

	public Rent getRent() {
		return rent;
	}

	public void setRent(Rent rent) {
		this.rent = rent;
	}

	public Set<MatchUser> getMatchUsers() {
		return matchUsers;
	}

	public void setMatchUsers(Set<MatchUser> matchUsers) {
		this.matchUsers = matchUsers;
	}
	
}
