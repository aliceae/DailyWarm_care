package com.requesttab.model;

import java.util.List;

public class RequestTabService {
	private RequestTabDAO dao;

	public RequestTabService() {
		dao = new RequestTabDAOImpl();
	}

	// 取得照護服務明細列表(需求單id)
	public List<RequestTabPVO> getRequestTabList(Integer id) {
		return dao.selectAll(id);
	}

	public List<RequestTabVO> getAll() {
		return dao.selectAll();
	}

}