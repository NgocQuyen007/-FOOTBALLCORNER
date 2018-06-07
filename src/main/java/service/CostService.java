package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.CostDao;
import dto.CostQuantityDto;
import entities.Cost;
import iplms.ICost;

@Service
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CostService implements ICost {

	@Autowired
	CostDao costDao;
	
	@Override
	@Transactional
	public List<Cost> getCosts() {
		return costDao.getCosts();
	}
	
	@Override
	@Transactional
	public Cost getCost(int id) {
		return costDao.getCost(id);
	}

	@Override
	@Transactional
	public List<CostQuantityDto> getPitchesQuantityofCosts() {
		return costDao.getPitchesQuantityofCosts();
	}

	@Override
	@Transactional
	public int insertCost(Cost cost) {
		return costDao.insertCost(cost);
	}

	@Override
	@Transactional
	public List<Cost> getCost(int pdtailId, int hourf, int wdayf) {
		return costDao.getCost(pdtailId, hourf, wdayf);
	}

}
