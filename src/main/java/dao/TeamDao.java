package dao;

import java.util.Collections;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.NativeQuery;
import org.hibernate.transform.Transformers;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.util.StringUtils;

import dto.DistrictQuantityDto;
import dto.LevelQuantityDto;
import entities.Team;
import iplms.ITeam;

@Repository
@EnableTransactionManagement
public class TeamDao implements ITeam {

	private static final String Q_GET_TEAMS_QTY_OF_DISTRICTS = 
				      " SELECT des.zipcode " + DistrictQuantityDto.PROP_ZIPCODE
				      + ", des.name " 		 + DistrictQuantityDto.PROP_NAME
				      + ", COUNT(*) "        + DistrictQuantityDto.PROP_QUANTITY
					+ " FROM teams tea JOIN devdn_destricts des ON tea.dzipcode = des.zipcode "
			        + " GROUP BY (des.zipcode)";
	
	private static final String Q_GET_TEAMS_QTY_OF_LEVELS = 
		     		  "SELECT lev.id " + LevelQuantityDto.PROP_LEVEL_ID
		     		  + ", lev.name  " + LevelQuantityDto.PROP_NAME
		     		  + ", COUNT(*)  " + LevelQuantityDto.PROP_QUANTITY
		     		  + " FROM teams tea JOIN levels lev ON tea.level_id = lev.id "
		     		  + " GROUP BY (lev.id)";
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Team> getTeams() {
		Session session = sessionFactory.getCurrentSession();
		String queryString = " FROM teams ";
		Query query = session.createQuery(queryString);
		@SuppressWarnings("unchecked")
		List<Team> teams = query.getResultList();
		return teams.size() > 0 ? teams : Collections.emptyList();
	}

	@Override
	public List<Team> getTeams(int offset, int rowcount) {
		Session session = sessionFactory.getCurrentSession();
		String queryString = " FROM teams ";
		Query query = session.createQuery(queryString);
		
		query.setFirstResult(offset).setMaxResults(rowcount);
		
		@SuppressWarnings("unchecked")
		List<Team> teams = query.getResultList();
		return teams.size() > 0 ? teams : Collections.emptyList();
	}
	
	@Override
	public List<Team> getTeams(String keyword, String levels) {
		System.err.println("levels: " + levels);
		Session session = sessionFactory.getCurrentSession();
		String queryString = " FROM teams WHERE level_id IN ("+levels+") ";
		if(!StringUtils.isEmpty(keyword)) {
			queryString += " AND name LIKE :tname ";
		}
		
		Query query = session.createQuery(queryString);
		
		if(!StringUtils.isEmpty(keyword)) {
			query.setParameter("tname", '%'+keyword+'%');
		}
		
		@SuppressWarnings("unchecked")
		List<Team> teams = query.getResultList();
		System.err.println("size : " + teams.size());
		return teams.size() > 0 ? teams : Collections.emptyList();
	}
	
	@Override
	public List<Team> getTeams(String keyword, int offset, int rowcount) {
		Session session = sessionFactory.getCurrentSession();
		String queryString = " FROM teams"
						   + " WHERE name LIKE :tname";
		Query query = session.createQuery(queryString);
		query.setParameter("tname", '%'+keyword+'%');
		query.setFirstResult(offset).setMaxResults(rowcount);
		
		@SuppressWarnings("unchecked")
		List<Team> teams = query.getResultList();
		return teams.size() > 0 ? teams : Collections.emptyList();
	}

	@Override
	public int countAllRows() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Team.class).setProjection(Projections.rowCount());
		return Integer.parseInt(criteria.uniqueResult().toString());
	}
	
	@Override
	public int countAllRows(String keyword) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Team.class);
		criteria.add(Restrictions.like("name", '%'+keyword+'%'));
		criteria.setProjection(Projections.rowCount());
		return Integer.parseInt(criteria.uniqueResult().toString());
	}

	@Override
	public List<DistrictQuantityDto> getTeamsQuantityofDistricts() {
		Session session = sessionFactory.getCurrentSession();
		
		String queryString = Q_GET_TEAMS_QTY_OF_DISTRICTS;
		final NativeQuery query = session.createNativeQuery(queryString);
		
		query.addScalar(DistrictQuantityDto.PROP_ZIPCODE, StandardBasicTypes.INTEGER);
		query.addScalar(DistrictQuantityDto.PROP_NAME, StandardBasicTypes.STRING);
		query.addScalar(DistrictQuantityDto.PROP_QUANTITY, StandardBasicTypes.INTEGER);
		
		query.setResultTransformer(Transformers.aliasToBean(DistrictQuantityDto.class));
		List<DistrictQuantityDto> dtos = query.getResultList();
		
		return dtos;
	}
	
	@Override
	public List<LevelQuantityDto> getTeamsQuantityofLevels() {
		Session session = sessionFactory.getCurrentSession();
		
		String queryString = Q_GET_TEAMS_QTY_OF_LEVELS;
		final NativeQuery query = session.createNativeQuery(queryString);
		
		query.addScalar(LevelQuantityDto.PROP_LEVEL_ID, StandardBasicTypes.INTEGER);
		query.addScalar(LevelQuantityDto.PROP_NAME, StandardBasicTypes.STRING);
		query.addScalar(LevelQuantityDto.PROP_QUANTITY, StandardBasicTypes.INTEGER);
		
		query.setResultTransformer(Transformers.aliasToBean(LevelQuantityDto.class));
		List<LevelQuantityDto> dtos = query.getResultList();
		
		return dtos;
	}
	
}
