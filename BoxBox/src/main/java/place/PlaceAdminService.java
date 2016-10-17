package place;

import java.util.List;

import dao.DaoMemberAdmin;

public class PlaceAdminService {
	
	private DaoMemberAdmin daoMemberAdmin;

	public PlaceAdminService(DaoMemberAdmin daoMemberAdmin) {
		super();
		this.daoMemberAdmin = daoMemberAdmin;
	}
	
	public List<Place> comboPlace(String postId) {
		List<Place> results = daoMemberAdmin.comboPlace(postId);
		return results;
	}

	public List<Place> comboPost() {
		List<Place> results = daoMemberAdmin.comboPost();
		return results;
	}

}
