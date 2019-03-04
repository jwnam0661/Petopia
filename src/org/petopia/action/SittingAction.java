package org.petopia.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.json.JSONResult;
import org.apache.struts2.json.JSONWriter;
import org.apache.struts2.json.annotations.JSON;
import org.petopia.dao.MemberDAO;
import org.petopia.dao.SittingDAO;
import org.petopia.utility.FileService;
import org.petopia.vo.Favorite;
import org.petopia.vo.Member;
import org.petopia.vo.Message;
import org.petopia.vo.Pet;
import org.petopia.vo.Photo;
import org.petopia.vo.Sitter;
import org.petopia.vo.SitterRating;
import org.petopia.vo.Sitting;
import org.petopia.vo.Transaction;
import org.petopia.vo.VideoChat;

import com.opensymphony.xwork2.ActionSupport;

public class SittingAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;
	private Sitting sitting;
	private Member member;
	private Sitter sitter;
	private Pet pet;
	private SittingDAO sittingDAO = new SittingDAO();
	private Transaction transaction;
	private Message message;
	private List<Message> messageList;
	private List<Photo> photoList;
	private String response;
	private String name;
	private String content;
	private String dummy;
	private int memberNo;
	private int sittingNo;
	private String text;
	private int newCount;
	private SitterRating sitterRating;
	private VideoChat videoChat;
//====================================================================================================
	
	/**
	 * 시팅 정보를 보여준다.
	 * ajax로 마이페이지에서 Sitting 정보를 취득
	 * TODO 어떤 정보를 보여주지? 진행중인 정보?
	 * 
	 */
	public String getSittingInfo(){
		
		return SUCCESS;
	}
	
	
	/**
	 * 시팅 리스트를 보여준다. 
	 * UI의 슬라이드7.png 참고
	 * ajax로 마이페이지에서 SittingList 정보를 취득
	 * memberNo를 받아서  
	 */
	public String getSittingList(){
		
		return SUCCESS;
	}
	
	/**
	 * 시터가 시팅을 맡을지 어떨지 결정 한다.
	 * SittingVO의 status를 변경 
	 */
	public String responseSitting(){
		System.out.println("response: " + response);
		System.out.println("sittingNo: " + sittingNo);
		
		sittingDAO.responseSitting(response, sittingNo);
		
		return SUCCESS;
	}
	
	/**
	 * 멤버가 자기가 신청한 시팅을 취소한다.
	 */
	public String cancelRequestSitting(){
		sittingDAO.cancelRequestSitting(sittingNo);
		
		return SUCCESS;
	}
	
	/**
	 * 이용자는 시팅이 확정(수락/거절)되기 전까지는 시팅의 조건을 변경할 수 있다.
	 */
	public String changeSittingCondition(){
		
		return SUCCESS;
	}
	
	/**
	 * 이용자는 시팅이 종료된 후 시팅 종료를 확정한다.
	 * Transaction을 처리
	 */
	public String endSitting(){
		
		return SUCCESS;
	}
	
	/**
	 * SittingNo를 받아서 메시지들을 보여준다.
	 */
	public String viewMessageList(){
		
		messageList = sittingDAO.viewMessageList(sittingNo);
		memberNo = (int)session.get("memberNo");
		
		return SUCCESS;
	}
	
	/**
	 * 메시지 작성
	 * TODO : ajax로 처리해서 viewMessageList로 가게 해야 함
	 * 참고: readMessage는 없음.(viewMessageList가 readMessage의 역할)
	 */
	public String sendMessage(){
		int memberNo = (int) session.get("memberNo");
		sitting = sittingDAO.sittingInfo(sittingNo);
		message = new Message();
		message.setSittingNo(sittingNo);
		message.setSendNo(memberNo);
		message.setReceiveNo(sitting.getSitterNo());
		message.setText(text);
		
		
		sittingDAO.sendMessage(message);
		return SUCCESS;
	}
	
	public String getNewCounter(){
		int memberNo = (int) session.get("memberNo");
		HashMap<String, Integer> messageMap = new HashMap<String, Integer>();
		messageMap.put("sendNo", memberNo);
		messageMap.put("sittingNo", sittingNo);
		
		newCount = sittingDAO.getNewCounter(messageMap);
		
		return SUCCESS;
	}
	
	public String updateToRead(){
		int memberNo = (int) session.get("memberNo");
		HashMap<String, Integer> messageMap = new HashMap<String, Integer>();
		messageMap.put("sendNo", memberNo);
		messageMap.put("sittingNo", sittingNo);
		
		sittingDAO.updateToRead(messageMap);
		
		return SUCCESS;
	}
	
	/**
	 * SittingNo를 받아서 photoList를 출력
	 * 이것도 ajax인 것 같다.
	 */
	public String photoList(){
		
		return SUCCESS;
	}
	
	/**
	 * 
	 * myPage에서 '진행중'인 시팅을 종료한다. 종료된 시팅은 myPage의 완료된 시팅 페이지로 이동한다.
	 * 완료된 시팅은 a2sitting 테이블의 값 'status'를 'finished'로 변경 한다. 
	 */
	public String finishSitting(){
		sittingDAO.finishSitting(sittingNo);
		return SUCCESS;
	}
	
	/**
	 * sitting 완료 페이지에서 완료된 시팅을 평가할 수 있다. 평가는 10점 만점제로 한다.
	 * 평가는 A2SitterRating에 저장된다. 
	 */
	public String ratingSitter(){
		int memberNo = (int) session.get("memberNo");
		sitterRating.setMemberNo(memberNo);
		System.out.println(sitterRating.toString());
		
		sittingDAO.ratingSitter(sitterRating);
		return SUCCESS;
	}
	
	/**
	 * 
	 */
	public String pullVideoChat(){
		videoChat = sittingDAO.pullVideoChat(sittingNo);
		
		return SUCCESS;
	}
	
	public String updateVideoChatToCreated(){
		sittingDAO.updateVideoChatToCreated(sittingNo);
		
		return SUCCESS;
	}
	
	public String updateVideoChatToNocreated(){
		sittingDAO.updateVideoChatToNocreated(sittingNo);
		
		return SUCCESS;
	}
//====================================================================================================
	
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public Sitting getSitting() {
		return sitting;
	}

	public void setSitting(Sitting sitting) {
		this.sitting = sitting;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Sitter getSitter() {
		return sitter;
	}

	public void setSitter(Sitter sitter) {
		this.sitter = sitter;
	}

	public Pet getPet() {
		return pet;
	}

	public void setPet(Pet pet) {
		this.pet = pet;
	}

	public Map<String, Object> getSession() {
		return session;
	}


	public Transaction getTransaction() {
		return transaction;
	}


	public void setTransaction(Transaction transaction) {
		this.transaction = transaction;
	}

	public List<Message> getMessageList() {
		return messageList;
	}

	public void setMessageList(List<Message> messageList) {
		this.messageList = messageList;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}


	public String getResponse() {
		return response;
	}


	public void setResponse(String response) {
		this.response = response;
	}


	public List<Photo> getPhotoList() {
		return photoList;
	}


	public void setPhotoList(List<Photo> photoList) {
		this.photoList = photoList;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getSittingNo() {
		return sittingNo;
	}


	public void setSittingNo(int sittingNo) {
		this.sittingNo = sittingNo;
	}

	public String getDummy() {
		return dummy;
	}

	public void setDummy(String dummy) {
		this.dummy = dummy;
	}


	public String getText() {
		return text;
	}


	public void setText(String text) {
		this.text = text;
	}


	public int getNewCount() {
		return newCount;
	}


	public void setNewCount(int newCount) {
		this.newCount = newCount;
	}


	public SitterRating getSitterRating() {
		return sitterRating;
	}


	public void setSitterRating(SitterRating sitterRating) {
		this.sitterRating = sitterRating;
	}


	public VideoChat getVideoChat() {
		return videoChat;
	}


	public void setVideoChat(VideoChat videoChat) {
		this.videoChat = videoChat;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	
}
