package org.petopia.utility;

import java.util.HashMap;

import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.model.GeocodingResult;

public class GeoCoding {

	/**
	 * address를 받아서 geoCoding된 정보를 반환한다.
	 * 
	 * @param address
	 * @return geoCodingMap을 반환(위도, 경도, bound 각각이 들어감)
	 * @throws Throwable
	 */
	public HashMap<String, Double> getCodingFromAddress(String address) {
		GeoApiContext context = new GeoApiContext().setApiKey("AIzaSyAUxUNaPOuZkaNc41lipW3Q9Ik5yzQ8AOg");
		HashMap<String, Double> geoCodingMap = new HashMap<>();
		GeocodingResult[] results = null;
		try {
			results = GeocodingApi.geocode(context, address).await();
		} catch (Exception e) {
			e.printStackTrace();
		}
		double lat = 0;
		double lng = 0;
		double bound_northeast_lat = 0;
		double bound_northeast_lng = 0;
		double bound_southwest_lat = 0;
		double bound_southwest_lng = 0;
		boolean checker = false;
		System.out.println("length = " + results.length);
		for (GeocodingResult geocodingResult : results) {

			lat = geocodingResult.geometry.location.lat;
			lng = geocodingResult.geometry.location.lng;
			geoCodingMap.put("lat", lat);
			geoCodingMap.put("lng", lng);
			if (geocodingResult.geometry.bounds != null) {
				bound_northeast_lat = geocodingResult.geometry.bounds.northeast.lat;
				bound_northeast_lng = geocodingResult.geometry.bounds.northeast.lng;
				bound_southwest_lat = geocodingResult.geometry.bounds.southwest.lat;
				bound_southwest_lng = geocodingResult.geometry.bounds.southwest.lng;
				geoCodingMap.put("bound_northeast_lat", bound_northeast_lat);
				geoCodingMap.put("bound_northeast_lng", bound_northeast_lng);
				geoCodingMap.put("bound_southwest_lat", bound_southwest_lat);
				geoCodingMap.put("bound_southwest_lng", bound_southwest_lng);
				checker = true;
			}

			// System.out.println("bount_northeast: " + bound_northeast_lat + ",
			// " + bound_northeast_lng);
			// System.out.println("bound_southwest: " + bound_southwest_lat + ",
			// " + bound_southwest_lng);
		}

		System.out.println("location: " + lat + ", " + lng);
		return geoCodingMap;
	}

	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
	}
}
