package org.petopia.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.struts2.interceptor.SessionAware;
import org.petopia.dao.PetDAO;
import org.petopia.dao.SitterDAO;
import org.petopia.utility.FileService;
import org.petopia.vo.Pet;
import org.petopia.vo.Photo;

import com.opensymphony.xwork2.ActionSupport;

public class PetAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;
	private PetDAO dao = new PetDAO();
	private SitterDAO sitterDAO = new SitterDAO();
	private Pet pet;
	private int petNo;
	private String[] vaccine = new String[4];
	private Photo photo;
	private File input_img;
	private String input_imgContentType;
	private String input_imgFileName;
	private List<Pet> petList;

	// ====================================================================================================
	public String insertPet() throws IOException {
		String loginId = (String) session.get("loginID");
		int memberNo = (int) session.get("memberNo");
		pet.setMemberNo(memberNo);

		// 접종 백신 처리 시작
		for (String string : vaccine) {
			if (string.equals("vaccine1")) {
				pet.setVaccine1("Y");
			} else if (string.equals("vaccine2")) {
				pet.setVaccine2("Y");
			} else if (string.equals("vaccine3")) {
				pet.setVaccine3("Y");
			} else if (string.equals("vaccine4")) {
				pet.setVaccine4("Y");
			}

		}

		if (pet.getVaccine1() == null) {
			pet.setVaccine1("");
		}
		if (pet.getVaccine2() == null) {
			pet.setVaccine2("");
		}
		if (pet.getVaccine3() == null) {
			pet.setVaccine3("");
		}
		if (pet.getVaccine4() == null) {
			pet.setVaccine4("");
		}

		// 접종 백신 처리 끝

		System.out.println(pet);
		int petNo = dao.insertPet(pet);
		
		if (input_img != null) {// jsp쪽 속성명이 upload가 되어야겠지...
			photo = new Photo();
			FileService fs = new FileService();
			String basePath = getText("board.uploadpath");
			System.out.println(basePath);
			String uploadFileName = input_imgFileName;
			String savedfile = fs.saveFile(input_img, basePath, uploadFileName);
			System.out.println(uploadFileName + ",\t" + savedfile);
			photo.setSavedfile(savedfile);
			photo.setOriginalfile(uploadFileName);
			photo.setCategory("pet");
			photo.setPetNo(petNo);
			photo.setMemberNo((int)session.get("memberNo"));
			dao.insertPetPhoto(photo);
		}

		return SUCCESS;
	}

	public String updatePet() {
		int memberNo = (int) session.get("membeNo");
		pet.setMemberNo(memberNo);
		dao.updatePet(pet);

		return SUCCESS;
	}

	public String getPetInfo() {
		int memberNo = (int) session.get("membeNo");
		pet = dao.getPetInfo(petNo);

		return SUCCESS;
	}

	public String getPetInfoList() {
		int memberNo = (int) session.get("membeNo");
		setPetList(dao.getPetList(memberNo));

		return SUCCESS;
	}

	public String goUpdatePet() {
		Pet pet = dao.getPetInfo(petNo);

		return SUCCESS;
	}

	// ====================================================================================================
	public Pet getPet() {
		return pet;
	}

	public void setPet(Pet pet) {
		this.pet = pet;
	}

	public int getPetNo() {
		return petNo;
	}

	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}

	public String[] getVaccine() {
		return vaccine;
	}

	public void setVaccine(String[] vaccine) {
		this.vaccine = vaccine;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public Photo getPhoto() {
		return photo;
	}

	public void setPhoto(Photo photo) {
		this.photo = photo;
	}

	public File getInput_img() {
		return input_img;
	}

	public void setInput_img(File input_img) {
		this.input_img = input_img;
	}

	public String getInput_imgContentType() {
		return input_imgContentType;
	}

	public void setInput_imgContentType(String input_imgContentType) {
		this.input_imgContentType = input_imgContentType;
	}

	public String getInput_imgFileName() {
		return input_imgFileName;
	}

	public void setInput_imgFileName(String input_imgFileName) {
		this.input_imgFileName = input_imgFileName;
	}

	public List<Pet> getPetList() {
		return petList;
	}

	public void setPetList(List<Pet> petList) {
		this.petList = petList;
	}

}
