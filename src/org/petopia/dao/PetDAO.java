package org.petopia.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.petopia.utility.MybatisConfig;
import org.petopia.vo.Pet;
import org.petopia.vo.Photo;

public class PetDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	private SqlSession ss = null;
	
	/**
	 * 
	 * @param petNo
	 * @return 
	 * Pet정보를 반환한다.
	 */
	public Pet getPetInfo(int petNo){
		Pet pet = null;
		try(SqlSession ss = factory.openSession()){
			pet = ss.selectOne("Pet.getPetInfo", petNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pet;
	}
	
	public List<Pet> getPetList(int memberNo){
		List<Pet> petList = null;
		try(SqlSession ss = factory.openSession()){
			petList = ss.selectList("Pet.getPetList", memberNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return petList;
	}
	
	public int insertPet(Pet pet) {
		System.out.println(pet);
		int seq = 0;
		try(SqlSession ss = factory.openSession()){
			ss.insert("Pet.insertPet", pet);
			ss.commit();
			seq = ss.selectOne("Pet.getSequence");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return seq;
		
	}


	public void updatePet(Pet pet) {
		try(SqlSession ss = factory.openSession()){
			ss.insert("Pet.updatePet", pet);
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insertPetPhoto(Photo photo) {
		try(SqlSession ss = factory.openSession()){
			ss.insert("Pet.insertPetPhoto", photo);
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	
//	mybatis와 연계하는 메소드들 정의.. //
}
