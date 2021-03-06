package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.internal.SessionImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import dto.BookingManagerDto;
import entities.Cost;
import entities.Pitch;
import entities.PitchDetail;
import entities.PitchType;
import entities.StadiumDetailStatus;
import entities.User;
import iplms.IStadiumDetailStatus;

@Repository
@EnableTransactionManagement
public class StadiumDetailStatusDao implements IStadiumDetailStatus{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public int countNumberOfPitchAvailableByTime(StadiumDetailStatus stadiumDetailStatus) {
		final Connection conn = getConnection();
		String queryString = "SELECT COUNT(id) soLugSanTrongVoiKhungGio "
				+ "FROM stadium_detail_status "
				+ "WHERE cost_id = ? "
				+ "AND matchday  = ? "
				+ "AND matchtime = ? "
				+ "AND status IN (0,1)";
		try {
			PreparedStatement pst = conn.prepareStatement(queryString);
			pst.setInt(1, stadiumDetailStatus.getCost().getId());
			pst.setString(2, stadiumDetailStatus.getMatchDay());
			pst.setInt(3, stadiumDetailStatus.getMatchTime());
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				return rs.getInt(1);
			}
			
		} catch (final SQLException e) {
			throw new HibernateException(e);
		}
		return 0;
	}
	
	@Override
	public int saveStadiumDetailStatus(StadiumDetailStatus stadiumDetailStatus) {
		final Connection conn = getConnection();
		String queryString = 
				  " INSERT INTO stadium_detail_status(cost_id, matchday, matchtime, user_id, status,"
				+ " created_at, updated_at, phone_number, customer_name, note, matchdatetime, position, is_read) "
				+ " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,0)";
		try {
			PreparedStatement pst = conn.prepareStatement(queryString);
			pst.setInt(1, stadiumDetailStatus.getCost().getId());
			pst.setString(2, stadiumDetailStatus.getMatchDay());
			pst.setInt(3, stadiumDetailStatus.getMatchTime());
			pst.setInt(4, stadiumDetailStatus.getUser().getId());
			pst.setInt(5, stadiumDetailStatus.getStatus());
			pst.setString(6, stadiumDetailStatus.getCreatedAt());
			pst.setString(7, stadiumDetailStatus.getCreatedAt());
			pst.setString(8, stadiumDetailStatus.getPhoneNumber());
			pst.setString(9, stadiumDetailStatus.getCustomerName());
			pst.setString(10, stadiumDetailStatus.getNote());
			pst.setString(11, stadiumDetailStatus.getMatchDateTime());
			pst.setInt(12, stadiumDetailStatus.getPosition());
			return pst.executeUpdate();
			
		} catch (final SQLException e) {
			throw new HibernateException(e);
		}
	}
	
	// Booking Request
	public List<StadiumDetailStatus> getListStadiumDetailStatusByUserIdAndStatus(int userId) {
		final Connection conn = getConnection();
		List<StadiumDetailStatus> results = new ArrayList<>();
		String queryString = "SELECT status.*, detail.pitch_type_id LoaiSan, p.name TenSan  \n" 
				+"FROM stadium_detail_status status\n"
				+"JOIN costs cost ON cost.id = status.cost_id\n"
				+"JOIN pitches_detail detail ON detail.id = cost.pdtail_id\n"
				+"JOIN pitches p ON p.id = detail.pitch_id\n"
				+"JOIN users u ON u.id = p.owner_id\n"
				+ "WHERE u.id = ? AND status.status = 0";
		try {
			try(PreparedStatement pst = conn.prepareStatement(queryString)) {
				pst.setInt(1, userId);
				final ResultSet rs = pst.executeQuery();
				while (rs.next()) {
					PitchType pitchType= new PitchType(); pitchType.setId(rs.getInt("LoaiSan"));
					Pitch pitch = new Pitch(); pitch.setName(rs.getString("TenSan"));
					PitchDetail pitchDetail = new PitchDetail(); 
					pitchDetail.setPitchType(pitchType);
					pitchDetail.setPitch(pitch);
					
					Cost cost = new Cost(); cost.setId(rs.getInt("cost_id")); cost.setPitchDetail(pitchDetail);
					
					User user = new User(); user.setId(rs.getInt("user_id")); 
					StadiumDetailStatus itemStatus = new StadiumDetailStatus(rs.getInt("id"), cost, rs.getString("matchday"), rs.getInt("matchtime"), user, rs.getInt("status"), rs.getString("created_at"), rs.getString("customer_name"), rs.getString("phone_number"), rs.getString("note"));
					itemStatus.setMatchDateTime(rs.getString("matchdatetime"));
					itemStatus.setPosition(rs.getInt("position"));
					results.add(itemStatus);
				}
				return results;
			}
		} catch (final SQLException e) {
			throw new HibernateException(e);
		}
	}
	
	@Override
	public int approveBoookingRequest(int id) {
		final Connection conn = getConnection();
		String queryString = "UPDATE stadium_detail_status "
				+ "SET status = 1 "
				+ "WHERE id = ?";
		try {
			try(PreparedStatement pst = conn.prepareStatement(queryString)) {
				pst.setInt(1, id);
				return pst.executeUpdate();
			}
		} catch (final SQLException e) {
			throw new HibernateException(e);
		}
	}
	
	@Override
	public int rejectBoookingRequest(int id) {
		final Connection conn = getConnection();
		String queryString = "UPDATE stadium_detail_status "
				+ "SET status = 2 "
				+ "WHERE id = ?";
		try {
			try(PreparedStatement pst = conn.prepareStatement(queryString)) {
				pst.setInt(1, id);
				return pst.executeUpdate();
			}
		} catch (final SQLException e) {
			throw new HibernateException(e);
		}
	}
	
	@Override
	public List<StadiumDetailStatus> getNotifications(int userId) {
		final Connection conn = getConnection();
		List<StadiumDetailStatus> results = new ArrayList<>();
		String queryString = "SELECT status.*, detail.pitch_type_id LoaiSan, p.name TenSan \n" 
				+"FROM stadium_detail_status status\n"
				+"JOIN costs cost ON cost.id = status.cost_id\n"
				+"JOIN pitches_detail detail ON detail.id = cost.pdtail_id\n"
				+"JOIN pitches p ON p.id = detail.pitch_id\n"
				+"JOIN users u ON u.id = p.owner_id\n"
				+ "WHERE status.user_id = ? AND status.status IN (1,2) AND is_read = 0 \n"
				+ "ORDER BY status.created_at DESC";
		try {
			try(PreparedStatement pst = conn.prepareStatement(queryString)) {
				pst.setInt(1, userId);
				final ResultSet rs = pst.executeQuery();
				while (rs.next()) {
					PitchType pitchType= new PitchType(); pitchType.setId(rs.getInt("LoaiSan"));
					Pitch pitch = new Pitch(); pitch.setName(rs.getString("TenSan"));
					PitchDetail pitchDetail = new PitchDetail(); 
					pitchDetail.setPitchType(pitchType);
					pitchDetail.setPitch(pitch);
					
					Cost cost = new Cost(); cost.setId(rs.getInt("cost_id")); cost.setPitchDetail(pitchDetail);
					
					User user = new User(); user.setId(rs.getInt("user_id")); 
					StadiumDetailStatus itemStatus = new StadiumDetailStatus(rs.getInt("id"), cost, rs.getString("matchday"), rs.getInt("matchtime"), user, rs.getInt("status"), rs.getString("created_at"), rs.getString("customer_name"), rs.getString("phone_number"), rs.getString("note"));
					itemStatus.setMatchDateTime(rs.getString("matchdatetime"));
					itemStatus.setPosition(rs.getInt("position"));
					results.add(itemStatus);
				}
				return results;
			}
		} catch (final SQLException e) {
			throw new HibernateException(e);
		}
	}

	@Override
	public List<BookingManagerDto> getStadiumBookingManagers(int stadiumId) {
		final Connection conn = getConnection();
		List<BookingManagerDto> bookingManagerDtos = new ArrayList<>();
		String queryString = "SELECT p.id, p.hour_start, p.hour_end, "
				+ "pd.pitch_type_id loaiSan, pd.quantity soLuong, pd.id pitchDetailId "
				+ "FROM pitches p "
				+ "JOIN pitches_detail pd "
				+ "ON pd.pitch_id = p.id "
				+ "WHERE p.id = ? ";
		try {
			try(PreparedStatement pst = conn.prepareStatement(queryString)) {
				pst.setInt(1, stadiumId);
				final ResultSet rs = pst.executeQuery();
				while (rs.next()) {
					BookingManagerDto bookingManagerDto = new BookingManagerDto(rs.getInt("p.id"), rs.getInt("p.hour_start"), 
							rs.getInt("p.hour_end"), rs.getInt("loaiSan"), rs.getInt("soLuong"), null, rs.getInt("pitchDetailId"));
					bookingManagerDtos.add(bookingManagerDto);
				}
				return bookingManagerDtos;
			}
		} catch (final SQLException e) {
			throw new HibernateException(e);
		}
	}
	
	@Override
	public List<StadiumDetailStatus> getListStadiumDetailStatusByMatchDayAndPitchId(String matchDay, int stadiumId) {
		final Connection conn = getConnection();
		List<StadiumDetailStatus> results = new ArrayList<>();
		String queryString = "SELECT status.*, detail.pitch_type_id LoaiSan, p.name TenSan \n" 
				+"FROM stadium_detail_status status\n"
				+"JOIN costs cost ON cost.id = status.cost_id\n"
				+"JOIN pitches_detail detail ON detail.id = cost.pdtail_id\n"
				+"JOIN pitches p ON p.id = detail.pitch_id\n"
				+"JOIN users u ON u.id = p.owner_id\n"
				+ "WHERE p.id = ? AND status.matchday=? AND status.status IN (1)";
		try {
			try(PreparedStatement pst = conn.prepareStatement(queryString)) {
				pst.setInt(1, stadiumId);
				pst.setString(2, matchDay);
				final ResultSet rs = pst.executeQuery();
				while (rs.next()) {
					PitchType pitchType= new PitchType(); pitchType.setId(rs.getInt("LoaiSan"));
					Pitch pitch = new Pitch(); pitch.setName(rs.getString("TenSan"));
					PitchDetail pitchDetail = new PitchDetail(); 
					pitchDetail.setPitchType(pitchType);
					pitchDetail.setPitch(pitch);
					
					Cost cost = new Cost(); cost.setId(rs.getInt("cost_id")); cost.setPitchDetail(pitchDetail);
					
					User user = new User(); user.setId(rs.getInt("user_id")); 
					StadiumDetailStatus itemStatus = new StadiumDetailStatus(rs.getInt("id"), cost, rs.getString("matchday"), rs.getInt("matchtime"), user, rs.getInt("status"), rs.getString("created_at"), rs.getString("customer_name"), rs.getString("phone_number"), rs.getString("note"));
					itemStatus.setMatchDateTime(rs.getString("matchdatetime"));
					itemStatus.setPosition(rs.getInt("position"));
					results.add(itemStatus);
				}
				return results;
			}
		} catch (final SQLException e) {
			throw new HibernateException(e);
		}
	}
	
	@Override
	public int getMaxPositionOfStadiimDetail(StadiumDetailStatus stadiumDetailStatus) {
		final Connection conn = getConnection();
		String queryString = "SELECT MAX(position) "
				+ "FROM stadium_detail_status "
				+ "WHERE cost_id   = ? "
				+ "AND matchday  = ? "
				+ "AND matchtime = ? "
				+ "AND status IN (0,1)";
		try {
			try(PreparedStatement pst = conn.prepareStatement(queryString)) {
				pst.setInt(1, stadiumDetailStatus.getCost().getId());
				pst.setString(2, stadiumDetailStatus.getMatchDay());
				pst.setInt(3, stadiumDetailStatus.getMatchTime());
				final ResultSet rs = pst.executeQuery();
				while (rs.next()) {
					return rs.getInt(1);
				}
			}
		} catch (final SQLException e) {
			throw new HibernateException(e);
		}
		return 0;
	}
	
	@Override
	public int saveBooking(StadiumDetailStatus status) {
		final Connection conn = getConnection();
		String queryString = "UPDATE stadium_detail_status "
				+ "SET customer_name = ?, phone_number = ?, note = ? "
				+ "WHERE id = ?";
		try {
			try(PreparedStatement pst = conn.prepareStatement(queryString)) {
				pst.setString(1, status.getCustomerName());
				pst.setString(2, status.getPhoneNumber());
				pst.setString(3, status.getNote());
				pst.setInt(4, status.getId());
				return pst.executeUpdate();
			}
		} catch (final SQLException e) {
			throw new HibernateException(e);
		}
	}
	
	@Override
	public int updateNotificationsToBeSeen(int id) {
		final Connection conn = getConnection();
		String queryString = "UPDATE stadium_detail_status "
				+ "SET is_read = 1 "
				+ "WHERE user_id = ?";
		try {
			try(PreparedStatement pst = conn.prepareStatement(queryString)) {
				pst.setInt(1, id);
				return pst.executeUpdate();
			}
		} catch (final SQLException e) {
			throw new HibernateException(e);
		}
	}
	
	private Connection getConnection() {
		return ((SessionImpl) sessionFactory.getCurrentSession()).connection();
	}

	
	
}
