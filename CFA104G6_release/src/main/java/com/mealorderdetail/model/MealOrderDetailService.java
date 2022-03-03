package com.mealorderdetail.model;

import java.math.BigDecimal;
import java.util.List;

import com.meal.model.service.MealService;


public class MealOrderDetailService {
	private MealOrderDetailDAO dao;
	MealService mealSvc = new MealService();
	BigDecimal price;
	BigDecimal count;
	
	public MealOrderDetailService() {
		dao = new MealOrderDetailDAOImpl();
	}
	
	public MealOrderDetailVO addOrderDetail(Long orderId, String[] mealNoList, String[] mealQtyList) {
		MealOrderDetailVO mealOrderDetailVO = new MealOrderDetailVO();
		for(int i = 0; i < mealNoList.length; i++) {
			if(Integer.valueOf(mealQtyList[i]) != 0) {
				price = mealSvc.getPrice(mealNoList[i]).getMealPrice();
				count = new BigDecimal(mealQtyList[i]);
				
				mealOrderDetailVO.setMealOrderId(orderId);
				mealOrderDetailVO.setMealNo(mealNoList[i]);
				mealOrderDetailVO.setMealCount(Integer.valueOf(mealQtyList[i]));
				mealOrderDetailVO.setMealAmount(price.multiply(count));
				dao.insert(mealOrderDetailVO);
			}
		}
		
		return mealOrderDetailVO;
	}
	
	public List<MealOrderDetailVO> findByMealOrderId(Long mealOrderId) {
		return dao.findByOrderId(mealOrderId);
	}
	
	public List<MealOrderDetailVO> getAll(){
		return dao.getAll();
	}
}
