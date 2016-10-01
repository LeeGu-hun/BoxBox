package place;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import dao.DaoMember;

public class PlaceService {
	private DaoMember daoMember;


	

	public PlaceService(DaoMember daoMember) {
		super();
		this.daoMember = daoMember;
	}


	public List<Place> comboPlace(){
		List<Place> results = daoMember.comboPlace();
		return results;
	}
}
