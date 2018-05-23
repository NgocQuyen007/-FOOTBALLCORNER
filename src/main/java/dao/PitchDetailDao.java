package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.internal.SessionImpl;
import org.hibernate.query.NativeQuery;
import org.hibernate.transform.Transformers;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import dto.DistrictQuantityDto;
import dto.PitchTypeQuantityDto;
import entities.Address;
import entities.PitchDetail;
import iplms.IPitchDetail;

@Repository
@EnableTransactionManagement
public class PitchDetailDao implements IPitchDetail{

	@Autowired
	SessionFactory sessionFactory;
	
	private static final String Q_GET_PITCHES_QTY_OF_PITCH_TYPE = 
			"SELECT pitch_type_id " + PitchTypeQuantityDto.PROP_PITCH_TYPE_ID
			+ " , COUNT(*) "        + PitchTypeQuantityDto.PROP_QUANTITY
			+ " FROM pitches_detail"
			+ " GROUP BY pitch_type_id ";
	
	@Override
	public List<PitchTypeQuantityDto> getPitchesQuantityofPitchType() {
		Session session = sessionFactory.getCurrentSession();
		
		String queryString = Q_GET_PITCHES_QTY_OF_PITCH_TYPE;
		final NativeQuery query = session.createNativeQuery(queryString);
		
		query.addScalar(PitchTypeQuantityDto.PROP_PITCH_TYPE_ID, StandardBasicTypes.INTEGER);
		query.addScalar(DistrictQuantityDto.PROP_QUANTITY, StandardBasicTypes.INTEGER);
		
		// mapping 'as' with parameter in scalar
		query.setResultTransformer(Transformers.aliasToBean(PitchTypeQuantityDto.class));
		List<PitchTypeQuantityDto> dtos = query.getResultList();
		
		return dtos;
	}

	@Override
	public List<PitchDetail> getPitchDetails() {
		Session session = sessionFactory.getCurrentSession();
		String sql = " FROM pitches_detail ";
		Query query = session.createQuery(sql);
		@SuppressWarnings("unchecked")
		List<PitchDetail> pitchDetails = query.getResultList();
		return pitchDetails;
	}

	@Override
	public Map<Integer, Integer> insertPitchDetail(PitchDetail pitchDetail) {
		// insertion order
		Map<Integer, Integer> map = new LinkedHashMap<>();
		int id = 0;
		Connection conn = getConnection();
		String queryString = " INSERT INTO pitches_detail(pitch_type_id, pitch_id) "
						   + " VALUES(?,?)";
		PreparedStatement pst;
		try {
			pst = conn.prepareStatement(queryString, PreparedStatement.RETURN_GENERATED_KEYS);
			pst.setInt(1, pitchDetail.getPitchType().getId());
			pst.setInt(2, pitchDetail.getPitch().getId());
			pst.executeUpdate();
			ResultSet rs = pst.getGeneratedKeys();
			while(rs.next()) {
				id = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		map.put(id, pitchDetail.getPitchType().getId());
		return map;
	}
	
		
	private Connection getConnection() {
		return ((SessionImpl) sessionFactory.getCurrentSession()).connection();
	} 
	
	
	
}
