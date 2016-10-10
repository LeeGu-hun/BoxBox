package place;

import java.util.List;

import dao.DaoMember;
import rental.RentalSearch;

public class PlaceService {
	private DaoMember daoMember;



	public PlaceService(DaoMember daoMember) {
		super();
		this.daoMember = daoMember;
	}


	public List<Place> comboPlace(String postId){
		List<Place> results = daoMember.comboPlace(postId);
		return results;
	}

	public List<Place> comboPost(){
		List<Place> results = daoMember.comboPost();
		return results;
	}
	public RentalSearch rentalSearch(String placeName){
		RentalSearch results = daoMember.rentalSearch(placeName);
		return results;
	}
}
