package entities;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity(name = "pitches_detail")
public class PitchDetail implements Serializable {
	private static final long serialVersionUID = -2707551284590287210L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "pitch_type_id", referencedColumnName = "id", nullable = false)
	PitchType pitchType;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "pitch_id", referencedColumnName = "id", nullable = false)
	Pitch pitch;
	
	/** Số lượng miniPitch của loại sân. */
	private Integer quantity;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "pitch_detail_id", referencedColumnName = "id")
	Set<Promotion> promotions;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "pitch_detail_id", referencedColumnName = "id")
	Set<MiniPitch> miniPitchs;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "pdtail_id", referencedColumnName = "id")
	Set<Cost> costs;
	
	public PitchDetail() {
	}
	
	public PitchDetail(int id, PitchType pitchType, Pitch pitch) {
		super();
		this.id = id;
		this.pitchType = pitchType;
		this.pitch = pitch;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public PitchType getPitchType() {
		return pitchType;
	}

	public void setPitchType(PitchType pitchType) {
		this.pitchType = pitchType;
	}

	public Pitch getPitch() {
		return pitch;
	}

	public void setPitch(Pitch pitch) {
		this.pitch = pitch;
	}

	public Set<Promotion> getPromotions() {
		return promotions;
	}

	public void setPromotions(Set<Promotion> promotions) {
		this.promotions = promotions;
	}

	public Set<MiniPitch> getMiniPitchs() {
		return miniPitchs;
	}

	public void setMiniPitchs(Set<MiniPitch> miniPitchs) {
		this.miniPitchs = miniPitchs;
	}

	public Set<Cost> getCosts() {
		return costs;
	}

	public void setCosts(Set<Cost> costs) {
		this.costs = costs;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
}