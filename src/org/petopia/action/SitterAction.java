package org.petopia.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.petopia.dao.MemberDAO;
import org.petopia.dao.SitterDAO;
import org.petopia.utility.FileService;
import org.petopia.utility.GeoCoding;
import org.petopia.vo.Calendar;
import org.petopia.vo.Member;
import org.petopia.vo.Message;
import org.petopia.vo.Pet;
import org.petopia.vo.Photo;
import org.petopia.vo.Sitter;
import org.petopia.vo.Sitting;

import com.opensymphony.xwork2.ActionSupport;

public class SitterAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;
	private SitterDAO dao = new SitterDAO();
	private MemberDAO daoMember = new MemberDAO();
	
	private Sitting sitting;
	private Message message;
	private Photo photo;
	private Sitter sitter;
	private Member member;
	private Pet pet;
	
	private List<Sitting> sittingList;//수락하여 진행중 시팅리스트
	private List<Sitting> requestedSitting;//신청받은 시팅리스트
	private List<Sitting> approvedSitting;//수락한 시팅리스트
	private List<Sitting> completedSitting;//완료된 시팅리스트
	private List<Photo> photoList;
	private List<Message> messageList;
	private List<Sitter> sitterList;
	private List<Member> memberList;
	private List<Calendar> unavailableDateList;
	private List<Pet> petList;
	
	private List<Integer> sitterNoList;		// 1~9위 랭킹의 시터번호
	private List<Object> sitterInfoList;	// 시터정보 + 시터사진
	
	private int sitterNo;
	private String password;
	private int memberNo;			//현재 로그인한 사용자의 위치정보, sitter들 위치정보 비교해야함
	private String address1;
	private String mainAddress;
	
	private List<String> searchList=new ArrayList<>();
	private String petoption;
	private String takeDate;
	private String returnDate;
	private String availableCategory;
	private String option1;
	private String option2;
	private String option3;
	
	private String petoption1;
	private String takeDate1;
	private String returnDate1;
	private String availableCategory1;
	
	private List<String> calList = new ArrayList<>();
	private List<Integer> noList = new ArrayList<>();
	//옵션들 검색
	private HashMap<String, String> stList = new HashMap<>();
	
	//임시
	private String dog;
	private String cat;
	private String etc;
	private List<String> petKind; 
	
	//시팅 포토 업로드 관련
	private String filesFileName;
	private String filesContentType;
	private List<File> files;
	
	private int sittingNo;
	private int savedSittiongNo;
	
	private ArrayList<Sitter> topSitterList;
//====================================================================================================	
	/**시팅 포토 업로드
	 * @throws IOException */
	public String uploadSittingPhoto() throws IOException{
		if(files != null && files.size() != 0){
			for(int i=0; i<files.size(); i++){
				photo = new Photo();
				FileService fs = new FileService();
				String basePath = getText("board.uploadpath");
				String savedfile = fs.saveFile(files.get(i), basePath, filesFileName);
				photo.setSavedfile(savedfile);
				photo.setOriginalfile(filesFileName);
				photo.setSitterNo((int) session.get("memberNo"));
				photo.setSittingNo(savedSittiongNo);
				photo.setCategory("sitting");
				daoMember.insertPhoto(photo);
			}
		}
		photoList = dao.searchSittingPhotoList(savedSittiongNo);
		return SUCCESS;
	}
	
	public int getSavedSittiongNo() {
		return savedSittiongNo;
	}

	public void setSavedSittiongNo(int savedSittiongNo) {
		this.savedSittiongNo = savedSittiongNo;
	}

	/**
	 * 주소정보를 파라미터로 받아 시터검색
	 *
	 */
	public String searchAddressSitter() {
		if(session != null & session.containsKey("memberNo")){
			memberNo = (int) session.get("memberNo");
		}
		
		//맡길날짜, 찾을 날짜로 검색
		List<Integer> iv = new ArrayList<>();
		iv = dao.searchCal(takeDate, returnDate);

		noList = new ArrayList<Integer>(new HashSet<Integer>(iv));//날짜로 검색해서 찾아온 memberNo
		System.out.println("noList"+noList);
		
		//주소
		if(!address1.equals("")){
			stList.put("address1", address1);
		} else {
			member = dao.searchMember(memberNo);
			stList.put("address1", member.getAddress1());
		}
		
		//동물 종류
		if(!availableCategory.equals("")){
			stList.put("availableCategory", availableCategory);
		}
		
		if(petoption!=null){
			if (!petoption.equals("")) {
				String[] spl = petoption.split(", ");
				for (int i = 0; i < spl.length; i++) {
					if (spl[i].equals("option1")) {
						option1 = "y";
						stList.put("option1", option1);
					} else if (spl[i].equals("option2")) {
						option2 = "y";
						stList.put("option2", option2);
					} else if (spl[i].equals("option3")) {
						option3 = "y";
						stList.put("option3", option3);
					}
				}
			}
		}
		
		//옵션, 동물 종류, 주소로 찾기
		sitterList = new ArrayList<>();
		List<Sitter> allList = new ArrayList<Sitter>();
		allList = dao.searchAddressSitter(stList);

		for(int i=0; i<allList.size(); i++){
			double avgRate = dao.pullAvgRate(allList.get(i).getMemberNo());
			allList.get(i).setAvgRate(avgRate);
			System.out.println(avgRate);
		}

		if(allList.size()!=0 && noList.size()!=0){
			for(int v=0; v<allList.size(); v++){
				for(int a =0; a<noList.size(); a++){
					if(allList.get(v).getMemberNo() == noList.get(a)){
						sitterList.add(allList.get(v));
					}
				}
			}
		}else{
			sitterList = allList;
		}
		
		return SUCCESS;
	}
	
	
	/**
	 * 주소정보를 파라미터로 받아 좌표로 시터검색
	 *
	 */
	public String searchAddressSitterByLatAndLng() {
		//parameterMap에는 주소에서 구한 좌표, 동물 종류, 옵션이 들어감
		HashMap<String, Object> parameterMap = new HashMap<>();
		if(session != null & session.containsKey("memberNo")){
			memberNo = (int) session.get("memberNo");
		}
		
		//맡길날짜, 찾을 날짜로 검색
		List<Integer> iv = new ArrayList<>();
		iv = dao.searchCal(takeDate, returnDate);

		noList = new ArrayList<Integer>(new HashSet<Integer>(iv));//날짜로 검색해서 찾아온 memberNo
		System.out.println("noList"+noList);
		
		//주소
		
		if(!address1.equals("")){
			stList.put("address1", address1);
		} else {
			member = dao.searchMember(memberNo);
			address1 = member.getAddress1();
		}
		System.out.println("searchAddressSitterByLatAndLng");
		GeoCoding geoCoding = new GeoCoding();
		HashMap<String, Double> geoCodingMap = new HashMap<>();
		
		geoCodingMap = geoCoding.getCodingFromAddress(address1);
		parameterMap.put("lat", geoCodingMap.get("lat"));
		parameterMap.put("lng", geoCodingMap.get("lng"));
		
		//동물 종류
				if(!availableCategory.equals("")){
					parameterMap.put("availableCategory", availableCategory);
				}
				
				if(petoption!=null){
					if (!petoption.equals("")) {
						String[] spl = petoption.split(", ");
						for (int i = 0; i < spl.length; i++) {
							if (spl[i].equals("option1")) {
								option1 = "y";
								parameterMap.put("option1", option1);
							} else if (spl[i].equals("option2")) {
								option2 = "y";
								parameterMap.put("option2", option2);
							} else if (spl[i].equals("option3")) {
								option3 = "y";
								parameterMap.put("option3", option3);
							}
						}
					}
				}
		
		//옵션, 동물 종류, 주소로 찾기
		sitterList = new ArrayList<>();
		List<Sitter> allList = new ArrayList<Sitter>();
		
		
		
		allList = dao.searchSitterByLatAndLng(parameterMap);

		for(int i=0; i<allList.size(); i++){
			double avgRate = dao.pullAvgRate(allList.get(i).getMemberNo());
			allList.get(i).setAvgRate(avgRate);
			System.out.println(avgRate);
		}

		if(allList.size()!=0 && noList.size()!=0){
			for(int v=0; v<allList.size(); v++){
				for(int a =0; a<noList.size(); a++){
					if(allList.get(v).getMemberNo() == noList.get(a)){
						sitterList.add(allList.get(v));
					}
				}
			}
		}else{
			sitterList = allList;
		}
		
		return SUCCESS;
	}
	
	
	/**검색 ajax로 하기 위해서 강제로 만든 메소드*/
	public String goSearchAjax(){
		address1 = mainAddress;
		petoption = petoption1;
		if (petoption != null) {
		String[] spl = petoption.split(", ");
		option1 = "option1";
		option2 = "option2";
		option3 = "option3";
		
		for (int i = 0; i < spl.length; i++) {
			if (spl[i].equals(option1)) {
				option1 = "픽업";
				searchList.add(option1);
			} else if (spl[i].equals(option2)) {
				option2 = "산책";
				searchList.add(option2);
			} else if (spl[i].equals(option3)) {
				option3 = "목욕";
				searchList.add(option3);
			}
		}
		}
		takeDate = takeDate1;
		returnDate = returnDate1;
		availableCategory = availableCategory1;
		
		
		

		return SUCCESS;
	}
	
	/**메인화면에서 보여지는 탑랭킹리스트*/
	public String topSitterList(){
		topSitterList = new ArrayList<>();
		sitterNoList = dao.listSitterNo();
		if(sitterNoList != null && sitterNoList.size() != 0){
			for(int i = 0; i < sitterNoList.size(); i++){
				Sitter sitter = null;
				sitter = dao.searchTopRanker(sitterNoList.get(i));
				Photo photo = dao.searchOnePhoto(sitter.getMemberNo());
				Member member = dao.searchMember(sitter.getMemberNo());
				sitter.setPhotoSearch(photo);
				sitter.setMemberSearch(member);
				double avgRate = dao.pullAvgRate(sitter.getMemberNo());
				sitter.setAvgRate(avgRate);
				topSitterList.add(sitter);
			}
		}
		return SUCCESS;
	}
	
	/**Go 펫시터 신청(등록) 페이지*/
	public String askSitterQualificationPage(){
		member = daoMember.searchMember((String) session.get("loginID"));
		return SUCCESS;
	}
	
	/**시터 정보 상세보기 페이지 */
	public String sitterDetail(){
		sitter = dao.searchNoSitter(memberNo);
		member = dao.searchMember(memberNo);	
		photoList = dao.photoNoList(memberNo);
		photo = dao.searchOnePhoto(memberNo);
		session.put("sitterNo", memberNo);
		return SUCCESS;
	}
	
	/**시팅 불가능일자 불러오기 메소드 */
	public String searchUnavailableDate(){
		unavailableDateList = dao.searchUnavailableDate((int) session.get("sitterNo"));
		return SUCCESS;
	}
	
	/**시터 페이지(진행중인 시팅페이지)*/
	public String progressSittingPage(){
		//시터 정보
		member = dao.searchMember((int)session.get("memberNo"));
		sitter = dao.searchNoSitter((int)session.get("memberNo"));
		sitter.setPhotoSearch(dao.searchOnePhoto((int)session.get("memberNo")));
		
		//현재 진행중 시팅리스트
		sittingList = pullSittingList((int)session.get("memberNo"), "progress");
		
		return SUCCESS;
	}
	
	/**신청받은 시팅페이지*/
	public String requestedSittingPage(){
		//시터 정보
		member = dao.searchMember((int)session.get("memberNo"));
		sitter = dao.searchNoSitter((int)session.get("memberNo"));
		sitter.setPhotoSearch(dao.searchOnePhoto((int)session.get("memberNo")));
		
		//현재 신청받은 시팅리스트
		requestedSitting = pullSittingList((int)session.get("memberNo"), "requested");
		
		return SUCCESS;
	}
	
	/**수락한 시팅페이지*/
	public String approvedSittingPage(){
		//시터 정보
		member = dao.searchMember((int)session.get("memberNo"));
		sitter = dao.searchNoSitter((int)session.get("memberNo"));
		sitter.setPhotoSearch(dao.searchOnePhoto((int)session.get("memberNo")));
		
		//현재 수락한 시팅리스트
		approvedSitting = pullSittingList((int)session.get("memberNo"), "approved");
		
		return SUCCESS;
	}
	
	/**
	 * 각종 sittingList를 반환하는 메소드
	 * @param memberNo
	 * @param status : progress, requested, approved, finished
	 * @return List
	 */
	public List<Sitting> pullSittingList(int sitterNo, String status){
		List<Sitting> sittingList = null;
		
		sittingList = dao.pullSittingList(sitterNo, status);
		if(sittingList != null){
			for(int i=0; i<sittingList.size(); i++){
				photo = dao.searchPhotoList(sittingList.get(i).getPetNo());
				pet = dao.searchPet(sittingList.get(i).getPetNo(), sittingList.get(i).getMemberNo());
				sittingList.get(i).setPet(pet);
				sittingList.get(i).setPhotoNo(photo.getPhotoNo());
			}
		}
		
		return sittingList;
	}
//====================================================================================================	

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public MemberDAO getDaoMember() {
		return daoMember;
	}

	public void setDaoMember(MemberDAO daoMember) {
		this.daoMember = daoMember;
	}

	public Sitting getSitting() {
		return sitting;
	}

	public void setSitting(Sitting sitting) {
		this.sitting = sitting;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public Photo getPhoto() {
		return photo;
	}

	public void setPhoto(Photo photo) {
		this.photo = photo;
	}

	public Sitter getSitter() {
		return sitter;
	}

	public void setSitter(Sitter sitter) {
		this.sitter = sitter;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public List<Sitting> getSittingList() {
		return sittingList;
	}

	public void setSittingList(List<Sitting> sittingList) {
		this.sittingList = sittingList;
	}

	public List<Photo> getPhotoList() {
		return photoList;
	}

	public void setPhotoList(List<Photo> photoList) {
		this.photoList = photoList;
	}

	public List<Message> getMessageList() {
		return messageList;
	}

	public void setMessageList(List<Message> messageList) {
		this.messageList = messageList;
	}
/*
	public ArrayList getSitterList() {
		return sitterList;
	}

	public void setSitterList(ArrayList sitterList) {
		this.sitterList = sitterList;
	}*/

	public List<Member> getMemberList() {
		return memberList;
	}

	public void setMemberList(List<Member> memberList) {
		this.memberList = memberList;
	}

	public List<Calendar> getUnavailableDateList() {
		return unavailableDateList;
	}

	public void setUnavailableDateList(List<Calendar> unavailableDateList) {
		this.unavailableDateList = unavailableDateList;
	}

	public List<Integer> getSitterNoList() {
		return sitterNoList;
	}

	public void setSitterNoList(List<Integer> sitterNoList) {
		this.sitterNoList = sitterNoList;
	}

	public List<Object> getSitterInfoList() {
		return sitterInfoList;
	}

	public void setSitterInfoList(List<Object> sitterInfoList) {
		this.sitterInfoList = sitterInfoList;
	}

	public int getSitterNo() {
		return sitterNo;
	}

	public void setSitterNo(int sitterNo) {
		this.sitterNo = sitterNo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getMainAddress() {
		return mainAddress;
	}

	public void setMainAddress(String mainAddress) {
		this.mainAddress = mainAddress;
	}

	public List<String> getSearchList() {
		return searchList;
	}

	public void setSearchList(List<String> searchList) {
		this.searchList = searchList;
	}

	public String getPetoption() {
		return petoption;
	}

	public void setPetoption(String petoption) {
		this.petoption = petoption;
	}

	public String getTakeDate() {
		return takeDate;
	}

	public void setTakeDate(String takeDate) {
		this.takeDate = takeDate;
	}

	public String getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}

	public String getAvailableCategory() {
		return availableCategory;
	}

	public void setAvailableCategory(String availableCategory) {
		this.availableCategory = availableCategory;
	}

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getOption3() {
		return option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public Pet getPet() {
		return pet;
	}

	public void setPet(Pet pet) {
		this.pet = pet;
	}

	public List<Sitting> getRequestedSitting() {
		return requestedSitting;
	}

	public void setRequestedSitting(List<Sitting> requestedSitting) {
		this.requestedSitting = requestedSitting;
	}

	public List<Sitting> getApprovedSitting() {
		return approvedSitting;
	}

	public void setApprovedSitting(List<Sitting> approvedSitting) {
		this.approvedSitting = approvedSitting;
	}

	public List<Sitting> getCompletedSitting() {
		return completedSitting;
	}

	public void setCompletedSitting(List<Sitting> completedSitting) {
		this.completedSitting = completedSitting;
	}


	public List<Sitter> getSitterList() {
		return sitterList;
	}


	public void setSitterList(List<Sitter> sitterList) {
		this.sitterList = sitterList;
	}


	public List<String> getCalList() {
		return calList;
	}


	public void setCalList(List<String> calList) {
		this.calList = calList;
	}


	public List<Integer> getNoList() {
		return noList;
	}


	public void setNoList(List<Integer> noList) {
		this.noList = noList;
	}


	public String getPetoption1() {
		return petoption1;
	}


	public void setPetoption1(String petoption1) {
		this.petoption1 = petoption1;
	}


	public String getTakeDate1() {
		return takeDate1;
	}


	public void setTakeDate1(String takeDate1) {
		this.takeDate1 = takeDate1;
	}


	public String getReturnDate1() {
		return returnDate1;
	}


	public void setReturnDate1(String returnDate1) {
		this.returnDate1 = returnDate1;
	}


	public String getAvailableCategory1() {
		return availableCategory1;
	}



	public void setAvailableCategory1(String availableCategory1) {
		this.availableCategory1 = availableCategory1;
	}


	public String getDog() {
		return dog;
	}


	public void setDog(String dog) {
		this.dog = dog;
	}


	public String getCat() {
		return cat;
	}


	public void setCat(String cat) {
		this.cat = cat;
	}


	public String getEtc() {
		return etc;
	}


	public void setEtc(String etc) {
		this.etc = etc;
	}
	public List<String> getPetKind() {
		return petKind;
	}


	public void setPetKind(List<String> petKind) {
		this.petKind = petKind;
	}


	public HashMap<String, String> getStList() {
		return stList;
	}


	public void setStList(HashMap<String, String> stList) {
		this.stList = stList;
	}


	public String getFilesFileName() {
		return filesFileName;
	}


	public void setFilesFileName(String filesFileName) {
		this.filesFileName = filesFileName;
	}


	public String getFilesContentType() {
		return filesContentType;
	}


	public void setFilesContentType(String filesContentType) {
		this.filesContentType = filesContentType;
	}


	public List<File> getFiles() {
		return files;
	}


	public void setFiles(List<File> files) {
		this.files = files;
	}


	public int getSittingNo() {
		return sittingNo;
	}


	public void setSittingNo(int sittingNo) {
		this.sittingNo = sittingNo;
	}

	public ArrayList<Sitter> getTopSitterList() {
		return topSitterList;
	}

	public void setTopSitterList(ArrayList<Sitter> topSitterList) {
		this.topSitterList = topSitterList;
	}

	public List<Pet> getPetList() {
		return petList;
	}

	public void setPetList(List<Pet> petList) {
		this.petList = petList;
	}

	


	
	
	
}
