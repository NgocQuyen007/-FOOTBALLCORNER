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
import entities.District;
import iplms.IDistrict;

@Repository
@EnableTransactionManagement
public class DistrictDao implements IDistrict {

	@Autowired
	SessionFactory sessionFactory;
	
	private static final String Q_GET_PITCHES_QTY_OF_DISTRICT = 
			  "  SELECT de.zipcode "        + DistrictQuantityDto.PROP_ZIPCODE
			+ ", de.name AS "               + DistrictQuantityDto.PROP_NAME
			+ ", COUNT(ad.dzipcode) "       + DistrictQuantityDto.PROP_QUANTITY
			+ "  FROM devdn_destricts de "
			+ "  JOIN addresses ad ON de.zipcode = ad.dzipcode"
			+ "  GROUP BY (ad.dzipcode) ";

	@Override
	public List<District> getDistricts() {
		Session session = sessionFactory.getCurrentSession();
		String sql = " FROM devdn_destricts ORDER BY name ASC";
		Query query = session.createQuery(sql);
		@SuppressWarnings("unchecked")
		List<District> districts = query.getResultList();
		return districts;
	}

	@Override
	public List<DistrictQuantityDto> getPitchesQuantityofDistricts() {
		Session session = sessionFactory.getCurrentSession();
		
		String queryString = Q_GET_PITCHES_QTY_OF_DISTRICT;
		final NativeQuery query = session.createNativeQuery(queryString);
		
		query.addScalar(DistrictQuantityDto.PROP_ZIPCODE, StandardBasicTypes.INTEGER);
		query.addScalar(DistrictQuantityDto.PROP_NAME, StandardBasicTypes.STRING);
		query.addScalar(DistrictQuantityDto.PROP_QUANTITY, StandardBasicTypes.INTEGER);
		
		query.setResultTransformer(Transformers.aliasToBean(DistrictQuantityDto.class));
		List<DistrictQuantityDto> dtos = query.getResultList();
		
		return dtos;
	}
	
	

}
