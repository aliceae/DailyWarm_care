package com.careskills.model;

public class CareSkillsService {

	private CareSkillsDAO csdao;
	
	public CareSkillsService () {
		csdao = new CarerSkillsDAOImpl();
	}
	
	// 刪除單一照護員所有技能
	public void deleteCarerSkills(Integer carerID) {
		csdao.deleteCarerSkills(carerID);
	}
}
