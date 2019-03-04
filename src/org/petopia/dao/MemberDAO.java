package org.petopia.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.petopia.utility.MybatisConfig;
import org.petopia.vo.Calendar;
import org.petopia.vo.Favorite;
import org.petopia.vo.Member;
import org.petopia.vo.Pet;
import org.petopia.vo.Photo;
import org.petopia.vo.Sitter;
import org.petopia.vo.Sitting;

public class MemberDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	private SqlSession ss = null;
	
//==========================mybatis와 연계하는 메소드들 정의..====================================//
	/*멤버 등록하기*/
	public void insertMember(Member member) {
		try{
			ss = factory.openSession();
			ss.insert("Member.insertMember", member);
			ss.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(ss != null){
				ss.close();
			}
		}
	}
	/*로그인*/
	public Member searchMember(String memberID) {
		Member result = null;
		try{
			ss = factory.openSession();
			result = ss.selectOne("Member.searchMember", memberID);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(ss != null){
				ss.close();
			}
		}
		return result;
	}
	/*펫시터 자격 신청*/
	public void askSitterQualification(Sitter sitter) {
		try{
			ss = factory.openSession();
			ss.insert("Member.askSitterQualification", sitter);
			ss.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(ss != null){
				ss.close();
			}
		}
	}
	/*사진등록*/
	public void insertPhoto(Photo photo) {
		try{
			ss = factory.openSession();
			ss.insert("Member.insertPhoto", photo);
			ss.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(ss != null){
				ss.close();
			}
		}
	}
	/*펫시터 즐겨찾기*/
	public void insertFavorite(Favorite favorite) {
		try{
			ss = factory.openSession();
			ss.insert("Member.insertFavorite", favorite);
			ss.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(ss != null){
				ss.close();
			}
		}
	}
	/*펫시터 즐겨찾기 해제*/
	public void deleteFavorite(int memberNo, int sitterNo) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("memberNo", memberNo);
		map.put("sitterNo", sitterNo);
		
		try{
			ss = factory.openSession();
			ss.delete("Member.deleteFavorite", map);
			ss.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(ss != null){
				ss.close();
			}
		}
	}
	/**불가능일자 입력*/
	public void insertUnavailableDate(Calendar calendar) {
		try{
			ss = factory.openSession();
			ss.insert("Member.insertUnavailableDate", calendar);
			ss.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(ss != null){
				ss.close();
			}
		}
	}
	/**사용자의 펫리스트 불러오기*/
	public List<Pet> searchMyPet(int memberNo) {
		List<Pet> result = null;
		try{
			ss = factory.openSession();
			result = ss.selectList("Member.searchMyPet", memberNo);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(ss != null){
				ss.close();
			}
		}
		return result;
	}
	/**시팅 신청*/
	public void insertSitting(Sitting sitting) {
		try(SqlSession ss = factory.openSession()){
			ss.insert("Member.insertSitting", sitting);
			ss.commit();
			int sittingNo = ss.selectOne("Sitting.pullSittingNoNow"); 
			ss.insert("Sitting.insertVideoChat", sittingNo);
			ss.commit();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public Sitter searchSitter(int memberNo) {
		Sitter result = null;
		try{
			ss = factory.openSession();
			result = ss.selectOne("Member.searchSitter", memberNo);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(ss != null){
				ss.close();
			}
		}
		return result;
	}
}
