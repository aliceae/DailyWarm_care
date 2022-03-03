package com.member.model.service;

import java.util.List;

import com.member.model.dao.impl.MemberDaoImpl;
import com.member.model.vo.MemberDataSettingVO;
import com.member.model.vo.MemberVO;

public class MemberDataSettingService {
	private MemberDaoImpl dao = new MemberDaoImpl();

	public MemberVO getMemberData(long memberId) throws ClassNotFoundException {
		return dao.getMemberData(memberId);
	}
	public MemberDataSettingVO getMemberDataByToken(long memberId) throws ClassNotFoundException {
		return dao.getMemberDataByToken(memberId);
	}
	public int updateMemberData(MemberDataSettingVO memberData) {
		return dao.updateMember(memberData);
	}
	public List<MemberVO> getAllMember() throws ClassNotFoundException {/*用於取得全部會員資料*/
		return dao.getAllMember();
	}
}

