package entities;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity(name = "access_permisssions")
public class AccessPermission implements Serializable {

	private static final long serialVersionUID = -2993430032234189945L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String description;

	@ManyToMany(cascade = { CascadeType.ALL })
	@JoinTable( name = "authentications", 
				joinColumns = { @JoinColumn(name = "access_permission_id", referencedColumnName = "id") }, 
				inverseJoinColumns = { @JoinColumn(name = "user_permission_id", referencedColumnName = "id") })
	Set<UserPermission> userPermissions;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<UserPermission> getUserPermissions() {
		return userPermissions;
	}

	public void setUserPermissions(Set<UserPermission> userPermissions) {
		this.userPermissions = userPermissions;
	}
	
}
