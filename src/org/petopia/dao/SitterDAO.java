package org.petopia.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.petopia.utility.MybatisConfig;
import org.petopia.vo.Calendar;
import org.petopia.vo.Member;
import org.petopia.vo.Pet;
import org.petopia.vo.Photo;
import org.petopia.vo.Sitter;
import org.petopia.vo.Sitting;

public class SitterDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	private SqlSession ss = null;

	// mybatis와 연계하는 메소드들 정의.. //

	/* 파라미터로 받는 memberNo의 멤버의 address1정보를 가져오는 메소드 */
	public String searchMemberAddress(int memberNo) {
		String result = null;
		try {
			ss = factory.openSession();
			result = ss.selectOne("Sitter.searchMemberAddress", memberNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	/* 현재 접속한 멤버와 같은 지역의 시터리스터 정보 가져옴 */
	public List<Sitter> searchSitter(String loginMemberAddress) {
		List<Sitter> result = null;
		try {
			ss = factory.openSession();
			result = ss.selectList("Sitter.searchSitter", loginMemberAddress);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	/*
	 * 로그인 안했을 시, 메인창에 뜨는 시터검색 : delete예정 public List<Sitter> getAllSitterList()
	 * { List<Sitter> result = null; try{ ss = factory.openSession(); result =
	 * ss.selectList("Sitter.getAllSitterList"); }catch(Exception e){
	 * e.printStackTrace(); }finally{ if(ss != null){ ss.close(); } } return
	 * result; }
	 */
	
	/**
	 * 좌표계를 이용해서 근처의 시터를 찾는다.
	 * @param Address : 좌표를 추출할 주소
	 * @return 검색된 시터 리스트
	 */
	public List<Sitter> searchSitterByLatAndLng(HashMap<String, Object> parameterMap){
		List<Sitter> result = null;
		
		try (SqlSession ss = factory.openSession()) {
			result = ss.selectList("Sitter.searchSitterByLatAndLng", parameterMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	/**
	 * 주소정보를 파라미터로 받아 시터검색(멤버, 시터 정보 둘 다 가져옴) ==> 사실 로그인된 멤버와 매칭할 시터검색메소드랑 같은구조
	 */
	public List<Sitter> searchAddressSitter(HashMap<String, String> searchList) {
		List<Sitter> result = null;

		try {
			ss = factory.openSession();
			result = ss.selectList("Sitter.searchAddressSitter", searchList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	/**
	 * 메인검색창에서 맡길날짜, 찾을 날짜로 멤버 넘버 찾긔.
	 * 
	 * @param takeDate
	 *            : 맡길 날짜
	 * @param returnDate
	 *            : 찾을 날짜
	 * @return 회원 번호 리스트
	 */
	public List<Integer> searchCal(String takeDate, String returnDate) {
		List<Integer> result = null;
		Map<String, Object> map = new HashMap<>();

		map.put("takeDate", takeDate);
		map.put("returnDate", returnDate);
		try {
			ss = factory.openSession();
			result = ss.selectList("Sitter.searchCal", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	/**
	 *  사진번호를 파라미터로 받아서 시터 사진 정보 가져오기
	 */
	public Photo getPhoto(int photoNo) {
		Photo result = null;
		try {
			ss = factory.openSession();
			result = ss.selectOne("Sitter.searchSitterPicture", photoNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	/**
	 *  시터번호를 파라미터로 받아서 시터 상세 정보 가져오기 
	 */
	public Sitter searchNoSitter(int sitterNo) {
		Sitter result = null;
		try {
			ss = factory.openSession();
			result = ss.selectOne("Sitter.searchDetailSitter", sitterNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	/**
	 *  시터번호 파라미터로 받아서 시터 집사진들 불러오기
	 */
	public List<Photo> photoNoList(int memberNo) {
		List<Photo> result = null;
		try {
			ss = factory.openSession();
			result = ss.selectList("Sitter.listHousePhotoNo", memberNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	/* 탑9랭킹 시터 번호만 */
	public List<Integer> listSitterNo() {
		List<Integer> result = null;
		try {
			ss = factory.openSession();
			result = ss.selectList("Sitter.listSitterNo");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	/* 탑9랭킹 시터 번호로 시터 정보, 사진 불러오기 */
	public Sitter searchTopRanker(int sitterNo) {
		Sitter result = null;
		try {
			ss = factory.openSession();
			result = ss.selectOne("Sitter.searchTopRanker", sitterNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	public double pullAvgRate(int sitterNo) {
		double rating = 0;
		try (SqlSession ss = factory.openSession()) {
			rating = ss.selectOne("Sitter.pullAvgRate", sitterNo);
		} catch (NullPointerException ne) {
			System.out.println("평가 점수가 없습니다");
			rating = 0;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return rating;
	}

	public Member searchMember(int memberNo) {
		Member result = null;
		try {
			ss = factory.openSession();
			result = ss.selectOne("Sitter.searchMember", memberNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	public Photo searchOnePhoto(int memberNo) {
		Photo result = null;
		try {
			ss = factory.openSession();
			result = ss.selectOne("Sitter.searchOnePhoto", memberNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	public List<Calendar> searchUnavailableDate(int memberNo) {
		List<Calendar> result = null;
		try {
			ss = factory.openSession();
			result = ss.selectList("Sitter.searchUnavailableDate", memberNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	/** 진행중 시팅리스트 */
	public List<Sitting> searchSittingList(int sitterNo) {
		List<Sitting> result = null;
		try {
			ss = factory.openSession();
			result = ss.selectList("Sitter.searchSittingList", sitterNo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	/** 신청받은 시팅리스트 */
	public List<Sitting> searchRequestedSitting(int sitterNo) {
		List<Sitting> result = null;
		try {
			ss = factory.openSession();
			result = ss.selectList("Sitter.searchRequestedSitting", sitterNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	/** 수락한 시팅리스트 */
	public List<Sitting> searchApprovedSitting(int sitterNo) {
		List<Sitting> result = null;
		try {
			ss = factory.openSession();
			result = ss.selectList("Sitter.searchApprovedSitting", sitterNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	/** 완료된 시팅리스트 */
	public List<Sitting> searchCompletedSitting(int sitterNo) {
		List<Sitting> result = null;
		try {
			ss = factory.openSession();
			result = ss.selectList("Sitter.searchSittingList", sitterNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	public Photo searchPhotoList(int petNo) {
		Photo result = null;
		try {
			ss = factory.openSession();
			result = ss.selectOne("Sitter.searchPhotoList", petNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	public Pet searchPet(int petNo, int memberNo) {
		Pet result = null;
		HashMap<String, Object> map = new HashMap<>();
		map.put("petNo", petNo);
		map.put("memberNo", memberNo);
		try {
			ss = factory.openSession();
			result = ss.selectOne("Sitter.searchPet", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	public List<Photo> searchSittingPhotoList(int savedSittiongNo) {
		List<Photo> result = null;
		try {
			ss = factory.openSession();
			result = ss.selectList("Sitter.searchSittingPhotoList", savedSittiongNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	public List<Sitting> pullSittingList(int sitterNo, String status) {
		HashMap<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("sitterNo", sitterNo);
		parameterMap.put("status", status);
		List<Sitting> sittingList = null;
		try (SqlSession ss = factory.openSession()) {
			sittingList = ss.selectList("Sitter.pullSittingList", parameterMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sittingList;
	}

}
