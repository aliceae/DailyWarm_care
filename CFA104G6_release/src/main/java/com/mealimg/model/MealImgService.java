package com.mealimg.model;

import java.util.List;

public class MealImgService {
	private MealImgDAO dao;
	
	public MealImgService() {
		dao = new MealImgDAOImpl();
	}
	
	public List<MealImgVO> getAll(){
		return dao.getAll();
	}

}
