package place;

import java.util.List;

import dao.DaoMember;
import memberAdmin.Item;
import rental.MyRental;
import rental.TimeSearch;

public class PlaceService {
	private DaoMember daoMember;

	public PlaceService(DaoMember daoMember) {
		super();
		this.daoMember = daoMember;
	}

	public List<Place> comboPlace(String postId) {
		List<Place> results = daoMember.comboPlace(postId);
		return results;
	}
	public List<Place> placeAll() {
		List<Place> results = daoMember.placeAll();
		return results;
	}
	public List<Item> itemAll() {
		List<Item> results = daoMember.itemAll();
		return results;
	}

	public List<Place> comboPost() {
		List<Place> results = daoMember.comboPost();
		return results;
	}

	public TimeSearch timeSearch(String rentalId) {
		TimeSearch results = daoMember.timeSearch(rentalId);
		return results;
	}

	public void orderInsert(String rentalId, String userId, String startTime, String endTime, String orderPrice, String password) {
		daoMember.orderInsert(rentalId, userId, startTime, endTime, orderPrice, password);

	}
	public void delete(String orderListId) {
		daoMember.delete(orderListId);
		
	}
	public List<MyRental> myrental(String userId){
		List<MyRental> results = daoMember.myRental(userId);
		return results;
	}
	public List<City> selectCity(){
		List<City> results = daoMember.selectCity();
		return results;
	}
	// public TimeSearch timeSearch(String rentalId, String startTime, String
	// endTime, String orderDate,
	// String orderDate1) {
	// TimeSearch results = daoMember.timeSearch(rentalId, startTime, endTime,
	// orderDate, orderDate1);
	// return results;
	// }
}
