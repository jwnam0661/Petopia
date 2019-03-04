
/* Drop Triggers */

DROP TRIGGER TRI_A2FAVORITE_FavoriteNo;
DROP TRIGGER TRI_A2MEMBER_MemberNo;
DROP TRIGGER TRI_A2MESSAGE_MessageNo;
DROP TRIGGER TRI_A2PET_PetNo;
DROP TRIGGER TRI_A2PHOTO_PhotoNo;
DROP TRIGGER TRI_A2SitterRating_RatingNo;
DROP TRIGGER TRI_A2SITTING_SittingNo;
DROP TRIGGER TRI_A2TRANSACTION_TransactionNo;
DROP TRIGGER TRI_Favorite_FavoriteNo;
DROP TRIGGER TRI_MEMBER_MemberNo;
DROP TRIGGER TRI_Message_MessageNo;
DROP TRIGGER TRI_PET_PetNo;
DROP TRIGGER TRI_Photo_PhotoNo;
DROP TRIGGER TRI_SitterRating_RatingNo;
DROP TRIGGER TRI_Sitting_SittingNo;
DROP TRIGGER TRI_Transaction_TransactionNo;



/* Drop Tables */

DROP TABLE A2CALENDAR CASCADE CONSTRAINTS;
DROP TABLE A2FAVORITE CASCADE CONSTRAINTS;
DROP TABLE A2MESSAGE CASCADE CONSTRAINTS;
DROP TABLE A2PHOTO CASCADE CONSTRAINTS;
DROP TABLE A2TRANSACTION CASCADE CONSTRAINTS;
DROP TABLE A2SITTING CASCADE CONSTRAINTS;
DROP TABLE A2PET CASCADE CONSTRAINTS;
DROP TABLE A2SITTER CASCADE CONSTRAINTS;
DROP TABLE A2SitterRating CASCADE CONSTRAINTS;
DROP TABLE A2MEMBER CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_A2FAVORITE_FavoriteNo;
DROP SEQUENCE SEQ_A2MEMBER_MemberNo;
DROP SEQUENCE SEQ_A2MESSAGE_MessageNo;
DROP SEQUENCE SEQ_A2PET_PetNo;
DROP SEQUENCE SEQ_A2PHOTO_PhotoNo;
DROP SEQUENCE SEQ_A2SitterRating_RatingNo;
DROP SEQUENCE SEQ_A2SITTING_SittingNo;
DROP SEQUENCE SEQ_A2TRANSACTION_TransactionNo;
DROP SEQUENCE SEQ_Favorite_FavoriteNo;
DROP SEQUENCE SEQ_MEMBER_MemberNo;
DROP SEQUENCE SEQ_Message_MessageNo;
DROP SEQUENCE SEQ_PET_PetNo;
DROP SEQUENCE SEQ_Photo_PhotoNo;
DROP SEQUENCE SEQ_SitterRating_RatingNo;
DROP SEQUENCE SEQ_Sitting_SittingNo;
DROP SEQUENCE SEQ_Transaction_TransNo;




/* Create Sequences */

CREATE SEQUENCE SEQ_A2FAVORITE_FavoriteNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_A2MEMBER_MemberNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_A2MESSAGE_MessageNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_A2PET_PetNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_A2PHOTO_PhotoNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_A2SitterRating_RatingNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_A2SITTING_SittingNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_A2TRANSACTION_TransactionNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Favorite_FavoriteNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MEMBER_MemberNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Message_MessageNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_PET_PetNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Photo_PhotoNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SitterRating_RatingNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Sitting_SittingNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Transaction_TransNo INCREMENT BY 1 START WITH 1;



/* Create Tables */

-- 시팅가능일
CREATE TABLE A2CALENDAR
(
	-- 회원번호
	MemberNo number NOT NULL,
	-- 시팅가능일
	AvailableDate date NOT NULL,
	-- 가능동물수
	Available number NOT NULL
);


-- 즐겨찾기
CREATE TABLE A2FAVORITE
(
	-- FavoriteNo
	FavoriteNo number NOT NULL,
	-- 즐겨찾기등록일
	FavoriteDate date NOT NULL,
	-- 회원번호
	MemberNo number NOT NULL,
	-- 시터번호
	SitterNo number NOT NULL,
	PRIMARY KEY (FavoriteNo)
);


-- 회원정보
CREATE TABLE A2MEMBER
(
	-- 회원번호
	MemberNo number NOT NULL,
	-- 아이디
	MemberID varchar2(15) NOT NULL UNIQUE,
	-- Password
	Password varchar2(16) NOT NULL,
	-- 이름
	Name varchar2(20) NOT NULL,
	-- Email
	Email varchar2(100) NOT NULL,
	-- 연락처
	Phone varchar2(13) NOT NULL,
	-- 주소1
	Address1 varchar2(500) NOT NULL,
	-- 주소2
	Address2 varchar2(500) NOT NULL,
	PRIMARY KEY (MemberNo)
);


-- 쪽지
CREATE TABLE A2MESSAGE
(
	-- 메시지번호
	MessageNo number NOT NULL,
	-- 보낸회원번호
	SendNo number NOT NULL,
	-- 받은회원번호
	ReceiveNo number NOT NULL,
	-- 날짜 및 시간
	MessageDate date NOT NULL,
	-- 내용
	Text varchar2(1000) NOT NULL,
	PRIMARY KEY (MessageNo)
);


-- 펫
CREATE TABLE A2PET
(
	-- 회원번호
	MemberNo number NOT NULL,
	-- 동물번호
	PetNo number NOT NULL,
	-- 이름
	Name varchar2(20) NOT NULL,
	-- 종류 : 개/고양이/기타
	Category varchar2(10) NOT NULL,
	-- 품종 : Category가 기타인 경우 여기에 입력
	Species varchar2(40) NOT NULL,
	-- 나이구분 : 0 - 6개월 미만
	-- 1 - 1년 미만
	-- 2 - 1년 이상
	AgeClass number NOT NULL,
	-- 나이 : AgeClass가 2일때 입력
	Age number NOT NULL,
	-- 펫 성별
	SEX varchar2(1) NOT NULL,
	-- 중성화여부
	Neutralization varchar2(1) NOT NULL,
	-- Vaccine1
	Vaccine1 varchar2(1),
	-- Vaccine2
	Vaccine2 varchar2(1),
	-- Vaccine3
	Vaccine3 varchar2(1),
	-- Vaccine4
	Vaccine4 varchar2(1),
	-- 코멘트
	PetComment varchar2(400),
	-- 크기 : 소형/중형/대형
	PetSize varchar2(2) NOT NULL,
	PRIMARY KEY (PetNo)
);


-- 사진
CREATE TABLE A2PHOTO
(
	-- 사진번호
	PhotoNo number NOT NULL,
	-- 사진 종류 : 사진 종류(펫, 시터, 집, 시팅)
	Category varchar2(10) NOT NULL,
	-- 사진 위치 : 업로드한 사진이 서버에 저장되는 주소(파일명 생략)
	Location varchar2(1000) NOT NULL,
	-- 원래 이름 : 업로드시 파일명
	OriginalName varchar2(1000) NOT NULL,
	-- 저장된파일이름 : 서버에 저장된 파일명
	SavedFileName varchar2(1000) NOT NULL,
	-- 업로드한 날짜
	PhotoDate date NOT NULL,
	-- 회원번호
	CustomerNo number,
	-- 회원번호
	SitterNo number,
	-- 시팅번호
	SittingNo number,
	-- 동물번호
	PetNo number,
	-- 회원의 공개여부 : 이 사진에 찍힌 펫의 주인인 회원이 이 사진을 공개해도 되는지를 표시한다.
	public1 varchar2(1),
	-- 시터의 공개여부2 : 이 사진에 찍힌 펫을 시팅한 시터가 이 사진을 공개해도 되는지를 표시한다.
	public2 varchar2(1),
	PRIMARY KEY (PhotoNo)
);


-- 시터정보
CREATE TABLE A2SITTER
(
	-- 회원번호
	MemberNo number NOT NULL,
	-- 성별
	SEX varchar2(1) NOT NULL,
	-- AGE
	AGE number NOT NULL,
	-- 가능동물
	AvailableCategory varchar2(40) NOT NULL,
	-- 시팅 가능 수
	AvaliableNumber number NOT NULL,
	-- 가능크기 : 시팅가능한 최대 크기
	AvailableSize varchar2(2) NOT NULL,
	-- 거주지 정보
	HouseCategory varchar2(30) NOT NULL,
	-- 본인 어필
	SitterComment varchar2(400),
	-- 자격증 : 자격증
	License varchar2(100),
	-- 상태 : 신청/신청취소/활동중/활동정지/수락실패
	status varchar2(2) NOT NULL,
	-- 키우는 반려동물 여부
	Pet varchar2(1) NOT NULL,
	-- 양육경력 : 년단위
	SittingLength number NOT NULL,
	-- 시팅옵션1
	Option1 varchar2(1) NOT NULL,
	-- 시팅옵션2
	Option2 varchar2(1) NOT NULL,
	-- 시팅옵션3
	Option3 varchar2(1) NOT NULL,
	-- 계좌번호
	Account varchar2(100),
	PRIMARY KEY (MemberNo)
);


-- 시터평가
CREATE TABLE A2SitterRating
(
	-- 평가번호
	RatingNo number NOT NULL,
	-- Rating : 10점 만점
	Rating number NOT NULL,
	-- 평가일
	RatingDate date NOT NULL,
	-- 회원번호
	MemberNo number NOT NULL,
	-- 회원번호
	SitterNo number NOT NULL,
	-- 평가 코멘트
	RatingComment varchar2(400),
	-- 시팅 번호
	SittingNo number,
	PRIMARY KEY (RatingNo)
);


-- 시팅 정보
CREATE TABLE A2SITTING
(
	-- 시팅번호
	SittingNo number NOT NULL,
	-- 회원번호
	CustomerNo number NOT NULL,
	-- 회원번호
	SitterNo number NOT NULL,
	-- 동물번호
	PetNo number NOT NULL,
	-- 상태 : 종료, 진행, 수락, 신청, 취소
	Status varchar2(10) NOT NULL,
	-- 신청일
	requestDate date NOT NULL,
	-- 시작(예정)일
	StartDate date,
	-- 종료(예정)일
	EndDate date,
	-- Option1
	Option1 varchar2(1),
	-- Option2
	Option2 varchar2(1),
	-- Option3
	Option3 varchar2(3),
	-- 가격
	Price number,
	PRIMARY KEY (SittingNo)
);


-- 결제정보
CREATE TABLE A2TRANSACTION
(
	-- 결제번호
	TransNo number NOT NULL,
	-- 시팅번호
	SittingNo number NOT NULL UNIQUE,
	-- Category : 결제/지불
	Category varchar2(10) NOT NULL,
	-- 금액
	Ammount number NOT NULL,
	-- 결제/지불일
	TransactionDate date NOT NULL,
	PRIMARY KEY (TransNo)
);



/* Create Foreign Keys */

ALTER TABLE A2FAVORITE
	ADD FOREIGN KEY (MemberNo)
	REFERENCES A2MEMBER (MemberNo)
;


ALTER TABLE A2MESSAGE
	ADD FOREIGN KEY (SendNo)
	REFERENCES A2MEMBER (MemberNo)
;


ALTER TABLE A2PET
	ADD FOREIGN KEY (MemberNo)
	REFERENCES A2MEMBER (MemberNo)
;


ALTER TABLE A2PHOTO
	ADD FOREIGN KEY (CustomerNo)
	REFERENCES A2MEMBER (MemberNo)
;


ALTER TABLE A2SITTER
	ADD FOREIGN KEY (MemberNo)
	REFERENCES A2MEMBER (MemberNo)
;


ALTER TABLE A2SitterRating
	ADD FOREIGN KEY (MemberNo)
	REFERENCES A2MEMBER (MemberNo)
;


ALTER TABLE A2SITTING
	ADD FOREIGN KEY (CustomerNo)
	REFERENCES A2MEMBER (MemberNo)
;


ALTER TABLE A2PHOTO
	ADD FOREIGN KEY (PetNo)
	REFERENCES A2PET (PetNo)
;


ALTER TABLE A2SITTING
	ADD FOREIGN KEY (PetNo)
	REFERENCES A2PET (PetNo)
;


ALTER TABLE A2CALENDAR
	ADD FOREIGN KEY (MemberNo)
	REFERENCES A2SITTER (MemberNo)
;


ALTER TABLE A2PHOTO
	ADD FOREIGN KEY (SitterNo)
	REFERENCES A2SITTER (MemberNo)
;


ALTER TABLE A2PHOTO
	ADD FOREIGN KEY (SittingNo)
	REFERENCES A2SITTING (SittingNo)
;


ALTER TABLE A2TRANSACTION
	ADD FOREIGN KEY (SittingNo)
	REFERENCES A2SITTING (SittingNo)
;



/* Comments */

COMMENT ON TABLE A2CALENDAR IS '시팅가능일';
COMMENT ON COLUMN A2CALENDAR.MemberNo IS '회원번호';
COMMENT ON COLUMN A2CALENDAR.AvailableDate IS '시팅가능일';
COMMENT ON COLUMN A2CALENDAR.Available IS '가능동물수';
COMMENT ON TABLE A2FAVORITE IS '즐겨찾기';
COMMENT ON COLUMN A2FAVORITE.FavoriteNo IS 'FavoriteNo';
COMMENT ON COLUMN A2FAVORITE.FavoriteDate IS '즐겨찾기등록일';
COMMENT ON COLUMN A2FAVORITE.MemberNo IS '회원번호';
COMMENT ON COLUMN A2FAVORITE.SitterNo IS '시터번호';
COMMENT ON TABLE A2MEMBER IS '회원정보';
COMMENT ON COLUMN A2MEMBER.MemberNo IS '회원번호';
COMMENT ON COLUMN A2MEMBER.MemberID IS '아이디';
COMMENT ON COLUMN A2MEMBER.Password IS 'Password';
COMMENT ON COLUMN A2MEMBER.Name IS '이름';
COMMENT ON COLUMN A2MEMBER.Email IS 'Email';
COMMENT ON COLUMN A2MEMBER.Phone IS '연락처';
COMMENT ON COLUMN A2MEMBER.Address1 IS '주소1';
COMMENT ON COLUMN A2MEMBER.Address2 IS '주소2';
COMMENT ON TABLE A2MESSAGE IS '쪽지';
COMMENT ON COLUMN A2MESSAGE.MessageNo IS '메시지번호';
COMMENT ON COLUMN A2MESSAGE.SendNo IS '보낸회원번호';
COMMENT ON COLUMN A2MESSAGE.ReceiveNo IS '받은회원번호';
COMMENT ON COLUMN A2MESSAGE.MessageDate IS '날짜 및 시간';
COMMENT ON COLUMN A2MESSAGE.Text IS '내용';
COMMENT ON TABLE A2PET IS '펫';
COMMENT ON COLUMN A2PET.MemberNo IS '회원번호';
COMMENT ON COLUMN A2PET.PetNo IS '동물번호';
COMMENT ON COLUMN A2PET.Name IS '이름';
COMMENT ON COLUMN A2PET.Category IS '종류 : 개/고양이/기타';
COMMENT ON COLUMN A2PET.Species IS '품종 : Category가 기타인 경우 여기에 입력';
COMMENT ON COLUMN A2PET.AgeClass IS '나이구분 : 0 - 6개월 미만
1 - 1년 미만
2 - 1년 이상';
COMMENT ON COLUMN A2PET.Age IS '나이 : AgeClass가 2일때 입력';
COMMENT ON COLUMN A2PET.SEX IS '펫 성별';
COMMENT ON COLUMN A2PET.Neutralization IS '중성화여부';
COMMENT ON COLUMN A2PET.Vaccine1 IS 'Vaccine1';
COMMENT ON COLUMN A2PET.Vaccine2 IS 'Vaccine2';
COMMENT ON COLUMN A2PET.Vaccine3 IS 'Vaccine3';
COMMENT ON COLUMN A2PET.Vaccine4 IS 'Vaccine4';
COMMENT ON COLUMN A2PET.PetComment IS '코멘트';
COMMENT ON COLUMN A2PET.PetSize IS '크기 : 소형/중형/대형';
COMMENT ON TABLE A2PHOTO IS '사진';
COMMENT ON COLUMN A2PHOTO.PhotoNo IS '사진번호';
COMMENT ON COLUMN A2PHOTO.Category IS '사진 종류 : 사진 종류(펫, 시터, 집, 시팅)';
COMMENT ON COLUMN A2PHOTO.Location IS '사진 위치 : 업로드한 사진이 서버에 저장되는 주소(파일명 생략)';
COMMENT ON COLUMN A2PHOTO.OriginalName IS '원래 이름 : 업로드시 파일명';
COMMENT ON COLUMN A2PHOTO.SavedFileName IS '저장된파일이름 : 서버에 저장된 파일명';
COMMENT ON COLUMN A2PHOTO.PhotoDate IS '업로드한 날짜';
COMMENT ON COLUMN A2PHOTO.CustomerNo IS '회원번호';
COMMENT ON COLUMN A2PHOTO.SitterNo IS '회원번호';
COMMENT ON COLUMN A2PHOTO.SittingNo IS '시팅번호';
COMMENT ON COLUMN A2PHOTO.PetNo IS '동물번호';
COMMENT ON COLUMN A2PHOTO.public1 IS '회원의 공개여부 : 이 사진에 찍힌 펫의 주인인 회원이 이 사진을 공개해도 되는지를 표시한다.';
COMMENT ON COLUMN A2PHOTO.public2 IS '시터의 공개여부2 : 이 사진에 찍힌 펫을 시팅한 시터가 이 사진을 공개해도 되는지를 표시한다.';
COMMENT ON TABLE A2SITTER IS '시터정보';
COMMENT ON COLUMN A2SITTER.MemberNo IS '회원번호';
COMMENT ON COLUMN A2SITTER.SEX IS '성별';
COMMENT ON COLUMN A2SITTER.AGE IS 'AGE';
COMMENT ON COLUMN A2SITTER.AvailableCategory IS '가능동물';
COMMENT ON COLUMN A2SITTER.AvaliableNumber IS '시팅 가능 수';
COMMENT ON COLUMN A2SITTER.AvailableSize IS '가능크기 : 시팅가능한 최대 크기';
COMMENT ON COLUMN A2SITTER.HouseCategory IS '거주지 정보';
COMMENT ON COLUMN A2SITTER.SitterComment IS '본인 어필';
COMMENT ON COLUMN A2SITTER.License IS '자격증 : 자격증';
COMMENT ON COLUMN A2SITTER.status IS '상태 : 신청/신청취소/활동중/활동정지/수락실패';
COMMENT ON COLUMN A2SITTER.Pet IS '키우는 반려동물 여부';
COMMENT ON COLUMN A2SITTER.SittingLength IS '양육경력 : 년단위';
COMMENT ON COLUMN A2SITTER.Option1 IS '시팅옵션1';
COMMENT ON COLUMN A2SITTER.Option2 IS '시팅옵션2';
COMMENT ON COLUMN A2SITTER.Option3 IS '시팅옵션3';
COMMENT ON COLUMN A2SITTER.Account IS '계좌번호';
COMMENT ON TABLE A2SitterRating IS '시터평가';
COMMENT ON COLUMN A2SitterRating.RatingNo IS '평가번호';
COMMENT ON COLUMN A2SitterRating.Rating IS 'Rating : 10점 만점';
COMMENT ON COLUMN A2SitterRating.RatingDate IS '평가일';
COMMENT ON COLUMN A2SitterRating.MemberNo IS '회원번호';
COMMENT ON COLUMN A2SitterRating.SitterNo IS '회원번호';
COMMENT ON COLUMN A2SitterRating.RatingComment IS '평가 코멘트';
COMMENT ON COLUMN A2SitterRating.SittingNo IS '시팅 번호';
COMMENT ON TABLE A2SITTING IS '시팅 정보';
COMMENT ON COLUMN A2SITTING.SittingNo IS '시팅번호';
COMMENT ON COLUMN A2SITTING.CustomerNo IS '회원번호';
COMMENT ON COLUMN A2SITTING.SitterNo IS '회원번호';
COMMENT ON COLUMN A2SITTING.PetNo IS '동물번호';
COMMENT ON COLUMN A2SITTING.Status IS '상태 : 종료, 진행, 수락, 신청, 취소';
COMMENT ON COLUMN A2SITTING.requestDate IS '신청일';
COMMENT ON COLUMN A2SITTING.StartDate IS '시작(예정)일';
COMMENT ON COLUMN A2SITTING.EndDate IS '종료(예정)일';
COMMENT ON COLUMN A2SITTING.Option1 IS 'Option1';
COMMENT ON COLUMN A2SITTING.Option2 IS 'Option2';
COMMENT ON COLUMN A2SITTING.Option3 IS 'Option3';
COMMENT ON COLUMN A2SITTING.Price IS '가격';
COMMENT ON TABLE A2TRANSACTION IS '결제정보';
COMMENT ON COLUMN A2TRANSACTION.TransactionNo IS '결제번호';
COMMENT ON COLUMN A2TRANSACTION.SittingNo IS '시팅번호';
COMMENT ON COLUMN A2TRANSACTION.Category IS 'Category : 결제/지불';
COMMENT ON COLUMN A2TRANSACTION.Ammount IS '금액';
COMMENT ON COLUMN A2TRANSACTION.TransactionDate IS '결제/지불일';



 
select memberNo from a2sitter;
update A2SITTER set availablecategory = '고양이' where memberno = 42;
select * from a2sitter;