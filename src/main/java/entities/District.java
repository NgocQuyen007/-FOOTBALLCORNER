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

@Entity(name = "devdn_destricts")
public class District implements Serializable{
	private static final long serialVersionUID = 7791749743694813291L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int zipCode;
	
	private String name;
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="dzipcode", referencedColumnName="zipcode")
	Set<Address> addresses;
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="dzipcode", referencedColumnName="zipcode")
	Set<Team> teams;

	public int getZipCode() {
		return zipCode;
	}

	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(Set<Address> addresses) {
		this.addresses = addresses;
	}

	public Set<Team> getTeams() {
		return teams;
	}

	public void setTeams(Set<Team> teams) {
		this.teams = teams;
	}
	
}
