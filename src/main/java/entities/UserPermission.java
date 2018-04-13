package entities;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity(name = "user_permissions")
public class UserPermission implements Serializable {
	private static final long serialVersionUID = 3565284434938167553L;

	@Id
	private String id;

	private String name;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "user_permission_id", referencedColumnName = "id")
	Set<User> users;

	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable( name = "authentications", 
				joinColumns = { @JoinColumn(name = "user_permission_id", referencedColumnName = "id") },
				inverseJoinColumns = { @JoinColumn(name = "access_permission_id", referencedColumnName = "id") })
	Set<AccessPermission> accessPermissions;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public Set<AccessPermission> getAccessPermissions() {
		return accessPermissions;
	}

	public void setAccessPermissions(Set<AccessPermission> accessPermissions) {
		this.accessPermissions = accessPermissions;
	}
	
	
}
