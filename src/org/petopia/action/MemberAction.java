package org.petopia.action;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.petopia.dao.MemberDAO;
import org.petopia.dao.PetDAO;
import org.petopia.dao.SitterDAO;
import org.petopia.dao.SittingDAO;
import org.petopia.utility.FileService;
import org.petopia.utility.GeoCoding;
import org.petopia.vo.Calendar;
import org.petopia.vo.Favorite;
import org.petopia.vo.Member;
import org.petopia.vo.Pet;
import org.petopia.vo.Photo;
import org.petopia.vo.Sitter;
import org.petopia.vo.SitterRating;
import org.petopia.vo.Sitting;

import com.opensymphony.xwork2.ActionSupport;

public class MemberAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;
	private MemberDAO dao = new MemberDAO();
	private SittingDAO sittingDAO = new SittingDAO();
	private SitterDAO sitterDAO = new SitterDAO();
	private PetDAO petDAO = new PetDAO();
	
	private Member member;
	private SitterRating sitterRating;
	private Photo photo;
	private Sitter sitter;
	private Favorite favorite;
	private Sitting sitting;
	private Pet	pet;
	private Member sitterMember;
	private Sitter requestedSitter;
	
	private List<Photo> photoList;
	private List<Sitting> sittingList;
	private List<Favorite> favoriteList;
	private List<Pet> petList;
	private ArrayList calList;

	private String memberID;
	private String password;
	private String status;
	private String unavailableDate;
	private ArrayList<String> options;
	private int memberNo;
	private int sitterNo;
	private int price;
	private int sittingNo;
	
	/*파일업로드 멤바*/
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private String filesFileName;
	private String filesContentType;
	private List<File> files;
	
	private List<Sitting> sittingListProgress;
	private List<Sitting> sittingListApproved;
	private List<Sitting> sittingListRequested;
	private List<Sitting> sittingListFinished;
	
//====================================================================================================	
	

	
	/**
	 * 멤버 등록하기
	 * 
	 * */
	public String insertMember(){
		
		/*
		 * 주소에서 좌표를 추출하는 부분 
		 */
		String address = member.getAddress1() + " " + member.getAddress2();
		
		HashMap<String, Double> geoCodingMap = new HashMap<>(); 
		
		GeoCoding geoCoding = new GeoCoding();
		geoCodingMap = geoCoding.getCodingFromAddress(address);
		
		if(!geoCodingMap.isEmpty()){
			member.setLat(geoCodingMap.get("lat"));
			member.setLng(geoCodingMap.get("lng"));
			
			if(geoCodingMap.containsKey("bound_northeast_lat")){
				member.setBound_northeast_lat(geoCodingMap.get("bound_northeast_lat"));
				member.setBound_northeast_lng(geoCodingMap.get("bound_northeast_lng"));
				member.setBound_southwest_lat(geoCodingMap.get("bound_southwest_lat"));
				member.setBound_southwest_lng(geoCodingMap.get("bound_southwest_lng"));
			}
		}
		
		System.out.println("member: " + member);
		dao.insertMember(member);
		return SUCCESS;
	}
	
	/**로그인*/
	public String logIn() {
		member = dao.searchMember(memberID);
		if(member.getMemberID().equals("admin") && member.getPassword().equals(password)) {
			session.put("adminID", member.getMemberID());
			return "admin";
		} else if (member != null && member.getPassword().equals(password)) {
			session.put("loginID", member.getMemberID());
			session.put("memberNo", member.getMemberNo());
			session.remove("notMember");
			if(dao.searchMyPet(member.getMemberNo()).size() != 0){
				session.put("petAru", member.getMemberNo());
			}
			if (dao.searchSitter(member.getMemberNo()) != null) {
				session.put("sitterNo", member.getMemberNo());
			}
		} else {
			return LOGIN;
		}
		return SUCCESS;
	}
	
	/**로그아웃*/
	public String logOut(){
		session.clear();
		return SUCCESS;
	}
	
	/**
	 * 펫시터 자격 신청 ===> 이는 곧, insertSitter이란 이름으로 바뀌어도 문제없지..
	 * 
	 */
	public String askSitterQualification() throws IOException{
		sitter.setMemberNo((int) session.get("memberNo"));
		String[] dates = unavailableDate.split(",");
		ArrayList<Calendar> calList = new ArrayList<>(); 
		for (String string : dates) {
			Calendar cal = new Calendar();
			cal.setMemberNo((int) session.get("memberNo"));
			cal.setUnavailableDate(string);
			calList.add(cal);
		}
		for (Calendar calendar : calList) {
			dao.insertUnavailableDate(calendar);
		}
		sitter.setUnavailableDateList(calList);
		//옵션 1,2,3 선택여부
		if(options != null){
			for(int i=0; i<options.size(); i++){
				if(options.get(i).equals("pick up")){
					sitter.setOption1("y");//픽업
				}
				if(options.get(i).equals("shower")){
					sitter.setOption2("y");//목욕
				}
				if(options.get(i).equals("jogging")){
					sitter.setOption3("y");//산책
				}
			}
		}
		dao.askSitterQualification(sitter);
		if (dao.searchSitter((int)session.get("memberNo")) != null) {
			session.put("sitterNo", (int)session.get("memberNo"));
		} 
		if(upload != null){//시터 개인 사진 업로드
			photo = new Photo();
			FileService fs = new FileService();
			String basePath = getText("board.uploadpath");
			String savedfile = fs.saveFile(upload, basePath, uploadFileName);
			photo.setSavedfile(savedfile);
			photo.setOriginalfile(uploadFileName);
			photo.setSitterNo((int) session.get("memberNo"));
			photo.setCategory("sitter");
			dao.insertPhoto(photo);
		}
		
		if(files.size() != 0){//시터 집안 내부 사진 업로드(멀티)
			for(int i=0; i<files.size(); i++){
				photo = new Photo();
				FileService fs = new FileService();
				String basePath = getText("board.uploadpath");
				String savedfile = fs.saveFile(files.get(i), basePath, filesFileName);
				photo.setSavedfile(savedfile);
				photo.setOriginalfile(filesFileName);
				photo.setSitterNo((int) session.get("memberNo"));
				photo.setCategory("house");
				dao.insertPhoto(photo);
			}
		}
		return SUCCESS;
	}
	/*펫시터 즐겨찾기*/
	public String insertFavorite(){
		favorite.setMemberNo(memberNo);
		favorite.setSitterNo(sitterNo);
		dao.insertFavorite(favorite);
		return SUCCESS;
	}
	/*펫시터 즐겨찾기 해제*/
	public String deleteFavorite(){
		dao.deleteFavorite(memberNo, sitterNo);
		return SUCCESS;
	}
	
	/**
	 * 마이페이지가 보여줘야 하는 것 : 내 정보, 시팅 리스트(진행, 수락, 신청)<br/>
	 * ※시팅 리스트(거절, 완료)는 페이지를 분리해야 할 듯.
	 */
	public String myPage(){
		member = dao.searchMember((String) session.get("loginID"));
		sittingListProgress = sittingDAO.sittingListProgress(member.getMemberNo());
		System.out.println("sittingListProgress:" + sittingListProgress.size());
		sittingListApproved = sittingDAO.sittingListApproved(member.getMemberNo());
		sittingListRequested = sittingDAO.sittingListRequested(member.getMemberNo());
		return SUCCESS;
	}
	
	/**new Mypage*/
	public String newMyPage(){
		member = dao.searchMember((String) session.get("loginID"));
		sitter = dao.searchSitter(member.getMemberNo());
		if(sitter != null){
			session.put("sitterOK", "sitterOK");
			sitter.setPhotoSearch(sitterDAO.searchOnePhoto((int)session.get("memberNo")));
		}
		
		sittingListProgress = pullSittingList(member.getMemberNo(), "progress");
		
		return SUCCESS;
	}
	
	
	/**신청한 마이시팅페이지*/
	public String requestedMySittingPage(){
		member = dao.searchMember((String) session.get("loginID"));
		
		sitter = dao.searchSitter(member.getMemberNo());
		
		if(sitter != null){
			session.put("sitterOK", "sitterOK");
			sitter.setPhotoSearch(sitterDAO.searchOnePhoto((int)session.get("memberNo")));
		}
		
		sittingListRequested = pullSittingList(member.getMemberNo(), "requested");
		System.out.println(sittingListRequested+"sldkfjlaksdjf");
		return SUCCESS;
	}
	
	/**수락된 마이시팅페이지*/
	public String approvedMySittingPage(){
		member = dao.searchMember((String) session.get("loginID"));
		sitter = dao.searchSitter(member.getMemberNo());
		if(sitter != null){
			session.put("sitterOK", "sitterOK");
			sitter.setPhotoSearch(sitterDAO.searchOnePhoto((int)session.get("memberNo")));
		}
		
		sittingListApproved = pullSittingList(member.getMemberNo(), "approved");

		return SUCCESS;
	}
	
	/**완료된 마이시팅페이지*/
	public String completedMySittingPage(){
		member = dao.searchMember((String) session.get("loginID"));
		sitter = dao.searchSitter(member.getMemberNo());
		if(sitter != null){
			session.put("sitterOK", "sitterOK");
			sitter.setPhotoSearch(sitterDAO.searchOnePhoto((int)session.get("memberNo")));
		}
		
		sittingListFinished = pullSittingList(member.getMemberNo(), "finished");
		System.out.println("완료된" + sittingListFinished.size());

		return SUCCESS;
	}
	
	/**
	 * 각종 sittingList를 반환하는 메소드
	 * @param memberNo
	 * @param status : progress, requested, approved, finished
	 * @return List
	 */
	public List<Sitting> pullSittingList(int memberNo, String status){
		List<Sitting> sittingList = null;
		
		sittingList = sittingDAO.pullSittingList(memberNo, status);
		
		System.out.println(sittingList.size());
		
		if(sittingList != null){
			for(int i=0; i<sittingList.size(); i++){
				photo = sitterDAO.searchOnePhoto(sittingList.get(i).getSitterNo());
				sittingList.get(i).setPhotoNo(photo.getPhotoNo());
				
				pet = sitterDAO.searchPet(sittingList.get(i).getPetNo(), sittingList.get(i).getMemberNo());
				sittingList.get(i).setPet(pet);
				System.out.println("pet찍자: "+pet);
				requestedSitter = dao.searchSitter(sittingList.get(i).getSitterNo());
				sittingList.get(i).setSitter(requestedSitter);
				
				sitterMember = sitterDAO.searchMember(sittingList.get(i).getSitterNo());
				sittingList.get(i).setMember(sitterMember);
			}
		}
		
		return sittingList;
	}
	
	/**시팅신청 전, 이용약관페이지*/
	public String goAgreementOfUtilizationPage(){
		
		return SUCCESS;
	}
	
	/**시팅신청페이지*/
	public String goAskSittingPage(){
		petList = dao.searchMyPet((int)session.get("memberNo"));
		sitterNo = (int) session.get("sitterNo");
		
		return SUCCESS;
	}
	
	/**시팅신청
	 * @throws ParseException */
	public String askSitting() throws ParseException{
		sitting.setMemberNo((int) session.get("memberNo"));
		sitting.setSitterNo((int) session.get("sitterNo"));
		int price = 0;
		if(sitting.getOption1().equals("y")){
			price += 3000;
		}if(sitting.getOption2().equals("y")){
			price += 3000;
		}if(sitting.getOption3().equals("y")){
			price += 3000;
		}
		System.out.println(price+"price 시스;;;;");
		String ss = sitting.getStartDate();
		String ee = sitting.getEndDate();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startDay = transFormat.parse(ss);
		Date endDay = transFormat.parse(ee);
		int diff = (int) (endDay.getTime() - startDay.getTime());
        int diffDays = diff / (24 * 60 * 60 * 1000);
		int periodPrice = diffDays*20000;
		price += periodPrice;
		sitting.setPrice(price);
		sitting.setStatus("requested");
		dao.insertSitting(sitting);
		return SUCCESS;
	}
	
	/**시팅사진확인페이지*/
	public String checkSittingPhotoPage(){
		photoList = sitterDAO.searchSittingPhotoList(sittingNo);
		System.out.println(sittingNo+"시팅넘버");
		return SUCCESS;
	}
	
	/**마이펫리스트 페이지*/
	public String myPetListPage(){
		petList = petDAO.getPetList((int)session.get("memberNo"));
		System.out.println("petsize: "+petList.size());
		member = dao.searchMember((String) session.get("loginID"));
		sitter = dao.searchSitter(member.getMemberNo());
		if(sitter != null){
			sitter.setPhotoSearch(sitterDAO.searchOnePhoto((int)session.get("memberNo")));
		}
		
		if(petList != null){
			for(int i = 0; i < petList.size(); i++){
				photo = sitterDAO.searchPhotoList(petList.get(i).getPetNo());
				System.out.println("photo: "+photo);
				petList.get(i).setPhotoNo(photo.getPhotoNo());
			}
		}
		
		return SUCCESS;
	}
	
	public String deleteNotMember(){
		session.remove("notMember");
		System.out.println("notMember 지웟다");
		return SUCCESS;
	}
	
//====================================================================================================
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
	public SitterRating getSitterRating() {
		return sitterRating;
	}

	public void setSitterRating(SitterRating sitterRating) {
		this.sitterRating = sitterRating;
	}

	public Photo getPhoto() {
		return photo;
	}

	public void setPhoto(Photo photo) {
		this.photo = photo;
	}

	public List<Photo> getPhotoList() {
		return photoList;
	}

	public void setPhotoList(List<Photo> photoList) {
		this.photoList = photoList;
	}

	public List<Sitting> getSittingList() {
		return sittingList;
	}

	public void setSittingList(List<Sitting> sittingList) {
		this.sittingList = sittingList;
	}

	public List<Favorite> getFavoriteList() {
		return favoriteList;
	}

	public void setFavoriteList(List<Favorite> favoriteList) {
		this.favoriteList = favoriteList;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getSitterNo() {
		return sitterNo;
	}

	public void setSitterNo(int sitterNo) {
		this.sitterNo = sitterNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Sitter getSitter() {
		return sitter;
	}
	public void setSitter(Sitter sitter) {
		this.sitter = sitter;
	}
	
	public Favorite getFavorite() {
		return favorite;
	}
	public void setFavorite(Favorite favorite) {
		this.favorite = favorite;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	
	public List<File> getFiles() {
		return files;
	}
	public void setFiles(List<File> files) {
		this.files = files;
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
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public List<Sitting> getSittingListProgress() {
		return sittingListProgress;
	}
	public void setSittingListProgress(List<Sitting> sittingListProgress) {
		this.sittingListProgress = sittingListProgress;
	}
	public List<Sitting> getSittingListApproved() {
		return sittingListApproved;
	}
	public void setSittingListApproved(List<Sitting> sittingListApproved) {
		this.sittingListApproved = sittingListApproved;
	}
	public List<Sitting> getSittingListRequested() {
		return sittingListRequested;
	}
	public void setSittingListRequested(List<Sitting> sittingListRequested) {
		this.sittingListRequested = sittingListRequested;
	}
	public String getUnavailableDate() {
		return unavailableDate;
	}
	public void setUnavailableDate(String unavailableDate) {
		this.unavailableDate = unavailableDate;
	}
	public List<Pet> getPetList() {
		return petList;
	}
	public void setPetList(List<Pet> petList) {
		this.petList = petList;
	}
	public Sitting getSitting() {
		return sitting;
	}
	public void setSitting(Sitting sitting) {
		this.sitting = sitting;
	}
	public Pet getPet() {
		return pet;
	}
	public void setPet(Pet pet) {
		this.pet = pet;
	}

	public List<Sitting> getSittingListFinished() {
		return sittingListFinished;
	}

	public void setSittingListFinished(List<Sitting> sittingListFinished) {
		this.sittingListFinished = sittingListFinished;
	}

	public int getSittingNo() {
		return sittingNo;
	}

	public void setSittingNo(int sittingNo) {
		this.sittingNo = sittingNo;
	}

	public ArrayList<String> getOptions() {
		return options;
	}

	public void setOptions(ArrayList<String> options) {
		this.options = options;
	}

	public ArrayList getCalList() {
		return calList;
	}

	public void setCalList(ArrayList calList) {
		this.calList = calList;
	}

	public Member getSitterMember() {
		return sitterMember;
	}

	public void setSitterMember(Member sitterMember) {
		this.sitterMember = sitterMember;
	}

	public Sitter getRequestedSitter() {
		return requestedSitter;
	}

	public void setRequestedSitter(Sitter requestedSitter) {
		this.requestedSitter = requestedSitter;
	}

}
