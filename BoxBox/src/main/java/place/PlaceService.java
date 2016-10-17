package place;

import java.util.List;

import dao.DaoMember;
import rental.MyRental;
import rental.OrderInsert;
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

	public List<Place> comboPost() {
		List<Place> results = daoMember.comboPost();
		return results;
	}

	public TimeSearch timeSearch(String rentalId) {
		TimeSearch results = daoMember.timeSearch(rentalId);
		return results;
	}

	public OrderInsert orderInsert(String rentalId, String userId, String startTime, String endTime, String orderPrice, String password) {
		OrderInsert results = daoMember.orderInsert(rentalId, userId, startTime, endTime, orderPrice, password);
		return results;
	}
	public List<MyRental> myrental(String userId){
		List<MyRental> results = daoMember.myRental(userId);
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
