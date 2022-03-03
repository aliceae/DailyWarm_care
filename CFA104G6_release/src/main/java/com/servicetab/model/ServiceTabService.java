package com.servicetab.model;

import java.util.List;

public class ServiceTabService {
	private ServiceTabDAO dao;

	public ServiceTabService() {
		dao = new ServiceTabDAOImpl();
	}

	// 取得服務列表
	public List<ServiceTabVO> getServiceTabList() {
		return dao.selectAll();
	}
}
