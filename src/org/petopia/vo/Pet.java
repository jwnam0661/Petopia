package org.petopia.vo;

public class Pet {
	private int memberNo;
	private int petNo;
	private String name;
	private String category;
	private String species;
	private int ageClass;
	private int age;
	private String sex;
	private String neutralization;
	private String vaccine1;
	private String vaccine2;
	private String vaccine3;
	private String vaccine4;
	private String petComment;
	private String petSize;
	
	private int photoNo;

	public Pet() {
	}

	public Pet(int memberNo, int petNo, String name, String category, String species, int ageClass, int age, String sex,
			String neutralization, String vaccine1, String vaccine2, String vaccine3, String vaccine4,
			String petComment, String petSize, int photoNo) {
		this.memberNo = memberNo;
		this.petNo = petNo;
		this.name = name;
		this.category = category;
		this.species = species;
		this.ageClass = ageClass;
		this.age = age;
		this.sex = sex;
		this.neutralization = neutralization;
		this.vaccine1 = vaccine1;
		this.vaccine2 = vaccine2;
		this.vaccine3 = vaccine3;
		this.vaccine4 = vaccine4;
		this.petComment = petComment;
		this.petSize = petSize;
		this.photoNo = photoNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getPetNo() {
		return petNo;
	}

	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSpecies() {
		return species;
	}

	public void setSpecies(String species) {
		this.species = species;
	}

	public int getAgeClass() {
		return ageClass;
	}

	public void setAgeClass(int ageClass) {
		this.ageClass = ageClass;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getNeutralization() {
		return neutralization;
	}

	public void setNeutralization(String neutralization) {
		this.neutralization = neutralization;
	}

	public String getVaccine1() {
		return vaccine1;
	}

	public void setVaccine1(String vaccine1) {
		this.vaccine1 = vaccine1;
	}

	public String getVaccine2() {
		return vaccine2;
	}

	public void setVaccine2(String vaccine2) {
		this.vaccine2 = vaccine2;
	}

	public String getVaccine3() {
		return vaccine3;
	}

	public void setVaccine3(String vaccine3) {
		this.vaccine3 = vaccine3;
	}

	public String getVaccine4() {
		return vaccine4;
	}

	public void setVaccine4(String vaccine4) {
		this.vaccine4 = vaccine4;
	}

	public String getPetComment() {
		return petComment;
	}

	public void setPetComment(String petComment) {
		this.petComment = petComment;
	}

	public String getPetSize() {
		return petSize;
	}

	public void setPetSize(String petSize) {
		this.petSize = petSize;
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}

	@Override
	public String toString() {
		return "Pet [memberNo=" + memberNo + ", petNo=" + petNo + ", name=" + name + ", category=" + category
				+ ", species=" + species + ", ageClass=" + ageClass + ", age=" + age + ", sex=" + sex
				+ ", neutralization=" + neutralization + ", vaccine1=" + vaccine1 + ", vaccine2=" + vaccine2
				+ ", vaccine3=" + vaccine3 + ", vaccine4=" + vaccine4 + ", petComment=" + petComment + ", petSize="
				+ petSize + ", photoNo=" + photoNo + "]";
	}

	

}
