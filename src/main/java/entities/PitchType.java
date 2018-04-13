package entities;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity(name = "pitch_type")
public class PitchType implements Serializable {
	private static final long serialVersionUID = -5525699985990574720L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	@Column(name = "max_quantity")
	int maxQuantity;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "pitch_type_id", referencedColumnName = "id")
	Set<PitchDetail> pitchDetails;

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

	public int getMaxQuantity() {
		return maxQuantity;
	}

	public void setMaxQuantity(int maxQuantity) {
		this.maxQuantity = maxQuantity;
	}

	public Set<PitchDetail> getPitchDetails() {
		return pitchDetails;
	}

	public void setPitchDetails(Set<PitchDetail> pitchDetails) {
		this.pitchDetails = pitchDetails;
	}
	
}
