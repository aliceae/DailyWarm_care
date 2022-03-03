package com.meal.model.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.meal.model.dao.impl.MealDAOImpl;
import com.meal.model.vo.MealVO;
import com.utils.ConnectionInstance;


public class MealService {
	private static DataSource ds = null ;
	
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/group6");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public boolean insertMael(MealVO meal) {
		MealDAOImpl dao = new MealDAOImpl();
		boolean ok = false;
		System.out.println(meal.getMealNo());
		try (Connection conn = ds.getConnection()) {
			conn.setAutoCommit(false);
			Integer result =dao.insertMeal(conn, meal);
			System.out.println(result);
			Integer result1=0;
			if(result==1) {
				result1= dao.insertMealPic(conn, meal);
				if(result1==1) {
					ok = true;
					System.out.println(ok);
					System.out.println("上傳"+ok);
				}else{
					System.out.println("新增照片資料失敗");
					return ok;
				}
			}else {
				System.out.println("新增餐點資料失敗");
				return ok;
			}
			conn.commit();
			ok = true;
			System.out.println("上傳"+ok);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(ok);
			try(Connection conn = ds.getConnection()) {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("final"+ok);
		return ok;
	}
	
	public List<MealVO> getAll() {
		MealDAOImpl dao = new MealDAOImpl();
		return dao.getAll();
	}
	public List<MealVO> getAllMeal(){
		MealDAOImpl dao = new MealDAOImpl();
		return dao.getAllMeal();
	}
	public MealVO getPrice(String mealNo) {
		MealDAOImpl dao = new MealDAOImpl();
		return dao.getPrice(mealNo);
	}
	public MealVO getOneMeal(String mealNo) {
		MealDAOImpl dao = new MealDAOImpl();
		return dao.findByMealNo(mealNo);
	}
	public int updateOneMeal(MealVO mealVO) throws SQLException {
		MealDAOImpl dao = new MealDAOImpl();
		return dao.updateMeal(mealVO);
	}
	public int deleteOneMeal(String mealNo) throws SQLException {
		MealDAOImpl dao = new MealDAOImpl();
		return dao.deleteMeal(mealNo);
	}
}
