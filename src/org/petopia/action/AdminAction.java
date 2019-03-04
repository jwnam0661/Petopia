package org.petopia.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.apache.struts2.interceptor.SessionAware;
import org.petopia.dao.AdminDAO;
import org.petopia.dao.MemberDAO;
import org.petopia.dao.SitterDAO;
import org.petopia.vo.*;

import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;
	private AdminDAO dao = new AdminDAO();
	private SitterDAO sitterDAO = new SitterDAO();
	
	private List<Sitter> sitterList;
	private Sitter sitter;
	private Photo photo;
	private Member member;
	
	private int sitterNo;
//====================================================================================================	
	/**
	 * sitter Table에서 status가 'request'인 목록을 모두 보여준다.
	 */
	public String showSitterRequestList(){
		sitterList = dao.showSitterRequestList();
		for (int i=0; i<sitterList.size(); i++) {
			photo = sitterDAO.searchOnePhoto(sitterList.get(i).getMemberNo());
			member = sitterDAO.searchMember(sitterList.get(i).getMemberNo());
			
			sitterList.get(i).setPhotoSearch(photo);
			sitterList.get(i).setMemberSearch(member);
		}
		return SUCCESS;
	}
	
	/**
	 * sitter status가 request인 리스트에서
	 * sitterNo를 받아서 특정 sitter 신청 정보를 보여준다. 
	 */
	public String showSitterRequest(){
		sitter = dao.showSitterRequest(sitterNo);
		return SUCCESS;
	}
	
	
	/**
	 * sitter가 되는 것을 허가한다:
	 * sitterNo를 받아서 status를 'approved'로 바꾼다.
	 */
	public String approveRequest(){
		dao.approveRequest(sitterNo);
		return SUCCESS;
	}
	
	/**
	 * sitter가 되는 것을 반려한다:
	 * sitterNo를 받아서 status를 'refused'로 바꾼다.
	 */
	public String refuseRequest(){
		dao.refuseRequest(sitterNo);
		
		return SUCCESS;
	}
	
	
	
	
//====================================================================================================
	public List<Sitter> getSitterList() {
		return sitterList;
	}

	public void setSitterList(List<Sitter> sitterList) {
		this.sitterList = sitterList;
	}

	public int getSitterNo() {
		return sitterNo;
	}

	public void setSitterNo(int sitterNo) {
		this.sitterNo = sitterNo;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public Sitter getSitter() {
		return sitter;
	}

	public void setSitter(Sitter sitter) {
		this.sitter = sitter;
	}

	public Photo getPhoto() {
		return photo;
	}

	public void setPhoto(Photo photo) {
		this.photo = photo;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
}
