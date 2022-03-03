package com.member.model.service;

import com.carer.model.dao.impl.CarerDAOImpl;
import com.common.model.service.JWTokenUtils;
import com.member.model.dao.impl.MemberDaoImpl;
import com.member.model.vo.MemberLoginRes;

public class MemberLoginService {
	public MemberLoginRes getMemberToken(String account,String password) {
		MemberDaoImpl dao = new MemberDaoImpl();
		CarerDAOImpl carerDaoImpl = new CarerDAOImpl();
		String token = "";
		MemberLoginRes memberLoginRes = new MemberLoginRes("",""); 
		if (account != null && password != null) {
			try {
			long MemberId = dao.isMemberExist(account,password);
			long CareId = carerDaoImpl.findCarerByAcctAndPwd(account, password);
			
			if(MemberId ==-1) {
				memberLoginRes.setToken("StatusError");
				return memberLoginRes;
			}else if(MemberId==-2) {
				memberLoginRes.setToken("NonVerify");
				return memberLoginRes;
			}else if (CareId !=0) {
				JWTokenUtils.createToken(CareId);
				token = JWTokenUtils.createToken(CareId).getToken();
				memberLoginRes.setToken(token);
				memberLoginRes.setIdentity("C");/*設定照護員身分*/
			}else if(MemberId !=0) {
				JWTokenUtils.createToken(MemberId);
				token = JWTokenUtils.createToken(MemberId).getToken();
				memberLoginRes.setToken(token);
				memberLoginRes.setIdentity("M");/*設定會員身分*/
				return memberLoginRes;
			}else {
				return memberLoginRes ;
			}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return memberLoginRes;
		
	}
}
