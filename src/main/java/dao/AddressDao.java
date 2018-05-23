package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.internal.SessionImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import entities.Address;
import iplms.IAddress;

@Repository
@EnableTransactionManagement
public class AddressDao implements IAddress{

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public int insertAddress(Address address) {
		int id = 0;
		Connection conn = getConnection();
		String queryString = " INSERT INTO addresses(detail, phone_number, facebook, website, pemail, created_at, updated_at, pitch_id, dzipcode) "
						   + " VALUES(?,?,?,?,?,?,?,?,?)";
		PreparedStatement pst;
		try {
			pst = conn.prepareStatement(queryString, PreparedStatement.RETURN_GENERATED_KEYS);
			pst.setString(1, address.getDetail());pst.setString(6, address.getCreatedAt());
			pst.setString(2, address.getPhoneNumber());pst.setString(7, address.getUpdatedAt());
			pst.setString(3, address.getFacebook());pst.setInt(8, address.getPitch().getId());
			pst.setString(4, address.getWebsite());pst.setInt(9, address.getDistrict().getZipcode());
			pst.setString(5, address.getPemail());
			pst.executeUpdate();
			ResultSet rs = pst.getGeneratedKeys();
			while(rs.next()) {
				id = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id > 0 ? id : id;
	}
	
	private Connection getConnection() {
		return ((SessionImpl) sessionFactory.getCurrentSession()).connection();
	} 
	
	
}
