package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

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

import dto.CostQuantityDto;
import entities.Cost;
import iplms.ICost;

@Repository
@EnableTransactionManagement
public class CostDao implements ICost{

	@Autowired
	SessionFactory sessionFactory;
	
	private static final String Q_GET_MINI_PITCHES_QUANTITY_OF_COSTS = 
			  "SELECT c.price " + CostQuantityDto.PROP_PRICE
			+ ", COUNT(*) "     + CostQuantityDto.PROP_QUANTITY
			+ " FROM costs c JOIN pitches_detail p ON c.pdtail_id = p.id "
			+ " GROUP BY (c.price)";
	
	@Override
	public List<Cost> getCosts() {
		Session session = sessionFactory.getCurrentSession();
		String sql = " FROM costs";
		Query query = session.createQuery(sql);
		@SuppressWarnings("unchecked")
		List<Cost> costs= query.getResultList();
		return costs;
	}
	
	@Override
	public Cost getCost(int id) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " FROM costs WHERE id = :costId";
		Query query = session.createQuery(sql);
		query.setParameter("costId", id);
		Cost cost = (Cost) query.getSingleResult();
		return cost;
	}

	@Override
	public List<CostQuantityDto> getPitchesQuantityofCosts() {
		Session session = sessionFactory.getCurrentSession();
		
		String queryString = Q_GET_MINI_PITCHES_QUANTITY_OF_COSTS;
		
		NativeQuery query = session.createNativeQuery(queryString);
		
		query.addScalar(CostQuantityDto.PROP_PRICE, StandardBasicTypes.INTEGER);
		query.addScalar(CostQuantityDto.PROP_QUANTITY, StandardBasicTypes.INTEGER);
		
		query.setResultTransformer(Transformers.aliasToBean(CostQuantityDto.class));
		
		List<CostQuantityDto> dtos = query.getResultList();
		
		return dtos;
	}

	@Override
	public int insertCost(Cost cost) {
		Connection conn = getConnection();
		String queryString =  " INSERT INTO costs(hour_start, hour_end, wday_start, wday_end, price, pdtail_id)"
							+ " VALUES(?,?,?,?,?,?)";
		PreparedStatement pst = null;
		try {
			 pst = conn.prepareStatement(queryString);
			 pst.setInt(1, cost.getHourStart());
			 pst.setInt(2, cost.getHourEnd());
			 pst.setInt(3, cost.getWdayStart());
			 pst.setInt(4, cost.getWdayEnd());
			 pst.setInt(5, cost.getPrice());
			 pst.setInt(6, cost.getPitchDetail().getId());
			 
			 return pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	@Override
	public List<Cost> getCost(int pdtailId, int hourf, int wdayf) {
		Session session = sessionFactory.getCurrentSession();
		String queryString = "FROM costs "
				+ "WHERE pdtail_id = :pdtailId "
				+ "AND wday_start <= :wdayf AND wday_end >= :wdayf "
				+ "AND hour_start <= :hourf AND hour_end >= :hourf";
		Query query = session.createQuery(queryString);
		query.setParameter("pdtailId", pdtailId);
		query.setParameter("wdayf", wdayf);
		query.setParameter("hourf", hourf);
		@SuppressWarnings("unchecked")
		List<Cost> costs = query.getResultList();
		return costs.size() > 0 ? costs : Collections.emptyList() ;
	}
	
	private Connection getConnection() {
		return ((SessionImpl) sessionFactory.getCurrentSession()).connection();
	}
	

}
