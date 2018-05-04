package entities;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name = "costs")
public class Cost implements Serializable {
	private static final long serialVersionUID = 2600168796160752328L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "hour_start")
	private int hourStart;

	@Column(name = "hour_end")
	private int hourEnd;

	@Column(name = "wday_start")
	private int wdayStart;
	
	@Column(name = "wday_end")
	private int wdayEnd;
	
	private int price;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "pdtail_id", referencedColumnName = "id")
	private PitchDetail pitchDetail;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getHourStart() {
		return hourStart;
	}

	public void setHourStart(int hourStart) {
		this.hourStart = hourStart;
	}

	public int getHourEnd() {
		return hourEnd;
	}

	public void setHourEnd(int hourEnd) {
		this.hourEnd = hourEnd;
	}

	public int getWdayStart() {
		return wdayStart;
	}

	public void setWdayStart(int wdayStart) {
		this.wdayStart = wdayStart;
	}

	public int getWdayEnd() {
		return wdayEnd;
	}

	public void setWdayEnd(int wdayEnd) {
		this.wdayEnd = wdayEnd;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public PitchDetail getPitchDetail() {
		return pitchDetail;
	}

	public void setPitchDetail(PitchDetail pitchDetail) {
		this.pitchDetail = pitchDetail;
	}
	
	public Cost() {}

	public Cost(int id, int hourStart, int hourEnd, int wdayStart, int wdayEnd, int price) {
		super();
		this.id = id;
		this.hourStart = hourStart;
		this.hourEnd = hourEnd;
		this.wdayStart = wdayStart;
		this.wdayEnd = wdayEnd;
		this.price = price;
	}

	@Override
	public String toString() {
		return "Cost [id=" + id + ", hourStart=" + hourStart + ", hourEnd=" + hourEnd + ", wdayStart=" + wdayStart
				+ ", wdayEnd=" + wdayEnd + ", price=" + price + "]";
	}
	
}
