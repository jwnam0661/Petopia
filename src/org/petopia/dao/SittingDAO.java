package org.petopia.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.petopia.utility.MybatisConfig;
import org.petopia.vo.Favorite;
import org.petopia.vo.Member;
import org.petopia.vo.Message;
import org.petopia.vo.Pet;
import org.petopia.vo.Photo;
import org.petopia.vo.Sitter;
import org.petopia.vo.SitterRating;
import org.petopia.vo.Sitting;
import org.petopia.vo.VideoChat;

public class SittingDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	
//==========================mybatis와 연계하는 메소드들 정의..====================================//
	
	/**
	 * 
	 * 이름은 requestSitting이지만 실질적으로는 INSERT인것에 주의
	 * status는 'request'로
	 */
	public void requestSitting(Sitting sitting){
		try (SqlSession ss = factory.openSession()) {
			ss.insert("Sitting.requestSitting", sitting);
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Message> viewMessageList(int sittingNo) {
		List<Message> messageList = null;
		
		try (SqlSession ss = factory.openSession()){
			messageList = ss.selectList("Sitting.messageList", sittingNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return messageList;
	}
	
	public void sendMessage(Message message) {
		try (SqlSession ss = factory.openSession()){
			ss.insert("Sitting.sendMessage", message);
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * sittingNo를 받아서 a2message에서 메시지의 'read'칼럼의 'new'의 개수를 반환한다.
	 * >이 때, 자기가 보낸 메시지는 읽지 않는다.<
	 * HashMap에는 'sittingNo'와 'sendNo'가 들어간다.
	 * @param HashMap<String, Integer> messageMap
	 * @return new의 개수
	 */
	public int getNewCounter(HashMap<String, Integer> messageMap){
		int newCount = 0;
		
		try (SqlSession ss = factory.openSession()) {
			newCount = ss.selectOne("Sitting.getNewCounter", messageMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return newCount;
	}
	
	/**
	 * 메시지가 화면에 표시되면 메시지의 칼럼 'read'를 read로 바꾼다.
	 * >이 때, 자기가 보낸 메시지는 바꾸지 않는다.<
	 * HashMap에는 'sittingNo'와 'sendNo'가 들어간다.
	 * @param HashMap<String, Integer> messageMap
	 */
	public void updateToRead(HashMap<String, Integer> messageMap){
		try (SqlSession ss = factory.openSession()){
			ss.update("Sitting.updateToRead", messageMap);
			ss.commit();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public Sitting sittingInfo(int sittingNo){
		Sitting sitting = null;
		try (SqlSession ss = factory.openSession()) {
			sitting = ss.selectOne("Sitting.sittingInfo", sittingNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		sitting = addSittingInfo(sitting);
		
		return sitting;
	}
	
	//sittingList 5종 불러오기(진행, 수락, 신청, 거절, 완료)
	
	public List<Sitting> pullSittingList(int memberNo, String status){
		List<Sitting> sittingList = null;
		HashMap<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("memberNo", memberNo);
		parameterMap.put("status", status);
		
		try(SqlSession ss = factory.openSession()) {
			sittingList = ss.selectList("Sitting.pullSittingList", parameterMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return sittingList;
		
	}
	
	/**
	 * customerNo를 받아서 진행중인 sitting의 List를 반환한다.
	 * @param customerNo
	 * @return sittingList(진행중)
	 */
	public List<Sitting> sittingListProgress(int memberNo){
		List<Sitting> sittingList = null;
		try (SqlSession ss = factory.openSession()) {
			sittingList = ss.selectList("Sitting.sittingListProgress", memberNo);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (Sitting sitting : sittingList) {
			Sitting added = addSittingInfo(sitting); 
			sitting.setMessageList(added.getMessageList());
			sitting.setPet(added.getPet());
			sitting.setSitter(added.getSitter());
		}
		System.out.println(sittingList.size());
		return sittingList;
	}
	
	/**
	 * customerNo를 받아서 수락된 sitting의 List를 반환한다.
	 * @param customerNo
	 * @return sittingList(수락됨)
	 */
	public List<Sitting> sittingListApproved(int memberNo){
		List<Sitting> sittingList = null;
		try (SqlSession ss = factory.openSession()) {
			sittingList = ss.selectList("Sitting.sittingListApproved", memberNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sittingList;
	}
	
	/**
	 * customerNo를 받아서 신청한 sitting의 List를 반환한다.
	 * @param customerNo
	 * @return sittingList(신청함)
	 */
	public List<Sitting> sittingListRequested(int memberNo){
		List<Sitting> sittingList = null;
		try (SqlSession ss = factory.openSession()) {
			sittingList = ss.selectList("Sitting.sittingListRequested", memberNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sittingList;
	}
	
	/**
	 * customerNo를 받아서 거절된 sitting의 List를 반환한다.
	 * @param customerNo
	 * @return sittingList(거절됨)
	 */
	public List<Sitting> sittingListRefused(int memberNo){
		List<Sitting> sittingList = null;
		try (SqlSession ss = factory.openSession()) {
			sittingList = ss.selectList("Sitting.sittingListRefused", memberNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sittingList;
	}
	
	/**
	 * customerNo를 받아서 완료된 sitting의 List를 반환한다.
	 * <br/>※주의 : 결제까지 완료된 건 아님
	 * TODO : 완료되면 결제는 자동으로 진행되도록 해야 하나?
	 * @param customerNo
	 * @return sittingList(완료됨)
	 */
	public List<Sitting> sittingListFinished(int memberNo){
		List<Sitting> sittingList = null;
		try (SqlSession ss = factory.openSession()) {
			sittingList = ss.selectList("Sitting.sittingListFinished", memberNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sittingList;
	}
	
	/**
	 * 받은 sitting에 sitter, pet, messageList 객체를 더해서 반환한다.
	 * @param sitting
	 * @return sitting
	 */
	public Sitting addSittingInfo(Sitting sitting){
		try (SqlSession ss = factory.openSession()) {
			Sitter sitter = ss.selectOne("Sitter.searchDetailSitter", sitting.getSitterNo());
			Pet pet = ss.selectOne("Pet.getPetInfo", sitting.getPetNo());
			List<Message> messageList = ss.selectList("Sitting.messageList", sitting.getSittingNo());
			sitting.setSitter(sitter);
			sitting.setPet(pet);
			sitting.setMessageList(messageList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sitting;
	}

	
	public void finishSitting(int sittingNo) {
		try (SqlSession ss = factory.openSession()) {
			ss.update("Sitting.finishSitting", sittingNo);
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void ratingSitter(SitterRating sitterRating) {
		try (SqlSession ss = factory.openSession()){
			ss.insert("Sitting.ratingSitter", sitterRating);
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		responseSitting("archived", sitterRating.getSittingNo());
	}
	
	/**
	 * 시터가 시팅을 수락/거절함
	 * @param response : approved(수락)/refused(거절)
	 * @param sittingNo : 수락/거절할 sittingNo
	 */
	public void responseSitting(String response, int sittingNo) {
		HashMap<String, Object> responseMap = new HashMap<>();
		responseMap.put("response", response);
		responseMap.put("sittingNo", sittingNo);
		try (SqlSession ss = factory.openSession()){
			ss.update("Sitting.responseSitting", responseMap);
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 신청자가 신청한 시팅을 취소한다.
	 * @param sittingNo : 취소할 시팅 번호
	 */
	public void cancelRequestSitting(int sittingNo) {
		try(SqlSession ss = factory.openSession()){
			ss.update("Sitting.cancelRequestSitting", sittingNo);
			ss.commit();
		}
	}

	public VideoChat pullVideoChat(int sittingNo) {
		VideoChat videoChat = null;
		try(SqlSession ss = factory.openSession()){
			videoChat = ss.selectOne("Sitting.pullVideoChat", sittingNo);
		} catch (Exception e){
			e.printStackTrace();
		}
		return videoChat;
	}
	
	public void updateVideoChatToCreated(int sittingNo) {
		try(SqlSession ss = factory.openSession()){
			ss.update("Sitting.updateVideoChatToCreated", sittingNo);
			ss.commit();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public void updateVideoChatToNocreated(int sittingNo){
		try(SqlSession ss = factory.openSession()){
			ss.update("Sitting.updateVideoChatToNocreated", sittingNo);
			ss.commit();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
}
