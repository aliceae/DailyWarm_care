package com.service.model;

import java.util.List;

public class ServiceService {
	private ServiceDAO dao;
	
	public ServiceService() {
		dao = new ServiceDAOImpl();
	}
	
	// 取得服務種類列表
	public List<ServiceVO> getServiceList() {
		return dao.selectAll();
	}
}
