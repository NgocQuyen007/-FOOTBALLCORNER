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
	
	

}
