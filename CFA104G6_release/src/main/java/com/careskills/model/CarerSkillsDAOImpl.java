package com.careskills.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.skill.model.SkillVO;

public class CarerSkillsDAOImpl implements CareSkillsDAO {

	// DataSource
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/group6");
		} catch (NamingException ne) {
			ne.printStackTrace();
		}
	}

	// 新增申請者的技能資料
	private static final String INSERT_SKILL_STMT = "INSERT INTO CARE_SKILLS (CARER_ID, SKILL_NO) VALUES (?, ?)";
	
	// 刪除照護員技能
	private static final String DELETE_CARER_SKILL = "DELETE FROM CARE_SKILLS WHERE CARER_ID = ?";

	@Override
	public void insertApplySkill(CareSkillsVO carerSkillsVo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_SKILL_STMT);

			pstmt.setInt(1, carerSkillsVo.getCarerID());
			pstmt.setString(2, carerSkillsVo.getSkillNo());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void deleteCarerSkills(Integer carerID) {
		Connection con = null;
		PreparedStatement pstmt = null;		
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_CARER_SKILL);
			
			pstmt.setInt(1, carerID);
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

}
