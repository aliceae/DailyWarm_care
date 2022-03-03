package com.skill.model;

import java.util.List;

import com.careskills.model.CareSkillsVO;

public class SkillService {

	private SkillDAO sdao;

	public SkillService() {
		sdao = new SkillDAOImpl();
	}

	// (carerID) 修改照護員資料前顯示已會的技能
	public List<SkillVO> getOneCarerSkills(Integer carerID) {
		return sdao.getOneCarerSkills(carerID);
	}
}
