package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import javax.persistence.Query;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.internal.SessionImpl;
import org.hibernate.query.NativeQuery;
import org.hibernate.transform.Transformers;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import dto.PitchInfoDto;
import entities.Pitch;
import iplms.IPitch;

@Repository
@EnableTransactionManagement
public class PitchDao implements IPitch{

	@Autowired
	SessionFactory sessionFactory;
	
	private static final String Q_GET_LIST_PITCH_DETAIL_INFO_X = 
			  " SELECT p.id              " + PitchInfoDto.PROP_PITCH_ID
			  + ", p.name                " + PitchInfoDto.PROP_PITCH_NAME
			  + ", p.cover_avatar        " + PitchInfoDto.PROP_PITCH_AVATAR
			  + ", p.description         " + PitchInfoDto.PROP_PITCH_DESCRIPTION
			  + ", a.detail              " + PitchInfoDto.PROP_ADDRESS
			  + ", a.phone_number        " + PitchInfoDto.PROP_PHONE_NUMBER
			  + ", a.facebook            " + PitchInfoDto.PROP_FACEBOOK
			  + ", a.website             " + PitchInfoDto.PROP_WEBSITE
			  + ", u.fullname            " + PitchInfoDto.PROP_OWNER_FULLNAME
			  + ", u.email               " + PitchInfoDto.PROP_OWNER_EMAIL
			  + ", dev_des.zipcode       " + PitchInfoDto.PROP_DESTRICT_ZIPCODE
			  + ", dev_des.name          " + PitchInfoDto.PROP_DESTRICT_NAME
			  + ", p_d.id                " + PitchInfoDto.PROP_PITCH_DETAIL_ID
			  + ", p_d.pitch_type_id     " + PitchInfoDto.PROP_PITCH_TYPE_ID
			  + ", p_d.pitch_id          " 
			  + ", c.id                  " + PitchInfoDto.PROP_COST_ID
			  + ", c.hour_start          " + PitchInfoDto.PROP_HOUR_START
			  + ", c.hour_end            " + PitchInfoDto.PROP_HOUR_END
			  + ", c.wday_start          " + PitchInfoDto.PROP_WDAY_START
			  + ", c.wday_end            " + PitchInfoDto.PROP_WDAY_END 
			  + ", c.price               " + PitchInfoDto.PROP_COST_PRICE
			  + ", c.pdtail_id           " 
			  + " FROM pitches p         " 
			  + " LEFT JOIN addresses a ON a.pitch_id = p.id"
			  + " JOIN devdn_destricts dev_des ON dev_des.zipcode = a.dzipcode"
			  + " LEFT JOIN pitches_detail p_d ON p_d.pitch_id = p.id"
			  + " LEFT JOIN costs c ON c.pdtail_id = p_d.id"
			  + " LEFT JOIN users u ON u.id = p.owner_id";
	
	@Override
	public List<PitchInfoDto> getListPitchInfo() {
		Session session = sessionFactory.getCurrentSession();
		
		String queryString = Q_GET_LIST_PITCH_DETAIL_INFO_X
				             + " ORDER BY p.id DESC ";
		final NativeQuery query = session.createNativeQuery(queryString);
		
		query.addScalar(PitchInfoDto.PROP_PITCH_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_PITCH_NAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PITCH_AVATAR, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PITCH_DESCRIPTION, StandardBasicTypes.STRING);
		
		query.addScalar(PitchInfoDto.PROP_ADDRESS, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PHONE_NUMBER, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_FACEBOOK, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_WEBSITE, StandardBasicTypes.STRING);
		
		query.addScalar(PitchInfoDto.PROP_OWNER_FULLNAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_OWNER_EMAIL, StandardBasicTypes.STRING);
		
		query.addScalar(PitchInfoDto.PROP_DESTRICT_NAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_DESTRICT_ZIPCODE, StandardBasicTypes.INTEGER);
		
		
		query.addScalar(PitchInfoDto.PROP_PITCH_DETAIL_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_PITCH_TYPE_ID, StandardBasicTypes.INTEGER);
		
		query.addScalar(PitchInfoDto.PROP_COST_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_HOUR_START, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_HOUR_END, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_WDAY_START, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_WDAY_END, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_COST_PRICE, StandardBasicTypes.INTEGER);
		
		
		// mapping 'as' with parameter in scalar
		query.setResultTransformer(Transformers.aliasToBean(PitchInfoDto.class));
		List<PitchInfoDto> dtos = query.getResultList();
		
		
		return dtos;
	}
	
	@Override
	public List<PitchInfoDto> getListPitchInfo(int offset, int rowCount) {
		Session session = sessionFactory.getCurrentSession();
		
		String queryString = Q_GET_LIST_PITCH_DETAIL_INFO_X;
		final NativeQuery query = session.createNativeQuery(queryString);
		
		query.addScalar(PitchInfoDto.PROP_PITCH_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_PITCH_NAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PITCH_AVATAR, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PITCH_DESCRIPTION, StandardBasicTypes.STRING);
		
		query.addScalar(PitchInfoDto.PROP_ADDRESS, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PHONE_NUMBER, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_FACEBOOK, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_WEBSITE, StandardBasicTypes.STRING);
		
		query.addScalar(PitchInfoDto.PROP_OWNER_FULLNAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_OWNER_EMAIL, StandardBasicTypes.STRING);
		
		query.addScalar(PitchInfoDto.PROP_DESTRICT_NAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_DESTRICT_ZIPCODE, StandardBasicTypes.INTEGER);
		
		
		query.addScalar(PitchInfoDto.PROP_PITCH_DETAIL_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_PITCH_TYPE_ID, StandardBasicTypes.INTEGER);
		
		query.addScalar(PitchInfoDto.PROP_COST_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_HOUR_START, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_HOUR_END, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_WDAY_START, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_WDAY_END, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_COST_PRICE, StandardBasicTypes.INTEGER);
		
		query.setFirstResult(offset).setMaxResults(rowCount);
		
		// mapping 'as' with parameter in scalar
		query.setResultTransformer(Transformers.aliasToBean(PitchInfoDto.class));
		List<PitchInfoDto> dtos = query.getResultList();
		
		if(dtos.size() > 0) {
			return dtos;
		}
		
		return Collections.emptyList();
	}

	@Override
	public List<PitchInfoDto> getListPitchInfoByNameOrAdress(String key) {
		Session session = sessionFactory.getCurrentSession();
		
		String queryString = Q_GET_LIST_PITCH_DETAIL_INFO_X 
						+ " WHERE p.name LIKE :pname OR a.detail LIKE :adetail ";
		final NativeQuery query = session.createNativeQuery(queryString);
		
		query.addScalar(PitchInfoDto.PROP_PITCH_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_PITCH_NAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PITCH_AVATAR, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PITCH_DESCRIPTION, StandardBasicTypes.STRING);
		
		query.addScalar(PitchInfoDto.PROP_ADDRESS, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PHONE_NUMBER, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_FACEBOOK, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_WEBSITE, StandardBasicTypes.STRING);
		
		query.addScalar(PitchInfoDto.PROP_OWNER_FULLNAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_OWNER_EMAIL, StandardBasicTypes.STRING);
		
		query.addScalar(PitchInfoDto.PROP_DESTRICT_NAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_DESTRICT_ZIPCODE, StandardBasicTypes.INTEGER);
		
		
		query.addScalar(PitchInfoDto.PROP_PITCH_DETAIL_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_PITCH_TYPE_ID, StandardBasicTypes.INTEGER);
		
		query.addScalar(PitchInfoDto.PROP_COST_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_HOUR_START, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_HOUR_END, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_WDAY_START, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_WDAY_END, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_COST_PRICE, StandardBasicTypes.INTEGER);
		
		query.setParameter("pname", '%'+key+'%');
		query.setParameter("adetail", '%'+key+'%');
		
		// mapping 'as' with parameter in scalar
		query.setResultTransformer(Transformers.aliasToBean(PitchInfoDto.class));
		List<PitchInfoDto> dtos = query.getResultList();
		
		if(dtos.size() > 0) {
			return dtos;
		}
		return Collections.emptyList();
	}
	
	@Override
	public List<PitchInfoDto> getListPitchInfoByZipCode(int zipcode) {
Session session = sessionFactory.getCurrentSession();
		
		String queryString = Q_GET_LIST_PITCH_DETAIL_INFO_X 
						+ " WHERE dev_des.zipcode = :zipcode ";
		final NativeQuery query = session.createNativeQuery(queryString);
		
		query.addScalar(PitchInfoDto.PROP_PITCH_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_PITCH_NAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PITCH_AVATAR, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PITCH_DESCRIPTION, StandardBasicTypes.STRING);
		
		query.addScalar(PitchInfoDto.PROP_ADDRESS, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PHONE_NUMBER, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_FACEBOOK, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_WEBSITE, StandardBasicTypes.STRING);
		
		query.addScalar(PitchInfoDto.PROP_OWNER_FULLNAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_OWNER_EMAIL, StandardBasicTypes.STRING);
		
		query.addScalar(PitchInfoDto.PROP_DESTRICT_NAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_DESTRICT_ZIPCODE, StandardBasicTypes.INTEGER);
		
		
		query.addScalar(PitchInfoDto.PROP_PITCH_DETAIL_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_PITCH_TYPE_ID, StandardBasicTypes.INTEGER);
		
		query.addScalar(PitchInfoDto.PROP_COST_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_HOUR_START, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_HOUR_END, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_WDAY_START, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_WDAY_END, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_COST_PRICE, StandardBasicTypes.INTEGER);
		
		query.setParameter("zipcode", zipcode);
		
		// mapping 'as' with parameter in scalar
		query.setResultTransformer(Transformers.aliasToBean(PitchInfoDto.class));
		List<PitchInfoDto> dtos = query.getResultList();
		
		if(dtos.size() > 0) {
			return dtos;
		}
		return Collections.emptyList();
	}
	
	@Override
	public List<PitchInfoDto> getListPitchInfoByNameOrAdressAndZipcode(int zipcode, String keyword) {
		Session session = sessionFactory.getCurrentSession();
		
		String queryString = Q_GET_LIST_PITCH_DETAIL_INFO_X 
						+ " WHERE (p.name LIKE :pname OR a.detail LIKE :adetail) "
						+ " AND dev_des.zipcode = :zipcode";
		final NativeQuery query = session.createNativeQuery(queryString);
		
		query.addScalar(PitchInfoDto.PROP_PITCH_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_PITCH_NAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PITCH_AVATAR, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PITCH_DESCRIPTION, StandardBasicTypes.STRING);
		
		query.addScalar(PitchInfoDto.PROP_ADDRESS, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PHONE_NUMBER, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_FACEBOOK, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_WEBSITE, StandardBasicTypes.STRING);
		
		query.addScalar(PitchInfoDto.PROP_OWNER_FULLNAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_OWNER_EMAIL, StandardBasicTypes.STRING);
		
		query.addScalar(PitchInfoDto.PROP_DESTRICT_NAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_DESTRICT_ZIPCODE, StandardBasicTypes.INTEGER);
		
		
		query.addScalar(PitchInfoDto.PROP_PITCH_DETAIL_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_PITCH_TYPE_ID, StandardBasicTypes.INTEGER);
		
		query.addScalar(PitchInfoDto.PROP_COST_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_HOUR_START, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_HOUR_END, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_WDAY_START, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_WDAY_END, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_COST_PRICE, StandardBasicTypes.INTEGER);
		
		query.setParameter("pname", '%'+keyword+'%');
		query.setParameter("adetail", '%'+keyword+'%');
		query.setParameter("zipcode", zipcode);
		
		// mapping 'as' with parameter in scalar
		query.setResultTransformer(Transformers.aliasToBean(PitchInfoDto.class));
		List<PitchInfoDto> dtos = query.getResultList();
		
		if(dtos.size() > 0) {
			return dtos;
		}
		return Collections.emptyList();
	}
	
	
	@Override
	public Pitch getPitchByID(int pid) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "FROM pitches " 
				   + "WHERE id = :pid";
		Query query = session.createQuery(sql);
		query.setParameter("pid", pid);
		Pitch pitch = (Pitch) query.getSingleResult();
		return pitch;
	}

	@Override
	public int countAllRows() {
		Session session= sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Pitch.class).setProjection(Projections.rowCount());
		return Integer.parseInt(criteria.uniqueResult().toString());
	}

	@Override
	public List<PitchInfoDto> getListPitchInfo(int zipcode, String pricesKey, String numberofplayersKey,
			String keyword) {
		Session session = sessionFactory.getCurrentSession();
		String queryString = Q_GET_LIST_PITCH_DETAIL_INFO_X 
						 + " WHERE dev_des.zipcode = :zipcode ";
		if (!StringUtils.isEmpty(pricesKey)) {
			queryString += " AND c.price IN ("+pricesKey+")";
		}
		if (!StringUtils.isEmpty(numberofplayersKey)) {
			queryString += " AND p_d.pitch_type_id IN ("+numberofplayersKey+")";
		}
		if (!StringUtils.isEmpty(keyword)) {
			queryString += " AND (p.name LIKE :pname OR a.detail LIKE :adetail)";
		}
		queryString += " ; ";
		
		System.out.println(queryString);
		
		final NativeQuery query = session.createNativeQuery(queryString);

		query.addScalar(PitchInfoDto.PROP_PITCH_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_PITCH_NAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PITCH_AVATAR, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PITCH_DESCRIPTION, StandardBasicTypes.STRING);

		query.addScalar(PitchInfoDto.PROP_ADDRESS, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PHONE_NUMBER, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_FACEBOOK, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_WEBSITE, StandardBasicTypes.STRING);

		query.addScalar(PitchInfoDto.PROP_OWNER_FULLNAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_OWNER_EMAIL, StandardBasicTypes.STRING);

		query.addScalar(PitchInfoDto.PROP_DESTRICT_NAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_DESTRICT_ZIPCODE, StandardBasicTypes.INTEGER);

		query.addScalar(PitchInfoDto.PROP_PITCH_DETAIL_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_PITCH_TYPE_ID, StandardBasicTypes.INTEGER);

		query.addScalar(PitchInfoDto.PROP_COST_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_HOUR_START, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_HOUR_END, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_WDAY_START, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_WDAY_END, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_COST_PRICE, StandardBasicTypes.INTEGER);
		
		query.setParameter("zipcode", zipcode);
		
		/*if (!StringUtils.isEmpty(pricesKey) ) {
			query.setParameter("cprice", pricesKey);
		}*/
		/*if (!StringUtils.isEmpty(numberofplayersKey)) {
			query.setParameter("nplayers", numberofplayersKey);
		}*/
		if (!StringUtils.isEmpty(keyword)) {
			query.setParameter("pname", '%' + keyword + '%');
			query.setParameter("adetail", '%' + keyword + '%');
		}
		
		// mapping 'as' with parameter in scalar
		query.setResultTransformer(Transformers.aliasToBean(PitchInfoDto.class));
		List<PitchInfoDto> dtos = query.getResultList();

		if (dtos.size() > 0) {
			return dtos;
		}
		return Collections.emptyList();
	}
	
	@Override
	public List<PitchInfoDto> getListPitchInfo(String pricesKey, String numberofplayersKey,
			String keyword) {
		Session session = sessionFactory.getCurrentSession();
		String queryString = Q_GET_LIST_PITCH_DETAIL_INFO_X 
						 + " WHERE 1 ";
		if (!StringUtils.isEmpty(pricesKey)) {
			queryString += " AND c.price IN ("+pricesKey+")";
			
		}
		if (!StringUtils.isEmpty(numberofplayersKey)) {
			queryString += " AND p_d.pitch_type_id IN ("+numberofplayersKey+")";
		}
		if (!StringUtils.isEmpty(keyword)) {
			queryString += " AND (p.name LIKE :pname OR a.detail LIKE :adetail)";
		}
		queryString += " ; ";
		
		System.out.println(queryString);
		
		final NativeQuery query = session.createNativeQuery(queryString);

		query.addScalar(PitchInfoDto.PROP_PITCH_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_PITCH_NAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PITCH_AVATAR, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PITCH_DESCRIPTION, StandardBasicTypes.STRING);

		query.addScalar(PitchInfoDto.PROP_ADDRESS, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_PHONE_NUMBER, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_FACEBOOK, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_WEBSITE, StandardBasicTypes.STRING);

		query.addScalar(PitchInfoDto.PROP_OWNER_FULLNAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_OWNER_EMAIL, StandardBasicTypes.STRING);

		query.addScalar(PitchInfoDto.PROP_DESTRICT_NAME, StandardBasicTypes.STRING);
		query.addScalar(PitchInfoDto.PROP_DESTRICT_ZIPCODE, StandardBasicTypes.INTEGER);

		query.addScalar(PitchInfoDto.PROP_PITCH_DETAIL_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_PITCH_TYPE_ID, StandardBasicTypes.INTEGER);

		query.addScalar(PitchInfoDto.PROP_COST_ID, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_HOUR_START, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_HOUR_END, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_WDAY_START, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_WDAY_END, StandardBasicTypes.INTEGER);
		query.addScalar(PitchInfoDto.PROP_COST_PRICE, StandardBasicTypes.INTEGER);
		
		if (!StringUtils.isEmpty(keyword)) {
			query.setParameter("pname", '%' + keyword + '%');
			query.setParameter("adetail", '%' + keyword + '%');
		}
		
		// mapping 'as' with parameter in scalar
		query.setResultTransformer(Transformers.aliasToBean(PitchInfoDto.class));
		List<PitchInfoDto> dtos = query.getResultList();

		if (dtos.size() > 0) {
			return dtos;
		}
		return Collections.emptyList();
	}

	@Override
	public int insertPitch(Pitch pitch) {
		Session session = sessionFactory.getCurrentSession();
		int userId = (int) session.save(pitch);
		return userId > 0 ? userId : 0;
	}

	@Override
	public List<Pitch> getListPitchesByUserId(int userId) {
		Session session = sessionFactory.getCurrentSession();
		
		String queryString = "FROM pitches WHERE owner_id = :uid";
		Query query = session.createQuery(queryString);
		query.setParameter("uid", userId);
		
		return query.getResultList();
	}

	@Override
	public int delById(int stadiumId) {
		Connection conn = getConnection();
		String query = "delete from pitches where id = ?";
		PreparedStatement pst = null;
		try {
			 pst = conn.prepareStatement(query);
			 pst.setInt(1, stadiumId);
			 return pst.executeUpdate();
		} catch (SQLException e) {
		}
		return 0;
	}
	
	private Connection getConnection() {
		return ((SessionImpl) sessionFactory.getCurrentSession()).connection();
	}

	

}
