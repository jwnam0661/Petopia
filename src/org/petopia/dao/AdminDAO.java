package org.petopia.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.petopia.utility.MybatisConfig;
import org.petopia.vo.Sitter;

public class AdminDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	
	public List<Sitter> showSitterRequestList() {
		List<Sitter> sitterList = null;
		try (SqlSession ss = factory.openSession()){
			sitterList = ss.selectList("Admin.showSitterRequestList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sitterList;
	}
	
	public Sitter showSitterRequest(int sitterNo) {
		Sitter sitter = null;
		try (SqlSession ss = factory.openSession()){
			sitter = ss.selectOne("Admin.showSitterRequest", sitterNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sitter;
	}
	
	public void approveRequest(int sitterNo) {
		try (SqlSession ss = factory.openSession()){
			ss.update("Admin.approveRequest", sitterNo);
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void refuseRequest(int sitterNo) {
		try (SqlSession ss = factory.openSession()){
			ss.update("Admin.refuseRequest", sitterNo);
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
//	mybatis와 연계하는 메소드들 정의.. //
}
