package com.function.model;

import java.util.List;


public class FunctionService {
	
	private FunctionJDBCDAO dao;
	
	public FunctionService() {
		dao = new FunctionJDBCDAO();
	}
		
	public List<FunctionVO> getAllFunction(){
		return dao.getAll();
	}
}
