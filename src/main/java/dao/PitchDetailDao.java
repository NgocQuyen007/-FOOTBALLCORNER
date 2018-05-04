package dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.transform.Transformers;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import dto.DistrictQuantityDto;
import dto.PitchTypeQuantityDto;
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
	
	
	
}
