package com.file.model;

import java.util.List;

public class FileService {
	
	private FileDAO dao;
	public FileService() {
		dao = new FileDAOImpl();
	}
	
	public FileVO getHeadShot(Integer carerId) {
		return dao.findHeadShotByCarerId(carerId);
	}
	
	public List<FileVO> getAll() {
		return dao.getAll();
	}
	
	public List<FileVO> getPic(Integer carerID) {
		return dao.getPic(carerID);
	}

}
