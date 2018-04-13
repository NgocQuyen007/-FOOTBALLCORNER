package controller;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entities.*;

@Controller
@EnableTransactionManagement
@RequestMapping("")
public class HomepageController {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@GetMapping
	@Transactional
	@ResponseBody
	public String index(){
		Session session = sessionFactory.getCurrentSession();
		String sql = " FROM pitch_type ";
		List<PitchType> types = new ArrayList<>(session.createQuery(sql).getResultList());
		return types.get(1).getName() + " -- " + types.get(1).getMaxQuantity();
	}
}
